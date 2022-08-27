# rsync

> rsync

## 资源

> [官网](https://rsync.samba.org/)
>
>   - [](https://download.samba.org/pub/rsync/binaries/) | [rsync-3.2.3.tar.gz](https://download.samba.org/pub/rsync/binaries/centos-7.8-x86_64/rsync-3.2.3.tar.gz)
>   - [](https://github.com/WayneD/rsync/releases)


> [真正的inotify+rsync实时同步 彻底告别同步慢](http://www.ttlsa.com/web/let-infotify-rsync-fast/)

> [](https://segmentfault.com/a/1190000002427568)


## 简介

rsync 是 linux 系统中的，数据镜像备份工具。使用快速增量备份工具Remote Sync可以远程同步，支持本地复制，或者与其他SSH、rsync主机同步。

 - 可以镜像保存整个目录树和文件系统

 - 可以很容易做到保持原来文件的权限、时间、软硬链接等等

 - 无须特殊权限即可安装

 - 快速：第一次同步时rsync会复制全部内容，但在下一次只传输修改过的文件。rsync在传输数据的过程中可以实行压缩及解压缩操作，因此可以使用更少的带宽

 - 安全：可以使用scp、ssh等方式来传输文件，当然也可以通过直接的socket连接

 - 支持匿名传输，以方便进行网站镜象

其具有安全性高、备份迅速、支持增量备份等优点，通过rsync可以解决对实时性要求不高的数据备份需求，例如定期地备份文件服务器数据到远程服务器上，对本地磁盘定期进行数据镜像等

其缺点时，同步数据时，需要扫描所有文件后进行比对，然后进行差量传输。如果文件数量达到了百万量级及以上时，扫描文件就非常耗费时间，有时还会出现只是很少一部分数据发生了变化，因此rsync就变得非常低效了。不能够实时监测、同步数据，虽然它可以通过Linux守护进程的方式触发同步，但是两次触发动作一定会出现时间差，可能导致服务器端和客户端的数据出现不一致，后期无法在出现故障时完全恢复数据。

工作模式

  1. shell 模式，使用远程shell程序（如ssh或rsh）进行连接，并传同步文件

  2. daemon 模式，使用TCP直接连接rsync daemon，此时 目标服务器必须启动守护进程，默认端口 873


## 安装部署

> yum -y install rsync


### 安装

#### 1. 客户端配置，作为 推送方 将本地文件 推送到 目标 服务器

> 只需要安装，设置认证密码

> vim /etc/rsyncd/client.password && chmod 600 /etc/rsyncd/client.password 

```client.password
123456
```

> rsync -avH --port 873 --delete /home/source root@10.123.234.236::module_home_source --password-file=/etc/client.password

/usr/bin/rsync -avH --port 873 --delete /home/ykdl/vsftpd/data/root/home/ftpadmin/ftp_files/1 root@10.11.0.236::module_home_ftp --password-file=/etc/rsyncd/client.password

/usr/bin/rsync -auvrtzopgP --exclude-from=/etc/rsyncd/exclude.lst --progress --bwlimit=200 --password-file=/etc/rsyncd/client.password /home/ykdl/vsftpd/data/root/home/ftpadmin/ftp_files root@10.11.0.236::module_home_ftp


#### 2. 手动同步测试

##### 同步本地服务器文件夹

> rsync -auvrtzopgP --progress  /home/source/ /home/target/  # 本机文件夹同步，同步文件夹，从 源 同步到目标; 源文件夹必须存在

- 删除/root/下的文件不会同步删除/tmp/rsync_bak，除非加入--delete选项
- 文件访问时间等属性、读写等权限、文件内容等有任何变动，都会被认为修改
- 目标目录下如果文件比源目录还新，则不会同步
- 源路径的最后是否有斜杠有不同的含义：有斜杠，只是复制目录中的文件；没有斜杠的话，不但要复制目录中的文件，还要复制目录本身


##### 同步到远程服务器，服务端配置，作为 目标服务器，接收客户端 推送来的文件

> **配置 服务端**

1. 配置 /etc/rsyncd/rsyncd.secrets

echo "root:123456" > /etc/rsyncd/rsyncd.secrets && chmod 600 /etc/rsyncd/rsyncd.secrets

```conf /etc/rsyncd/rsyncd.secrets && chmod 600 /etc/rsyncd/rsyncd.secrets
root:123456
# 解析：用户名:密码，一行一个用户，此处和操作系统用户名密码无关，可以随意指定，但是需要和 /etc/rsyncd.conf中的auth users对应
```

2. 配置 /etc/rsyncd.conf

```conf vim /etc/rsyncd.conf 服务端配置文件
; uid=root
; gid=root
; use chroot=no
; max connections=10
; timeout=600
; strict modes=yes
; port=873
; pid file=/var/run/rsyncd.pid
; lock file=/var/run/rsyncd.lock
; log file=/var/log/rsyncd.log

; [module_home_source]
;     path=/home/source
;     comment=rsync test logs
;     auth users=root
;     uid=root
;     gid=root
;     secrets file=/etc/rsyncd/rsyncd.secrets
;     read only=no
;     list=no
;     hosts allow=192.168.0.0/16
;     hosts deny=0.0.0.0/32

- 配置socket方式传输文件，端口873
- [module_test]开始定义一个模块，指定要同步的目录（接收）path，授权用户，密码文件，允许哪台服务器IP同步（发送）等
----

log file = /var/log/rsyncd.log  
pid file = /var/run/rsyncd.pid  
lock file = /var/run/rsync.lock
secrets file = /etc/rsyncd/rsyncd.secrets

[module_home_source]
    path=/home/source
	  comment = sync etc from client
	  uid = root   
	  gid = root    
	  port = 873     
	  ignore errors   
	  use chroot = no  
	  read only = no 
	  list = no    
	  max connections = 200 
	  timeout = 600    
	  auth users = root 
	  hosts allow = *
	  hosts deny = 192.168.1.1
```

> **启动服务端**

> /usr/bin/rsync --daemon --config=/etc/rsyncd.conf

> ps -ef | grep rsync

> echo "/usr/local/bin/rsync --daemon" >> /etc/rc.local

> systemctl start rsyncd

> systemctl enable rsyncd

> ps -ef | grep rsync  # 查看进程是否启动

> service xinetd restart  # 启动，使用默认 /etc/rsyncd.conf

```conf /etc/xinetd.d/rsync
# default: off
# description: The rsync server is a good addition to an ftp server, as it \
#   allows crc checksumming etc.
service rsync
{
    disable         = no
    flags           = IPv6
    socket_type     = stream
    wait            = no
    user            = root
    server          = /usr/bin/rsync
    server_args     = --daemon
    log_on_failure  += USERID
}
```

> **配置 客户端配**

1. 配置 password

vim /etc/rsyncd/client.password && chmod 600 /etc/rsyncd/client.password

```conf /etc/rsyncd/client.password
123456
```

2. 客户端 执行同步

> a. 将 “本地 /home/source/ 目录” 同步到 “远程192.168.10.107的 module_home_source 指定的/home/source/ 目录”

> /usr/bin/rsync -auvrtzopgP --progress --password-file=/etc/rsyncd/client.password /home/source/ root@192.168.10.107::module_home_source 

> b. 将 “远程192.168.10.107的 module_home_source 指定的/home/source/ 目录” 同步到 “本地目录 /home/source/”

> /usr/bin/rsync -auvrtzopgP --progress --password-file=/etc/rsyncd/client.password root@192.168.10.107::module_home_source /home/source/


### 运行部署

Rsync 排除同步目录，--exclude和--exclude-from两种写法，使用--include-from=FILE时，排除文件列表用绝对路径，但FILE里面的内容请用相对路径

> /etc/rsyncd.d/rsync_exclude.lst 排除同步的内容包括，mail下的2014目录，类似2015/201501/20150101/下的临时或隐藏文件，等。

```
mail/2014/
mail/201*/201*/201*/.??*
mail??*
src/*.html*
src/js/
src/ext3/
src/2014/20140[1-9]/
src/201*/201*/201*/.??*
membermail/
membermail??*
membermail/201*/201*/201*/.??*
```

