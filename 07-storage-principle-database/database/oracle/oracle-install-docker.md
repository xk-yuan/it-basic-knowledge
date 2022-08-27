# oracle install

> 安装配置, 容器化安装部署

## 安装部署

### 容器安装 12c

> 1. 拉取镜像

docker search oracle
docker pull truevoly/oracle-12c

> 2. 启动

docker run --name oracle12c \
  -e TZ=Asia/Shanghai \
  -p 18080:8080 -p 1521:1521 \
  -v /home/tieta/docker_data/oracle/data:/mnt -v /etc/localtime:/etc/localtime \
  -d truevoly/oracle-12c

> 3. 为系统用户sys和system设置密码

docker exec -it oracle12c /bin/bash

sqlplus /nolog
conn sys/oracle as sysdba

alter user sys identified by 123456;
alter user system identified by 123456;

> 4. 创建用户admin密码123456并赋予权限

create user admin identified by 123456;
grant create session to admin;
grant create table,unlimited tablespace to admin;
grant select any table to admin;
GRANT UPDATE ANY TABLE,DROP ANY TABLE,INSERT ANY TABLE TO admin;
alter system set O7_DICTIONARY_ACCESSIBILITY=true scope=spfile;

> 5. 连接信息 (Navicat Oracle 15)

- Port 1521 Type=Basic、Service Name = xe 和 SID

> 3. 创建表空间并添加用户和相应权限

1. 进入容器

docker exec -it oracle12c /bin/bash

2. 创建两个数据库的文件(LOGGING DATAFILE)及表空间(space_name), 并创建用户test赋予该表空间权限

su oracle
cd /u01/app/oracle/product/12.1.0/xe/bin/
./sqlplus / as sysdba

CREATE TABLESPACE space_name LOGGING DATAFILE '/u01/app/oracle/oradata/xe/spacename.dbf' SIZE 100M AUTOEXTEND ON NEXT 32M MAXSIZE 500M EXTENT MANAGEMENT LOCAL;

create user test identified by 123456 default tablespace space_name;
grant dba, connect to test;


> 4. 为铁塔项目创建用户

su oracle
cd /u01/app/oracle/product/12.1.0/xe/bin/
./sqlplus / as sysdba

CREATE TABLESPACE test_space_name LOGGING DATAFILE '/u01/app/oracle/oradata/xe/test_space_name.dbf' SIZE 100M AUTOEXTEND ON NEXT 32M MAXSIZE 500M EXTENT MANAGEMENT LOCAL;

create user test identified by qSscKtx8RtCWNKKj default tablespace test_space_name;
grant dba, connect to test;
grant create session to test;
grant create table,unlimited tablespace to test;
grant select any table to test;
GRANT UPDATE ANY TABLE,DROP ANY TABLE,INSERT ANY TABLE TO test;
alter system set O7_DICTIONARY_ACCESSIBILITY=true scope=spfile;


CREATE TABLESPACE dev_space LOGGING DATAFILE '/u01/app/oracle/oradata/xe/dev_space.dbf' SIZE 100M AUTOEXTEND ON NEXT 32M MAXSIZE 500M EXTENT MANAGEMENT LOCAL;

create user dev identified by qSscKtx8RtCWNKKj default tablespace dev_space;
grant dba, connect to dev;

### 容器安装 11g

> 1. 拉取镜像

docker pull registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g

> 2. 启动容器

docker run -d -p 1521:1521 --name oracle11g registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g

docker start oracle11g

> 3. 进入容器, 切换root用户

docker exec -it oracle11g bash

su root
helowin

- 编辑profile文件配置ORACLE环境变量

```sh 修改, 结尾添加 vi /etc/profile
export ORACLE_HOME=/home/oracle/app/oracle/product/11.2.0/dbhome_2
export ORACLE_SID=helowin
export PATH=$ORACLE_HOME/bin:$PATH
```

ln -s $ORACLE_HOME/bin/sqlplus /usr/bin

su - oracle # 切换 oracle 用户

> 4. oracle数据库的操作

sqlplus /nolog
conn /as sysdba   # 登录sqlplus并修改sys、system用户密码

alter user system identified by system;
alter user sys identified by sys;

create user C##test identified by qSscKtx8RtCWNKKj; # 创建用户
grant connect,resource,dba to C##test; # 赋予权限

alter user scott account unlock; # scott用户的开启, 解锁scott用户（安装时若使用默认情况没有解锁和设置密码进行下列操作，要超级管理员操作）
alter user scott identified by tiger; # 解锁scott用户的密码【此句也可以用来重置密码】

> 5. navicat 连接

- helowinXDB

create user dev identified by qSscKtx8RtCWNKKj;
grant connect,resource,dba to dev;

