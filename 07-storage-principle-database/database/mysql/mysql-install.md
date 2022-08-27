# mysql install

> 安装配置

## 部署安装

### 容器安装

> docker pull mysql:5.7

 -v /home/mysql/conf:/etc/mysql/conf.d -v /home/mysql/logs:/logs -v /home/mysql/data:/var/lib/mysql
 
docker run -p 3306:3306 --name mysql -e MYSQL_USER=admin -e MYSQL_PASSWORD=123456 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7

> -p 宿主机端口:容器端口
> vim /etc/mysql/mysql.conf.d/mysqld.cnf

> 通常使用-e MYSQL_RANDOM_ROOT_PASSWORD=1 把root设置为随机，只使用admin用户来管理
MYSQL_ROOT_PASSWORD, MYSQL_ALLOW_EMPTY_PASSWORD and MYSQL_RANDOM_ROOT_PASSWORD

```ini
[mysqld]
skip-grant-tables
```

mysql -u root -p

docker run --name mysql \
    --restart=always \
    -p 3306:3306 \
    -v /opt/docker/mysql/conf.d:/etc/mysql/conf.d \
    -v /opt/docker/mysql/var/lib/mysql:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e TZ=Asia/Shanghai \
    -d mysql:5.7

> docker pull mysql:5.7
 
> docker run -p 3306:3306 --name mysql -e MYSQL_USER=admin -e MYSQL_PASSWORD=123456 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7

> docker run --restart=always --name mysql -p 3306:3306 -v /home/ykdl/mysql/conf:/etc/mysql/conf.d -v /home/ykdl/mysql/logs:/logs -v /home/ykdl/mysql/data:/var/lib/mysql -e MYSQL_USER=admin -e MYSQL_PASSWORD=123456 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7


> -p 宿主机端口:容器端口

> 通常使用-e MYSQL_RANDOM_ROOT_PASSWORD=1 把root设置为随机，只使用admin用户来管理
MYSQL_ROOT_PASSWORD, MYSQL_ALLOW_EMPTY_PASSWORD and MYSQL_RANDOM_ROOT_PASSWORD

```ini vim /etc/mysql/mysql.conf.d/mysqld.cnf
[mysqld]
skip-grant-tables
```

mysql -u root -p

### [离线安装 MYSQL](https://www.cnblogs.com/ruanjianlaowang/p/11182435.html)

#### 1. 卸载旧版本

yum list installed | grep mysql
yum -y remove mysql-libs.x86_64

#### 2. 安装依赖库，该依赖库，测试时未安装依然成功，先不安装该依赖

> [libaio](https://pkgs.org/download/libaio(x86-64)) | [libaio-0.3.109-13.el7.x86_64.rpm](http://mirror.centos.org/centos/7/os/x86_64/Packages/libaio-0.3.109-13.el7.x86_64.rpm)

rpm -ivh libaio-0.3.109-13.el7.x86_64.rpm

```
> yum install libaio # 在线安装
```

#### 3. 下载安装

> [5.7](https://dev.mysql.com/downloads/mysql/5.7.html) | [mysql-5.7.34-el7-x86_64.tar.gz](https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.34-el7-x86_64.tar.gz)

> 解压安装

mv mysql-5.7.34-el7-x86_64.tar.gz /usr/local/ && cd /usr/local/
tar -zxvf mysql-5.7.34-el7-x86_64.tar.gz
mkdir mysql && mv mysql-5.7.34-el7-x86_64/* mysql && rm -rf mysql-5.7.34-el7-x86_64

#### 4. 配置

groupadd mysql                                    // 创建用户组
useradd -r -g mysql mysql                         // -r参数表示mysql用户是系统用户，不可用于登录，创建用户并将用户组
chown -R mysql mysql/ && chgrp -R mysql mysql/

> vi /etc/my.cnf

```
> [root@localhost local]# cat /etc/my.cnf # 查看原配置

[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0
# Settings user and group are ignored when systemd is used.
# If you need to run mysqld under a different user or group,
# customize your systemd unit file for mariadb according to the
# instructions in http://fedoraproject.org/wiki/Systemd

[mysqld_safe]
log-error=/var/log/mariadb/mariadb.log
pid-file=/var/run/mariadb/mariadb.pid

#
# include all files from the config directory
#
!includedir /etc/my.cnf.d

> [root@localhost local]# vi /etc/my.cnf  # 查看修改后配置

[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0
# Settings user and group are ignored when systemd is used.
# If you need to run mysqld under a different user or group,
# customize your systemd unit file for mariadb according to the
# instructions in http://fedoraproject.org/wiki/Systemd

[mysqld_safe]
log-error=/var/log/mariadb/mariadb.log
pid-file=/var/run/mariadb/mariadb.pid

#
# include all files from the config directory
#
!includedir /etc/my.cnf.d

[client]
port   = 3306
socket = /tmp/mysql.sock
[mysqld]
character_set_server=utf8
init_connect='SET NAMES utf8'
basedir=/usr/local/mysql
datadir=/usr/local/mysql/data
socket=/tmp/mysql.sock
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
# 不区分大小写
lower_case_table_names = 1
sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
max_connections=5000
default-time_zone = '+8:00'
```

#### 5. 初始化数据库

/usr/local/mysql/bin/mysqld \
  --initialize \
  --user=mysql \
  --basedir=/usr/local/mysql \
  --datadir=/usr/local/mysql/data \
  --lc_messages_dir=/usr/local/mysql/share \
  --lc_messages=en_US

```
> 问题 (1)

2021-05-27T07:11:05.906497Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
2021-05-27T07:11:05.972042Z 0 [ERROR] Could not open file '/var/log/mysqld.log' for error logging: Permission denied
2021-05-27T07:11:05.972065Z 0 [ERROR] Aborting

> 解决 (1)

cd /var/log/ && vi mysqld.log
：wq

chmod 777 mysqld.log && chown mysql:mysql mysqld.log

> 问题 (2)

Starting MySQL.2021-05-27T07:16:51.324595Z mysqld_safe error: log-error set to '/var/log/mariadb/mariadb.log', however file don't exists. Create writable for user 'mysql'.
ERROR! The server quit without updating PID file (/var/run/mysqld/mysqld.pid).

> 解决 (2)

cd /var/run/ && mkdir mysqld && chmod 777 mysqld && cd mysqld && vi mysqld.pid 
chmod 777 mysqld.pid &&chown mysql:mysql mysqld.pid

> 问题 (3)

[root@localhost mysqld]# /usr/local/mysql/support-files/mysql.server start
Starting MySQL SUCCESS! 
[root@localhost mysqld]# 2021-05-27T07:19:52.174177Z mysqld_safe error: log-error set to '/var/log/mariadb/mariadb.log', however file don't exists. Create writable for user 'mysql'.

> 解决 (3)

cd /var/log/ && mkdir mariadb && chmod 777 mariadb && cd mariadb && vi mariadb.log 
chmod 777 mariadb.log && chown mysql:mysql mariadb.log
```

> 查看默认密码

```
[root@localhost log]# cat /var/log/mysqld.log

2021-05-27T07:13:32.688142Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
2021-05-27T07:13:33.409635Z 0 [Warning] InnoDB: New log files created, LSN=45790
2021-05-27T07:13:33.523846Z 0 [Warning] InnoDB: Creating foreign key constraint system tables.
2021-05-27T07:13:33.600451Z 0 [Warning] No existing UUID has been found, so we assume that this is the first time that this server has been started. Generating a new UUID: 0c182ab9-bebb-11eb-ac8e-000c2984d358.
2021-05-27T07:13:33.601904Z 0 [Warning] Gtid table is not ready to be used. Table 'mysql.gtid_executed' cannot be opened.
2021-05-27T07:13:34.389748Z 0 [Warning] CA certificate ca.pem is self signed.
2021-05-27T07:13:34.997677Z 1 [Note] A temporary password is generated for root@localhost: *z7m59oorlJS

> 默认用户：root, 默认密码：*z7m59oorlJS，默认登录允许地址：localhost
```

#### 6. 启动数据库

> su - mysql  # 切换用户, 未切换用户，用 root 用户依然可以启动

> /usr/local/mysql/support-files/mysql.server start # 启动数据库

```
[root@localhost mariadb]# /usr/local/mysql/support-files/mysql.server start
Starting MySQL SUCCESS! # 启动成功
```
> ps -ef | grep mysql

```
[root@localhost mariadb]# ps -ef|grep mysql
root       2062      1  0 15:22 pts/0    00:00:00 /bin/sh /usr/local/mysql/bin/mysqld_safe --datadir=/usr/local/mysql/data --pid-file=/var/run/mysqld/mysqld.pid
mysql      2376   2062 21 15:22 pts/0    00:00:00 /usr/local/mysql/bin/mysqld --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data --plugin-dir=/usr/local/mysql/lib/plugin --user=mysql --log-error=/var/log/mariadb/mariadb.log --pid-file=/var/run/mysqld/mysqld.pid --socket=/tmp/mysql.sock
root       2405   1336  0 15:22 pts/0    00:00:00 grep --color=auto mysql
```

#### 7. 客户端登录

> /usr/local/mysql/bin/mysql -uroot -p mysql

```
> 问题 (4)

mysql> show databases;
ERROR 1820 (HY000): You must reset your password using ALTER USER statement before executing this statement.

> 解决 (4)，重置密码

set password=password('123456');

> 解决，修改任意机器访问

UPDATE mysql.user SET Host = '%', User = 'root' WHERE (Host = 'localhost') AND (User = 'root');
FLUSH PRIVILEGES;
```

```
> 设置开启自启动

cd /usr/local/mysql/support-files
cp mysql.server /etc/init.d/mysqld

chkconfig --add mysqld

>

su - mysql

service mysqld start/stop/restart
```

> 防火墙开放端口

> firewall-cmd --query-port=3306/tcp
> firewall-cmd --zone=public --add-port=3306/tcp --permanent
> firewall-cmd --query-port=3306/tcp
> firewall-cmd --reload
> firewall-cmd --list-port

> docker run -p 3306:3306 --name mysqlserver \
    -e TZ=Asia/Shanghai -e MYSQL_ROOT_PASSWORD=123456 \
    -v /home/db/conf:/etc/mysql/conf.d \
    -v /home/db/logs:/logs \
    -v /home/db/data:/var/lib/mysql \
    -d mysql:5.7
