# keepalived

> 

## 资源

> [官网](https://www.keepalived.org/index.html)
>
>   - [文档](https://www.keepalived.org/manpage.html)

> [Keepalived原理](https://blog.csdn.net/qq_24336773/article/details/82143367)
>
> [keepalived原理及常用的配置参数](https://blog.51cto.com/essun/1405642)
>
> [Keepalive介绍及工作原理](https://www.jianshu.com/p/ea412143e017)

> [KeepAlive + VIP 配置高可用 Nginx 主备集群](https://blog.csdn.net/shida_csdn/article/details/80739859)
>
> [Nginx+keepalive做双机热备（主主模式）实现负载均衡](https://blog.51cto.com/3381847248/1975117)
>
> [KeepAlive + VIP 配置高可用 Nginx 主备集群](https://blog.csdn.net/shida_csdn/article/details/80739859)
>
> [Nginx+Keepalived高可用集群](https://blog.51cto.com/superpcm/2095395)

> https://www.jianshu.com/p/d62081d2bb37

> [虚拟路由冗余协议(VRRP)](https://blog.csdn.net/qq_38265137/article/details/80404440)
>
> [华为拓扑---vrrp（虚拟路由器冗余协议）的使用](https://blog.51cto.com/13445059/2062255)
>
> [虚拟路由器冗余协议【原理篇】VRRP详解](https://blog.51cto.com/zhaoyuqiang/1166840)
>
> [vrrp路由器三种状态_VRRP（虚拟路由器冗余协议）知识点梳理](https://blog.csdn.net/weixin_35974411/article/details/112184029)

## 简介

keepalive 是 Linux下一个轻量级别的高可用解决方案，其原理是通过 vrrp（虚拟路由冗余协议）实现高可用（High Avalilability, HA）。

![VRRP协议原理](https://upload-images.jianshu.io/upload_images/17074136-9fed59fa72ef6b2e.png?imageMogr2/auto-orient/strip|imageView2/2/w/690/format/webp)

![](https://upload-images.jianshu.io/upload_images/16973075-b29105b83d74503a.png?imageMogr2/auto-orient/strip|imageView2/2/w/1055/format/webp)

抢占式和非抢占式, 默认配置为抢占式：master挂掉，backup上台，master重新启动则将IP抢占过去。非抢占式配置：两台均为backup，在优先级上做区分，如master挂掉，backup上台，则backup变成master，master变为backup

高可用(High Avalilability,HA)，其实两种不同的含义：广义来讲，是指整个系统的高可用行，狭义的来讲就是之主机的冗余和接管， 它与HeartBeat RoseHA 实现相同类似的功能，都可以实现服务或者网络的高可用，但是又有差别，HeartBeat是一个专业的、功能完善的高可用软件，它提供了HA 软件所需的基本功能，比如：心跳检测、资源接管，检测集群中的服务，在集群节点转移共享IP地址的所有者等等。HeartBeat功能强大，但是部署和使用相对比较麻烦，与HeartBeat相比，Keepalived主要是通过虚拟路由冗余来实现高可用功能，虽然它没有HeartBeat功能强大，但是Keepalived部署和使用非常的简单，所有配置只需要一个配置文件即可以完成。

负载均衡器（Load Balancer, LB ）是一组能够将IP数据流以负载均衡形式转发到多台物理服务器的集成软件。


### VRRP (Virtual Router Redundancy Protocol，虚拟路由冗余协议)

其，由IETF提出的解决局域网中配置静态网关出现单点失效现象的路由协议，1998年已推出正式的RFC2338协议标准。VRRP广泛应用在边缘网络中，它的设计目标是支持特定情况下IP数据流量失败转移不会引起混乱，允许主机使用单路由器，以及即使在实际第一跳路由器使用失败的情形下仍能够维护路由器间的连通性。

VRRP，是一种选择协议，它可以把一个**虚拟路由器**的责任动态分配到**局域网上的 VRRP 路由器**中的一台。

![](https://bkimg.cdn.bcebos.com/pic/9f2f070828381f3059efe42ba7014c086f06f0ba)

通过把几台路由设备联合组成一台虚拟的路由设备，将虚拟路由设备的IP地址作为用户的默认网关实现与外部网络通信。当网关设备发生故障时，VRRP机制能够选举新的网关设备承担数据流量，从而保障网络的可靠通信。

其，能够在不改变组网的情况下，采用将多台路由设备组成一个虚拟路由器，通过配置虚拟路由器的IP地址为默认网关，实现默认网关的备份。当网关设备发生故障时，VRRP机制能够选举新的网关设备承担数据流量，从而保障网络的可靠通信。

在具有多播或广播能力的局域网（如以太网）中，借助VRRP能在网关设备出现故障时仍然提供高可靠的缺省链路，无需修改主机及网关设备的配置信息便可有效避免单一链路发生故障后的网络中断问题。


控制虚拟路由器 IP 地址的 VRRP 路由器称为主路由器，它负责转发数据包到这些虚拟 IP 地址。一旦主路由器不可用，这种选择过程就提供了动态的故障转移机制，这就允许虚拟路由器的 IP 地址可以作为终端主机的默认第一跳路由器。

VRRP，是一种LAN接入设备备份协议。一个局域网络内的所有主机都设置缺省网关，这样主机发出的目的地址不在本网段的报文将被通过缺省网关发往三层交换机，从而实现了主机和外部网络的通信。

其，是一种路由容错协议，也可以叫做备份路由协议。

在VRRP协议中，有两组重要的概念：VRRP路由器和虚拟路由器，主控路由器和备份路由器。

VRRP路由器是指运行VRRP的路由器，是物理实体；虚拟路由器是指VRRP协议创建的，是逻辑概念。一组VRRP路由器协同工作，共同构成一台虚拟路由器。该虚拟路由器对外表现为一个具有唯一固定的IP地址和MAC地址的逻辑路由器。处于同一个VRRP组中的路由器具有两种互斥的角色：主控路由器和备份路由器，一个VRRP组中有且只有一台处于主控角色的路由器，可以有一个或者多个处于备份角色的路由器VRRP协议从路由器组中选出一台作为主控路由器，负责ARP解析和转发IP数据包，组中的其他路由器作为备份的角色并处于待命状态，当由于某种原因主控路由器发生故障时，其中的一台备份路由器能在瞬间的时延后升级为主控路由器，由于此切换非常迅速而且不用改变IP地址和MAC地址，故对终端使用者系统是透明的。

协议对VRRP规定了3种状态：INITIALIZE，MASTER和BACKUP。简单地说，INITIALIZE即初始态，MASTER即主用状态，也就是在VRRP备份组中真正起作用的路由器，BACKUP即备用状态，是MASTER的备份。

Virtual Router

虚拟路由器，一个抽象对象，基于子网接口，包括一个虚拟路由器标识符（VRID）和一个或多个IP地址，这个（些）IP地址又称为虚拟IP地址，虚拟IP地址作为主机的默认网关。

VRRP Router

VRRP路由器，即运行VRRP协议的路由器，一个VRRP路由器可以加入到一个或多个虚拟路由器中。

IP Address Owner

IP地址拥有者，虚拟路由器的虚拟IP地址与接口的真实IP地址相同的VRRP路由器。

Virtual Router Master

虚拟主路由器，负责转发通过虚拟路由器的三层数据包，对虚拟路由器的IP地址的ARP请求进行回应。如果某个VRRP路由器是IP地址拥有者，则它总是虚拟主路由器。

Virtual Router Backup

虚拟备份路由器，不转发三层数据包，不应答虚拟IP地址的ARP请求，当虚拟主路由器出现故障时接替虚拟主路由器的工作。


## 安装部署

### 安装

> yum install -y keepalived

> rpm -qc keepalived
/etc/keepalived/keepalived.conf
/etc/sysconfig/keepalived

> 安装 虚拟网卡

> ifconfig eth0:1 192.168.10.5 netmask 255.255.255.0 up  新增IP在这个网卡上，eth0网卡上创建一个叫eth0:0的虚拟网卡

> ip addr del 192.168.10.63 dev eth0:1 删除

> ifconfig eth0:1 down 删除虚拟网卡

> 配置文件安装

vim /etc/network/interfaces

auto eth0:0
iface eth0:0 inet static
address 192.168.10.10
netmask 255.255.255.0
#network 192.168.10.1
#broadcast 192.168.1.255

/etc/init.d/networking restart  # 重启生效

> 添加虚拟网卡

brctl show          # 显示网桥信息

brctl addbr virbr0  # 添加网桥

ip link set virbr0 up  # 激活网桥

tunctl -b  # 添加虚拟网卡tap ，tap0 -------> 执行上面使命就会生成一个tap, 后缀从0，1，2 依次递增  

ip link set tap0 up  # 激活创建的tap

brctl addif br0 tap0 # 将tap0虚拟网卡添加到指定网桥上

ifconfig virbr1 169.254.251.4 up   # 给网桥配制ip地址

brctl delif virb1 eth5   # 将virbr1网桥上绑定的网卡eth5解除

brctl addif virbr1 eth6  # 给virbr1网桥添加网卡eth6


### 配置

> cat /etc/keepalived/keepalived.conf

抢占式配置  ： 设置 priority 优先级不同
非抢占式配置： 设置 增加 nopreempt 标识为非抢占式

>  /etc/keepalived/check_script.sh  # 定义服务健康检测监控脚本

```sh
#!/bin/bash
#
HOST=`hostname`                        # 当前服务器主机名
mail=jiyuan@redoornetwork.com          # 自己的邮箱地址
date=`date "+%F %H:%M:%S"`

ps -ef | grep nginx                    # 执行服务检测

echo "check result $?"

if [ "$?" -ne "0" ]
then
    systemctl stop keepalived          # 本机服务异常，关闭 keepalived
    echo "Your nginx:$HOST in $date is dowm" | mail -s "Your nginx is dowm" $mail
fi

echo "check result $?"
---

chmod a+x /etc/keepalived/check_script.sh # 添加执行权限

---

##加入计划任务
crontab -e
*/1 * * * *  bash /etc/keepalived/nginx_check.sh >> /dev/null
```

> Master 配置 10.0.0.3 -> eth0

```conf
global_defs {     
    router_id lb01          # 标识信息
    notification_email {
        jiyuan@redoornetwork.com  # 服务异常通知邮箱
    }  
}

vrrp_script check_script {     # 定义健康检测监控脚本
    script "/etc/keepalived/check.sh" 
    interval 1    # 每1s检测一次
    weight -5     # 优先级减去5
    fall 2
    rise 1
}

vrrp_instance VI_1 {
    state MASTER            # 角色 Master
    interface eth0          # VIP 绑定的网卡
    virtual_router_id 50    # 同一个虚拟的路由，Master 和 Backup 再同一个虚拟路由里面，ID 必须相同
    priority 150            # 优先级，优先级高的 为 Master
    advert_int 1            # 心跳的间隔时间
    authentication {
        auth_type PASS      # 认证
        auth_pass 1111      # 心跳密码
    }
    virtual_ipaddress {
        10.0.0.3            # 虚拟IP地址（可以绑定多个虚拟IP地址）
    }
    track_script {          # 执行健康检测监控脚本
        check_script
    }
}
```

> Backup 配置 BACKUP -> 10.0.0.3

```conf
global_defs {     
    router_id lb02          # 标识信息
    notification_email {
        jiyuan@redoornetwork.com  # 服务异常通知邮箱
    }  
}

vrrp_script check_script {     # 定义健康检测监控脚本
    script "/etc/keepalived/check.sh" 
    interval 1    # 每1s检测一次
    weight -5     # 优先级减去5
    fall 2
    rise 1
}

vrrp_instance VI_1 {
    state BACKUP            # 角色 BACKUP
    interface eth0          # VIP 绑定的网卡
    virtual_router_id 50    # 同一个虚拟的路由，Master 和 Backup 再同一个虚拟路由里面，ID 必须相同
    priority 100            # 优先级，优先级高的 为 Master
    advert_int 1            # 心跳的间隔时间
    authentication {
        auth_type PASS      # 认证
        auth_pass 1111      # 心跳密码
    }
    virtual_ipaddress {
        10.0.0.3            # 虚拟IP地址（可以绑定多个虚拟IP地址）
    }
    track_script {          # 执行健康检测监控脚本
        check_script
    }
}
```

### 启动

> systemctl start keepalive

### 测试

> keepalive提供一个VIP（虚拟IP）和vmac（虚拟Mac地址）

![](https://upload-images.jianshu.io/upload_images/17074136-59c793c094ee749f.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)


> ip addr show

https://www.cnblogs.com/jefflee168/p/7442127.html


## nginx+keepalived



