# vsftpd

## 安装部署

### 容器安装

> docker run --name vsftpd01 --restart=always \
  -p 20:20 -p 21:21 -p 21100-21110:21100-21110 \
  -v /home/ykdl/vsftpd/data:/home/vsftpd \
  -v /home/ykdl/vsftpd/logs:/var/log/vsftpd/ \
  -e FTP_USER=root \
  -e FTP_PASS=123456 \
  -e PASV_MIN_PORT=21100 \
  -e PASV_MAX_PORT=21110 \
  -e PASV_ADDRESS=10.11.0.236 \
  -e LOG_STDOUT=1 \
  -d fauria/vsftpd:latest

- PASV_MIN_PORT~ PASV_MAX_PORT 给客服端提供下载服务随机端口号范围
- -p 21100-21110:21100-21110 端口映射, 与 PASV_MIN_PORT （默认值：21100） 到 PASV_MAX_PORT （默认值：21110） 必须一致，
- PASV_ADDRESS 其他服务器访问本机使用的IP，使用 宿主机 IP
- LOG_STDOUT   是否开启日志 任意值开启

https://registry.hub.docker.com/v2/repositories/fauria/vsftpd/tags


http://10.65.101.114:9090/

### 离线安装

#### 1. 下载

yum install -y --downloadonly --downloaddir=. vsftpd  # 下载安装包, --downloadonly 只下载， --downloaddir=. 下载到当前目录

#### 2. 安装

> rpm -qa | grep vsftpd # 查看是否安装 [](http://rpmfind.net/linux/rpm2html/search.php?query=vsftpd(x86-64))

rpm -ivh vsftpd-3.0.2-28.el7.x86_64.rpm

rpm -ivh libcap-2.22-11.el7.x86_64.rpm
rpm -ivh libcap-devel-2.22-11.el7.x86_64.rpm

#### 3. 配置

#### a. 配置文件

> cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf_bak20210604

> vim /etc/vsftpd/vsftpd.conf

```conf 原配置
[root@localhost pkg]# cat /etc/vsftpd/vsftpd.conf

# Example config file /etc/vsftpd/vsftpd.conf
#
# The default compiled in settings are fairly paranoid. This sample file
# loosens things up a bit, to make the ftp daemon more usable.
# Please see vsftpd.conf.5 for all compiled in defaults.
#
# READ THIS: This example file is NOT an exhaustive list of vsftpd options.
# Please read the vsftpd.conf.5 manual page to get a full idea of vsftpd's
# capabilities.
#
# Allow anonymous FTP? (Beware - allowed by default if you comment this out).
anonymous_enable=YES # 默认的根目录为 , local_root=/var/ftp, 设置为NO代表不允许匿名
#
# Uncomment this to allow local users to log in.
# When SELinux is enforcing check for SE bool ftp_home_dir
local_enable=YES     # 设定本地用户可以访问，主要是虚拟宿主用户，如果设为NO那么所欲虚拟用户将无法访问
#
# Uncomment this to enable any form of FTP write command.
write_enable=YES     # 可以进行写的操作
#
# Default umask for local users is 077. You may wish to change this to 022,
# if your users expect that (022 is used by most other ftpd's)
local_umask=022      # 设定上传文件的权限掩码
#
# Uncomment this to allow the anonymous FTP user to upload files. This only
# has an effect if the above global write enable is activated. Also, you will
# obviously need to create a directory writable by the FTP user.
# When SELinux is enforcing check for SE bool allow_ftpd_anon_write, allow_ftpd_full_access
#anon_upload_enable=YES  # 禁止匿名用户上传
#
# Uncomment this if you want the anonymous FTP user to be able to create
# new directories.
#anon_mkdir_write_enable=YES  # 禁止匿名用户建立目录
#
# Activate directory messages - messages given to remote users when they
# go into a certain directory.
dirmessage_enable=YES         # 设定开启目录标语功能
#
# Activate logging of uploads/downloads.
xferlog_enable=YES            # 设定开启日志记录功能
#
# Make sure PORT transfer connections originate from port 20 (ftp-data).
connect_from_port_20=YES      # 设定端口20进行数据连接
#
# If you want, you can arrange for uploaded anonymous files to be owned by
# a different user. Note! Using "root" for uploaded files is not
# recommended!
#chown_uploads=YES            # 设定禁止上传文件更改宿主
#chown_username=whoever
#
# You may override where the log file goes if you like. The default is shown
# below.
#设定vsftpd服务日志保存路劲。注意：改文件默认不纯在，需手动touch，且由于这里更改了vsftpd服务的宿主用户为手动建立的vsftpd，则必须注意给予该用户对日志的读取权限否则服务启动失败。
#xferlog_file=/var/log/xferlog
#
# If you want, you can have your log file in standard ftpd xferlog format.
# Note that the default log file location is /var/log/xferlog in this case.
xferlog_std_format=YES        # 设定日志使用标准的记录格式
#
# You may change the default value for timing out an idle session.
#idle_session_timeout=600     # 设定空闲链接超时时间，这里使用默认/秒
#
# You may change the default value for timing out a data connection.
#data_connection_timeout=120  # 设定最大连接传输时间，这里使用默认，将具体数值留给每个用户具体制定，默认120/秒
#
# It is recommended that you define on your system a unique user which the
# ftp server can use as a totally isolated and unprivileged user.
# 设定支撑vsftpd服务的宿主用户为手动建立的vsftpd用户。注意：一旦更改宿主用户，需一起与该服务相关的读写文件的读写赋权问题.
#nopriv_user=ftpsecure
#
# Enable this and the server will recognise asynchronous ABOR requests. Not
# recommended for security (the code is non-trivial). Not enabling it,
# however, may confuse older FTP clients.
#async_abor_enable=YES        # 设定支持异步传输的功能
#
# By default the server will pretend to allow ASCII mode but in fact ignore
# the request. Turn on the below options to have the server actually do ASCII
# mangling on files when in ASCII mode. The vsftpd.conf(5) man page explains
# the behaviour when these options are disabled.
# Beware that on some FTP servers, ASCII support allows a denial of service
# attack (DoS) via the command "SIZE /big/file" in ASCII mode. vsftpd
# predicted this attack and has always been safe, reporting the size of the
# raw file.
# ASCII mangling is a horrible feature of the protocol.
#ascii_upload_enable=YES
#ascii_download_enable=YES
#
# You may fully customise the login banner string:
#ftpd_banner=Welcome to blah FTP service.   # 设置vsftpd的登陆标语
#
# You may specify a file of disallowed anonymous e-mail addresses. Apparently
# useful for combatting certain DoS attacks.
#deny_email_enable=YES
# (default follows)
#banned_email_file=/etc/vsftpd/banned_emails
#
# You may specify an explicit list of local users to chroot() to their home
# directory. If chroot_local_user is YES, then this list becomes a list of
# users to NOT chroot().
# (Warning! chroot'ing can be very dangerous. If using chroot, make sure that
# the user does not have write access to the top level directory within the
# chroot)
#chroot_local_user=YES
# 是否将所有用户限制在主目录,YES为启用 NO禁用.(该项默认值是NO,即在安装vsftpd后不做配置的话，ftp用户是可以向上切换到要目录之外的)chroot_local_user=NO //如果设置成YE会导致你用java代码创建文件夹时失败，因为他被限制在了宿主目录
# 禁止用户登出自己的ftp主目录
#chroot_list_enable=YES
# (default follows)
#chroot_list_file=/etc/vsftpd/chroot_list
#
# You may activate the "-R" option to the builtin ls. This is disabled by
# default to avoid remote users being able to cause excessive I/O on large
# sites. However, some broken FTP clients such as "ncftp" and "mirror" assume
# the presence of the "-R" option, so there is a strong case for enabling it.
#ls_recurse_enable=YES # 禁止用户登陆ftp后使用ls -R 命令。该命令会对服务器性能造成巨大开销，如果该项运行当多个用户使用该命令会对服务器造成威胁。
#
# When "listen" directive is enabled, vsftpd runs in standalone mode and
# listens on IPv4 sockets. This directive cannot be used in conjunction
# with the listen_ipv6 directive.
# 设定vsftpd服务工作在standalone模式下。所谓standalone模式就是该服务拥有自己的守护进程，在ps -A可以看出vsftpd的守护进程名。如果不想工作在standalone模式下，可以选择SuperDaemon模式，注释掉即可，在该模式下vsftpd将没有自己的守护进程，而是由超级守护进程Xinetd全权代理，>与此同时，vsftpd服务的许多功能，将得不到实现。
listen=NO
#
# This directive enables listening on IPv6 sockets. By default, listening
# on the IPv6 "any" address (::) will accept connections from both IPv6
# and IPv4 clients. It is not necessary to listen on *both* IPv4 and IPv6
# sockets. If you want that (perhaps because you want to listen on specific
# addresses) then you must run two copies of vsftpd with two configuration
# files.
# Make sure, that one of the listen options is commented !!
listen_ipv6=YES

pam_service_name=vsftpd # 设定pam服务下的vsftpd验证配置文件名。因此，PAM验证将参考/etc/pam.d/下的vsftpd文件配置。
userlist_enable=YES     # 设定userlist_file中的用户将不能使用ftp
tcp_wrappers=YES        # 设定支持TCPwrappers
```

```conf 原配置
anonymous_enable=YES
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
xferlog_std_format=YES
listen=NO
listen_ipv6=YES
pam_service_name=vsftpd
userlist_enable=YES
tcp_wrappers=YES
```

```conf 修改配置
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
#
anon_upload_enable=NO
#
anon_mkdir_write_enable=NO

dirmessage_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
#
chown_uploads=NO
#
xferlog_file=/home/ykdl/vsftpd/logs/vsftpd.log
xferlog_std_format=YES
#
data_connection_timeout=3600
#
nopriv_user=vsftpd
#
chroot_list_enable=NO
#
ls_recurse_enable=NO
listen=YES
#listen_ipv6=YES
pam_service_name=vsftpd
userlist_enable=YES
tcp_wrappers=YES
#
# 以下是关于虚拟用户支持的重要配置项目，默认.conf配置文件中是不包含这些项目的，需手动添加。
#
# 启用虚拟用户功能
guest_enable=YES
# 指定虚拟的宿主用户, virtusers就是我们上面创建的系统用户，作为我们的虚拟用户组使用
guest_username=virtusers
# 设定虚拟用户的权限符合他们的宿主用户 
virtual_use_local_privs=YES
# 设定虚拟用户个人vsftp的配置文件存放路劲。这个被指定的目录里，将被存放每个虚拟用户个性的配置文件，注意的地方是：配置文件名必须 和虚拟用户名相同。 
# 这是个目录，是为每一个虚拟用户配置单独的权限使用，这里我们主要配置每个用户的单独根目录 
user_config_dir=/etc/vsftpd/vconf
# 开启每个虚拟用户有独立的根目录
chroot_local_user=YES
# 禁止反向域名解析，若是没有添加这个参数可能会出现用户登陆较慢，或则客户链接不上ftp的现象
reverse_lookup_enable=NO
```

#### b. 创建用户 （两个）

> useradd vsftpd -s /sbin/nologin      # 系统用户  vsftpd  主要是提供一个默认宿主

  因为vsftpd默认的宿主用户是root，不符合安全性要求，所以将新建立的vsftpd服务的宿主用户的shell改为“ /sbin/nologin意思是禁止登录系统 ”

> useradd virtusers -s /sbin/nologin   # 系统用户  virtusers  本文主要讲虚拟用户登录，这相当于我们的虚拟用户组，建立vsftpd虚拟宿主用户

  此次主要介绍虚拟用户，顾名思义虚拟用户在系统中是不纯在的，它们集体寄托于方才创建的“virtusers”用户，那么这个用户就相当于一个虚拟用户组了，因为这个用户的权限将影响到后续讲到的虚拟用户。

> mkdir -p /home/ykdl/vsftpd/logs/ && touch /home/ykdl/vsftpd/logs/vsftpd.log && chown vsftpd.vsftpd /home/ykdl/vsftpd/logs/vsftpd.log # 建立vsftpd的日志文件，并更改属主为vsftpd的服务宿主用户

> mkdir -p /etc/vsftpd/vconf/ # 配置虚拟用户, 建立虚拟用户配置文件的存放路径
> vim /etc/vsftpd/passwd      # 建立一个虚拟用户名单文件，用来记录虚拟用户的账号和密码, 格式为：一行用户名，一行密码。不要有空格

```
test
123456
```

> db_load -T -t hash -f /etc/vsftpd/passwd /etc/vsftpd/passwd.db # 生成虚拟用户数据文件, 需要注意的是，以后对虚拟用户的增删操作完之后需要再次执行上述命令，使其生成新的数据文件

> cp /etc/pam.d/vsftpd /etc/pam.d/vsftpd_bak20210604             # 设置PAM验证文件，并制定虚拟用户数据库文件进行读取

> vim /etc/pam.d/vsftpd

```conf 原配置
#%PAM-1.0
session    optional     pam_keyinit.so    force revoke
auth       required	pam_listfile.so item=user sense=deny file=/etc/vsftpd/ftpusers onerr=succeed
auth       required	pam_shells.so
auth       include	password-auth
account    include	password-auth
session    required     pam_loginuid.so
session    include	password-auth
```

```conf 配置
#%PAM-1.0
session    optional     pam_keyinit.so    force revoke
auth       required	pam_listfile.so item=user sense=deny file=/etc/vsftpd/ftpusers onerr=succeed
auth       required	pam_shells.so
#auth       include	password-auth
#account    include	password-auth
session    required     pam_loginuid.so
#session    include	password-auth

# 新增，对虚拟用户的安全和帐户权限进行验证。
#####32位系统配置
#auth    sufficient      /lib/security/pam_userdb.so     db=/etc/vsftpd/xnpasswd
#account sufficient      /lib/security/pam_userdb.so     db=/etc/vsftpd/xnpasswd
#####64位系统配置
auth    sufficient      /lib64/security/pam_userdb.so     db=/etc/vsftpd/passwd
account sufficient      /lib64/security/pam_userdb.so     db=/etc/vsftpd/passwd

# 这里的auth是指对用户的用户名口令进行验证。这里的accout是指对用户的帐户有哪些权限哪些限制进行验证。
auth       include      system-auth
account    include      system-auth
session    include      system-auth
```

> vim /etc/vsftpd/vconf/test      # 为每一个虚拟账户配置专属配置文件, 注意文件名 test与passwd中用户名要保持一致

> mkdir -p /home/ykdl/vsftpd/data # 建立虚拟用户的仓库目录并更改相应属主/组且赋予相应权限, local_root=/home/ykdl/vsftpd/data 配置的根目录
> chown virtusers:virtusers /home/ykdl/vsftpd/data && chmod 755 /home/ykdl/vsftpd/data

> cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vconf/test


```conf
# 这里是我配置的test用户的根目录
local_root=/home/ykdl/vsftpd/data
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
anon_upload_enable=NO
anon_mkdir_write_enable=NO
async_abor_enable=YES
```

#### 4. 启动服务

> service vsftpd restart  # 重启

```log
[root@localhost ~]# service vsftpd restart
Redirecting to /bin/systemctl restart vsftpd.service

[root@localhost ~]# ps -ef|grep vsftpd
root       612     1  0 18:10 ?        00:00:00 /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
root       617 32757  0 18:11 pts/0    00:00:00 grep --color=auto vsftpd
```

> service vsftpd start    # 开启
> service vsftpd stop     # 停止

> 访问: ftp://127.0.0.1:20


#### 5. 问题

> Q: 500 OOPS: run two copies of vsftpd for IPv4 and IPv6

> 解决：注释 listen_ipv6=YES

> Q: 500 OOPS: failed to open xferlog log

解决方法: 关闭selinux

setenforce 0 # 临时关闭

> Q: 530 Login incorrect.

vim /etc/pam.d/vsftpd
#auth       required    pam_shells.so


> 防火墙开放端口

> firewall-cmd --query-port=20/tcp
> firewall-cmd --zone=public --add-port=20/tcp --permanent
> firewall-cmd --reload && firewall-cmd --list-port

