# ntp install

>

## 资源

## 安装

### 服务

> yum -y install ntp                 # 客户端服务端都会安装上

ntp-4.2.6p5-1.el6.x86_64.rpm         # NTP服务端软件包
ntpdate-4.2.6p5-1.el6.x86_64.rpm     # NTP客户端软件包

### 

### 服务端配置

> vim /etc/ntp.conf

```
[root@linl_S ~]# vi /etc/ntp.conf
# Permit all access over the loopback interface.  This could
# be tightened as well, but to do so would effect some of
# the administrative functions.
restrict 127.0.0.1
restrict -6 ::1
restrict 10.0.0.0 mask 255.255.255.0       # 允许10.0.0.0 网段中的服务器访问本ntp服务器进行时间同步
restrict 10.0.0.16                         # 允许单个IP地址访问本ntp服务器
# Use public servers from the pool.ntp.org project.
# Please consider joining the pool (http://www.pool.ntp.org/join.html).
# 指定本ntp服务器的上游ntp服务器为210.72.145.44，并且设置为首先服务器。同步时间为：从上到下，写的越靠上，优先级越高。（此服务器同步不了时间，寻找下一个ntp服务器）。此IP地址是中国国家授时中心ntp服务器。
server 210.72.145.44
# 当上面服务器同步不了，则寻找第二个。此IP地址是日本福冈大学ntp服务器。
server 133.100.11.8
server 0.rhel.pool.ntp.org iburst
server 1.rhel.pool.ntp.org iburst
server 2.rhel.pool.ntp.org iburst
server 3.rhel.pool.ntp.org iburst
server 127.127.1.0      　　　　 # local clock 如果上面的服务器都无法同步时间，就和本地系统时间同步。127.127.1.0在这里是一个IP地址，不是网段。
fudge 127.127.1.0 stratum 10    # 127.127.1.0 为第10层。ntp 和127.127.1.0同步完后，就变成了11层。  ntp是层次阶级的。同步上层服务器的stratum 大小不能超过或等于16。
```

### 客户端配置

> rpm -ivh /mnt/Packages/ntpdate-4.2.6p5-1.el6.x86_64.rpm  # 只安装客户端

> vim /etc/ntp.conf


### NTP 服务启动关闭

> service ntpd start           # 启动ntp服务
> /etc/init.d/ntpd start       # 启动ntp服务

> chkconfig ntpd on            # 开机自启动

> netstat -anptu | grep 123    # 查看端口123是否开放

> service ntpd stop            # 停止ntp服务

> ntpq -p                      # 列出目前我们的NTP与相关的上层NTP的状态

```
[root@linl_S ~]# ntpq -p
     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
*LOCAL(0)        .LOCL.          10 l   40   64  377    0.000    0.000   0.000

remote: 即remote - 本机和上层ntp的ip或主机名，“+” 表示优先，“*” 表示次优先。
refid:  参考的上一层NTP主机的地址
st:     即stratum阶层
poll:   下次更新在几秒之后
offset: 时间补偿的结果
```

> ntpstat                       # 列出是否与上游服务器连接。需要过5分钟

```
[root@linl_S ~]# ntpstat         #列出是否与上游服务器连接。需要过5分钟
synchronised to NTP server (202.112.29.82) at stratum 3     #可以看到我们当前在3层
   time correct to within 257 ms    #ms 毫秒是一种较为微小的时间单位，是一秒的千分之一。
   polling server every 64 s
```


### 手动同步

> 在lin_S服务器上查看可用的NTP时间服务器

```
[root@linl_S ~]# vi /etc/ntp.conf 
# Use public servers from the pool.ntp.org project.
# Please consider joining the pool (http://www.pool.ntp.org/join.html).
server 0.rhel.pool.ntp.org iburst       # 找一个可以使用的NTP时间服务器
server 1.rhel.pool.ntp.org iburst
server 2.rhel.pool.ntp.org iburst
server 3.rhel.pool.ntp.org iburst
```

> 在lin_C客户端上与NTP时间服务器进行同步

```
[root@linl_C ~]# date -s "2015-5-23 11:30"    # 先设置一个错误的时间点
Sat May 23 11:30:00 CST 2015

[root@linl_C ~]# ntpdate lin_S    # 进行ntp时间同步 / ntpdate 0.rhel.pool.ntp.org
23 May 11:34:10 ntpdate[6686]: step time server 10.0.0.15 offset 31622622.275270 sec

[root@linl_C ~]# date
Mon May 23 11:34:16 CST 2016      # 时间同步成功
```

> 配合cron命令，来进行定期同步设置。比如，在crontab 中添加：

```
[root@linl_C ~]# crontab -e
0 12 * * * /usr/sbin/ntpdate lin_S
```

> 使用ntpd 服务进行自动同步，要注意的是，ntpd 有一个自我保护设置：如果本机与上源时间相差太大，ntpd 不运行。所以新设置的时间服务器一定要先ntpdate 从上源取得时间初值。然后启动ntpd 服务。


### 问题

1. Q : 22 May 22:06:17 ntpdate[2464]: the NTP socket is in use, exiting

在lin_S服务端（已启动NTP服务）与NTP时间服务器进行同步会报错。出现该错误的原因是lin_S服务器正在运行ntpd服务，就不能用ntpdate来手动更新时间了。

