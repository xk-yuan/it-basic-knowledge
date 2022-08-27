# ubuntu

> 操作系统

## 资源


## 简介


## 安装

> 记录工具安装配置过程

### 常用工具安装

> sudo apt install vim

> sudo apt install git

### ubuntu安装SSH服务提供对外访问

> sudo apt install openssh-server

> sudo service ssh start # sudo /etc/init.d/ssh star

sudo ps -e | grep ssh

ss -tnl | grep 22

> sudo gedit /etc/ssh/sshd_config

PermitRootLogin prohibit-password 修改为 PermitRootLogin yes # 默认不允许root登录

### ubuntu安装网络工具

> sudo apt install net-tools

### 安装docker

> sudo apt  install docker.io


## 配置

### 解决每次都需要sudo获取权限问题

> 1. sudo vim /etc/sudoers # 测试未生效, 可能需要重启

修改, %sudo   ALL=(ALL:ALL) ALL 为 %sudo   ALL=(ALL:ALL) NOPASSWD:ALL

> 1. sudo vim /etc/sudoers

在 root    ALL=(ALL:ALL) ALL 下面添加

xknower    ALL=(ALL:ALL) ALL  # 用户名 xknower


### 配置 vmware 中 ubuntu20.04 共享文件夹

1. 宿主机新建, E:/vm/data 设置 vm-data

2. 虚拟机中执行

sudo apt-get install open-vm-dkms 

$ mkdir /mnt/hgfs && vmhgfs-fuse /mnt/hgfs

$ ls /mnt/hgfs/vm-data

3. 解决不同用户无法访问的加载方式

$ sudo umount /mnt/hgfs   # 卸载 [参考](https://jarviswwong.com/ubuntu-vmware-hgfs-permissions-problem.html)

xknower@ubuntu:~/Desktop$ id xknower
uid=1000(xknower) gid=1000(xknower) groups=1000(xknower),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),120(lpadmin),132(lxd),133(sambashare)

sudo /usr/bin/vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other -o uid=1000 -o gid=1000 -o umask=022   # sudo mount -t vmhgfs .host:/ /mnt/hgfs

$ ln -s /mnt/hgfs/vm-data /home/vm-data # 为共享文件夹创建目录软连接

$ ln -s /mnt/hgfs/vm-data /home/xknower/vm-data # 为共享文件夹创建目录软连接

$ ln -s /mnt/hgfs/vm-data/openjdk /home/xknower/Desktop/openjdk # VM-DATA 系统设置工作软链接目录
$ ln -s /mnt/hgfs/vm-data/pkg /home/xknower/Desktop/pkg


### 创建目录软连接

ln -s 源地址  目的地


### 设置中文


### 设置开机自启动脚本

1. 执行命令 [参考](https://www.jianshu.com/p/d5b09cea3e1a) [参考](https://www.u22e.com/2791.html)

$ sudo touch /etc/rc.local
$ sudo chmod 755 /etc/rc.local
$ sudo systemctl enable rc-local.service

```sh
#!/bin/sh

echo "执行开启启动命令脚本 ..."
# TODO
echo "执行开启启动命令脚本完成 ..."

exit 0
```

```log
xknower@ubuntu:~/Desktop$ sudo systemctl enable rc-local.service
Created symlink /etc/systemd/system/rc-local.service → /lib/systemd/system/rc-local.service.
Created symlink /etc/systemd/system/multi-user.target.wants/rc-local.service → /lib/systemd/system/rc-local.service.
```

$ sudo systemctl status rc-local.service  # 查看脚本执行情况

```log
xknower@ubuntu:~/Desktop$ sudo systemctl status rc-local.service
● rc-local.service - /etc/rc.local Compatibility
     Loaded: loaded (/lib/systemd/system/rc-local.service; enabled; vendor preset: enabled)
    Drop-In: /usr/lib/systemd/system/rc-local.service.d
             └─debian.conf
     Active: active (running) since Tue 2021-10-19 23:07:48 PDT; 2min 15s ago
       Docs: man:systemd-rc-local-generator(8)
    Process: 915 ExecStart=/etc/rc.local start (code=exited, status=0/SUCCESS)
      Tasks: 5 (limit: 4612)
     Memory: 2.4M
     CGroup: /system.slice/rc-local.service
             └─929 /usr/bin/vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other -o uid=1000 -o gid=1000 -o umask=022

Oct 19 23:07:48 ubuntu systemd[1]: Starting /etc/rc.local Compatibility...
Oct 19 23:07:48 ubuntu rc.local[915]: 执行开启启动命令脚本 ...
Oct 19 23:07:48 ubuntu sudo[917]:     root : TTY=unknown ; PWD=/ ; USER=root ; COMMAND=/usr/bin/vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other -o uid=1000 -o gid=1000 -o umask=022
Oct 19 23:07:48 ubuntu sudo[917]: pam_unix(sudo:session): session opened for user root by (uid=0)
Oct 19 23:07:48 ubuntu sudo[917]: pam_unix(sudo:session): session closed for user root
Oct 19 23:07:48 ubuntu rc.local[915]: 执行开启启动命令脚本完成 ...
Oct 19 23:07:48 ubuntu systemd[1]: Started /etc/rc.local Compatibility.
```

2. 解决异常文件

- Q: 命令 systemctl enable rc-local.service 执行异常

```sh
xknower@ubuntu:~/Desktop$ sudo systemctl enable rc-local.service
The unit files have no installation config (WantedBy=, RequiredBy=, Also=,
Alias= settings in the [Install] section, and DefaultInstance= for template
units). This means they are not meant to be enabled using systemctl.
 
Possible reasons for having this kind of units are:
• A unit may be statically enabled by being symlinked from another unit's
  .wants/ or .requires/ directory.
• A unit's purpose may be to act as a helper for some other unit which has
  a requirement dependency on it.
• A unit may be started when needed via activation (socket, path, timer,
  D-Bus, udev, scripted systemctl call, ...).
• In case of template units, the unit is meant to be enabled with some
  instance name specified.
```

解决 : 为文件 /lib/systemd/system/rc-local.service 添加 Install 段

```
[Install]
WantedBy=multi-user.target
Alias=rc-local.service
```

```sh cat /lib/systemd/system/rc-local.service
#  SPDX-License-Identifier: LGPL-2.1+
#
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.

# This unit gets pulled automatically into multi-user.target by
# systemd-rc-local-generator if /etc/rc.local is executable.
[Unit]
Description=/etc/rc.local Compatibility
Documentation=man:systemd-rc-local-generator(8)
ConditionFileIsExecutable=/etc/rc.local
After=network.target

[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
RemainAfterExit=yes
GuessMainPID=no

[Install]
WantedBy=multi-user.target
Alias=rc-local.service
```

### 更新时区和时间

1. 选择时区 [](https://blog.csdn.net/zhengchaooo/article/details/79500032)

tzselect 选择 Asia 4, 选择 China 9, 选择 Beijing 1

2. 复制时间文件

sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


