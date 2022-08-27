# inotify

> inotify

> sersync

## 资源

> []()
>
>  - [](https://github.com/inotify-tools/inotify-tools/releases) | [3.20.0.tar.gz](https://github.com/inotify-tools/inotify-tools/archive/refs/tags/3.20.0.tar.gz)

## 简介

Inotify是一种强大的、细粒度的、异步的文件系统事件监控机制，linux内核从2.6.13起，加入了Inotify支持，通过Inotify可以监控文件系统中添加、删除，修改、移动等各种细微事件。

利用这个内核接口，第三方软件就可以监控文件系统下文件的各种变化情况，而inotify-tools就是这样的一个第三方软件。

inotify-tools 是为linux下inotify文件监控工具提供的一套C的开发接口库函数，同时还提供了一系列的命令行工具，这些工具可以用来监控文件系统的事件。


## 安装部署

> yum clean all && yum clean metadata && yum update

> yum makecache

> rpm -qa|grep yum

> mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

CentOS 5 wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-5.repo
 
CentOS 6 wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
 
CentOS 7 wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo


### 安装

> inotify-tools 实时触发rsync进行同步

> ll /proc/sys/fs/inotify/ **如果有这个三个以max开头的文件，则表示服务器内核支持inotify**
total 0
-rw-r--r--. 1 root root 0 4月   1 10:37 max_queued_events
-rw-r--r--. 1 root root 0 4月   1 10:37 max_user_instances
-rw-r--r--. 1 root root 0 4月   1 10:37 max_user_watches

> rpm -qa inotify-tools **检查是否已经安装**

> yum install -y inotify-tools

> 编译安装

> wget https://github.com/inotify-tools/inotify-tools/archive/refs/tags/3.20.0.tar.gz

> tar zxvf inotify-tools-3.20.0.tar.gz && cd inotify-tools-3.20.0   | tar zxvf inotify-tools-3.20.0-install.tar.gz # 已经编译成功版本

> ./autogen.sh && ./configure && make && make install


> inotifywait  用于等待文件或文件集上的一个特定事件，它可以监控任何文件和目录设置，并且可以递归地监控整个目录树

> inotifywatch 用于收集被监控的文件系统统计数据，包括每个inotify事件发生多少次等信息


### 配置

> **同步脚本 /scripts/inotify.sh**

> mkdir /scripts && touch /scripts/inotify.sh && chmod 755 /scripts/inotify.sh && ll /scripts/inotify.sh

> 开机启动

chmod +x /etc/rc.d/rc.local && ll /etc/rc.d/rc.local && vim /etc/rc.d/rc.local && tail -1 /etc/rc.d/rc.local 

nohup /bin/bash /scripts/inotify.sh &

```
# 目标服务器的ip / TODO: 此处只同步一个服务器，后面修改脚本 同步到多个服务端
host=10.123.234.236
# 在源服务器上所要监控的备份目录（此处可以自定义，但是要保证存在）
src=/home/source
# 自定义的模块名，需要与目标服务器上定义的同步名称一致
des=module_home_source
# 执行数据同步的密码文件
password=/etc/rsyncd/rsyn.password
# 执行数据同步的用户名
user=root
#
inotifywait=/home/ykdl/scripts/inotifywait

$inotifywait -mrq --timefmt '%Y%m%d %H:%M' --format '%T %w%f%e' -e modify,delete,create,attrib $src
    while read files ; do
        rsync -avzP --delete  --timeout=100 --password-file=${password} $src $ user@$ host::$des
    echo "${files} was rsynced" >>/tmp/rsync.log 2>&1
```

### 运行

> 基本运行命令

#### inotifywait

监控 /root/tmp/ 目录文件的变化，持续监听/root/tmp目录及其子目录的文件变化，监听事件包括文件被修改、删除、创建、移动、属性更改，显示到屏幕

> /usr/local/bin/inotifywait -mrq --timefmt '%Y/%m/%d-%H:%M:%S' --format '%T %w %f' \
 -e modify,delete,create,move,attrib /home/source/


inotifywait排除监控目录：--exclude <pattern>和--fromfile <file> 两种格式，前者可以用正则，而后者只能是具体的目录或文件

fromfile格式只能用绝对路径，不能使用诸如*正则表达式去匹配，@表示排除


