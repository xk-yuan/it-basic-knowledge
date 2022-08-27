# oracle install

> 安装配置

## 安装部署

### 安装 19c - YUM 安装 (centOS7)

#### 安装

> 1. 启动容器

- docker pull centos:7

- docker run --env ORACLE_DOCKER_INSTALL=true --name=centos7 --rm --network=host -it centos:7 # 启动并进入容器, 关闭容器后自动清理, 使用宿主机网络

docker run --env ORACLE_DOCKER_INSTALL=true --name=oracle19c --network=host -it -d centos:7 sh

> 2. yum 安装

- rpm -Uvh *.rpm --nodeps --force # libs 目录下依赖

- rpm -ivh oracle-database-preinstall-19c-1.0-1.el7.x86_64.rpm # 其会自动创建oracle用户和相应的组, 内核参数和limit也会自动设置

```log
[root@iron-testing 19c]# rpm -ivh oracle-database-preinstall-19c-1.0-1.el7.x86_64.rpm
warning: oracle-database-preinstall-19c-1.0-1.el7.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID ec551f03: NOKEY
Preparing...                          ################################# [100%]
Updating / installing...
   1:oracle-database-preinstall-19c-1.################################# [100%]
```

- rpm -ivh oracle-database-ee-19c-1.0-1.x86_64.rpm

```log
[root@iron-testing ~]# rpm -ivh oracle-database-ee-19c-1.0-1.x86_64.rpm
warning: oracle-database-ee-19c-1.0-1.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID ec551f03: NOKEY
Preparing...                          ################################# [100%]
su: cannot open session: Permission denied
[SEVERE] The su command is not configured properly or the oracle user does not have the required privileges to install the Oracle database. If you are running in a Docker environment, ensure to set the environment variable ORACLE_DOCKER_INSTALL=true and try again.
error: %pre(oracle-database-ee-19c-1.0-1.x86_64) scriptlet failed, exit status 1
error: oracle-database-ee-19c-1.0-1.x86_64: install failed
[root@iron-testing ~]# export ORACLE_DOCKER_INSTALL=true
[root@iron-testing ~]# rpm -ivh oracle-database-ee-19c-1.0-1.x86_64.rpm
warning: oracle-database-ee-19c-1.0-1.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID ec551f03: NOKEY
Preparing...                          ################################# [100%]
Updating / installing...
   1:oracle-database-ee-19c-1.0-1     ################################# [100%]
[INFO] Executing post installation scripts...
[INFO] Oracle home installed successfully and ready to be configured.
To configure a sample Oracle Database you can execute the following service configuration script as root: /etc/init.d/oracledb_ORCLCDB-19c configure
```

> 3. 初始化Oracle数据库

- /etc/init.d/oracledb_ORCLCDB-19c configure # 如何配置失败执行 oracledb_ORCLCDB-19c delete 重新执行配置

```log
[root@iron-testing ~]# /etc/init.d/oracledb_ORCLCDB-19c configure
Configuring Oracle Database ORCLCDB.
Prepare for db operation
8% complete
Copying database files
31% complete
Creating and starting Oracle instance
32% complete
36% complete
40% complete
43% complete
46% complete
Completing Database Creation
51% complete
54% complete
Creating Pluggable Databases
58% complete
77% complete
Executing Post Configuration Actions
100% complete
Database creation complete. For details check the logfiles at:
 /opt/oracle/cfgtoollogs/dbca/ORCLCDB.
Database Information:
Global Database Name:ORCLCDB
System Identifier(SID):ORCLCDB
Look at the log file "/opt/oracle/cfgtoollogs/dbca/ORCLCDB/ORCLCDB1.log" for further details.

Database configuration completed successfully. The passwords were auto generated, you must change them by connecting to the database using 'sqlplus / as sysdba' as the oracle user.
```

> 4. 修改配置文件

```sh
# 打开配置文件
vi /etc/profile

# 在最后追加
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=$PATH:/opt/oracle/product/19c/dbhome_1/bin
export ORACLE_SID=ORCLCDB
export NLS_LANG="AMERICAN_AMERICA.UTF8"
export ORACLE_DOCKER_INSTALL=true

# 使环境变量生效
source /etc/profile
```

> 5. 登录

passwd oracle

su oracle

sqlplus / as sysdba

### 配置 PDB

> 6. PDB

- 删除默认 PDB ORCLPDB1, rpm方式安装自动会创建一个PDB数据库：ORCLPDB1，如不需要，可将其删除

```sql
SQL> show pdbs;

    CON_ID CON_NAME			  OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
	 2 PDB$SEED			  READ ONLY  NO
	 3 ORCLPDB1			  READ WRITE NO

SQL> ALTER PLUGGABLE DATABASE ORCLPDB1 CLOSE;

Pluggable database altered.

SQL> DROP PLUGGABLE DATABASE ORCLPDB1 including datafiles;

Pluggable database dropped.
```

- 创建 PDB, 使用GUI创建

```sql
CREATE PLUGGABLE DATABASE orcl ADMIN USER orcl IDENTIFIED BY oracle
  STORAGE (MAXSIZE UNLIMITED)
  DEFAULT TABLESPACE orcl
  DATAFILE '/opt/oracle/oradata/ORCLCDB/orcl/orcl.dbf' SIZE 100M AUTOEXTEND ON
  PATH_PREFIX = '/opt/oracle/oradata/ORCLCDB/orcl/'
  FILE_NAME_CONVERT = ('/opt/oracle/oradata/ORCLCDB/pdbseed', '/opt/oracle/oradata/ORCLCDB/orcl');
```

- 启动 PDB

```sql
ALTER PLUGGABLE DATABASE ORCL OPEN;
```

- 自启动, 创建触发器，实现Oracle启动后自动打开PDB

```sql
CREATE TRIGGER open_ORCL
AFTER STARTUP ON DATABASE
BEGIN
   EXECUTE IMMEDIATE 'ALTER PLUGGABLE DATABASE ORCL OPEN';
END open_ORCL;
/
```

> 7. PDB 创建表空间

```sql
show pdbs;

# 切换到指定PDB
alter session set container=ORCL;      
# 切换回CDB容器
alter session set container=CDB$ROOT;

# 创建临时表空间
CREATE TEMPORARY TABLESPACE TEST_TEMP TEMPFILE '/opt/oracle/oradata/ORCLCDB/test_temp1.dbf' SIZE 100 M AUTOEXTEND ON NEXT 100 M MAXSIZE 20480 M EXTENT MANAGEMENT LOCAL;
# 创建表空间
CREATE TABLESPACE TEST_DATA LOGGING DATAFILE '/opt/oracle/oradata/ORCLCDB/test_data1.dbf' SIZE 100 M AUTOEXTEND ON NEXT 100 M MAXSIZE 20480 M EXTENT MANAGEMENT LOCAL;
```

> 8. 创建用户, 配置表空间

```sql 创建用户
# 使用自定义表空间
CREATE USER "TEST_DATA_USER" IDENTIFIED BY "123456" DEFAULT TABLESPACE "TEST_DATA" TEMPORARY TABLESPACE "TEST_TEMP";

# 使用默认表空间
CREATE USER "TEST_DATA_USER_DEFAULT" IDENTIFIED BY "123456"; # GRANT "CONNECT" TO "TEST_DATA_USER";

# 用户授权
GRANT "CONNECT", "DBA", "RESOURCE" TO "TEST_DATA_USER";

# 删除用户
drop user "TEST_DATA_USER" cascade;
```

```sql 只读账号
# 创建账号
CREATE USER "TEST_DATA_USER_READ" IDENTIFIED BY "123456";

# 授权，连接 和 创建同义词，创建同义词，查询的时候可以不用加 数据库名
GRANT "CONNECT" TO "TEST_DATA_USER_READ";

GRANT CREATE SYNONYM TO "TEST_DATA_USER_READ";
# 允许登录
GRANT CREATE SESSION TO "TEST_DATA_USER_READ";

# 把另一个用户的表查询权限全部赋予只读账号，所以需要所有表的grant select on table_name to 只读账号 语句，不可能一句一句去写，因此用select 把所有的grant语句查出来直接执行,注意：数据库名 要大写，不然结果是空的
SELECT
	'GRANT SELECT ON ' || owner || '.' || object_name || ' TO 只读账号;' 
FROM
	dba_objects 
WHERE
	owner IN ( '数据库名' ) 
	AND object_type = 'TABLE';

# 将查到的全部语句，在 源数据库 中全部执行 给 源数据库 用户下所有表创建同义词
SELECT
	'create or replace SYNONYM 只读账号. ' || object_name || ' FOR ' || owner || '.' || object_name || ';' 
FROM
	dba_objects 
WHERE
	owner IN ( '源数据库' ) 
	AND object_type = 'TABLE';

# 将查到的全部语句，在 只读账号 中全部执行

SELECT * FROM TABLE_NAME;
```

#### 错误问题

> 1. 缺少依赖 ethtool initscripts libaio make openssh-clients

```log
[root@iron-testing 19c]# rpm -ivh oracle-database-preinstall-19c-1.0-1.el7.x86_64.rpm
warning: oracle-database-preinstall-19c-1.0-1.el7.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID ec551f03: NOKEY
error: Failed dependencies:
	ethtool is needed by oracle-database-preinstall-19c-1.0-1.el7.x86_64
	initscripts is needed by oracle-database-preinstall-19c-1.0-1.el7.x86_64
	libaio is needed by oracle-database-preinstall-19c-1.0-1.el7.x86_64
	make is needed by oracle-database-preinstall-19c-1.0-1.el7.x86_64
	openssh-clients is needed by oracle-database-preinstall-19c-1.0-1.el7.x86_64
```

yum install -y ethtool initscripts libaio make openssh-clients

> 2. 缺少依赖 file

```log
[root@iron-testing 19c]# rpm -ivh oracle-database-ee-19c-1.0-1.x86_64.rpm
warning: oracle-database-ee-19c-1.0-1.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID ec551f03: NOKEY
error: Failed dependencies:
	file is needed by oracle-database-ee-19c-1.0-1.x86_64
```

yum install -y file

> 3. 需要设置环境变量

```log
[root@iron-testing 19c]# rpm -ivh oracle-database-ee-19c-1.0-1.x86_64.rpm
warning: oracle-database-ee-19c-1.0-1.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID ec551f03: NOKEY
Preparing...                          ################################# [100%]
su: cannot open session: Permission denied
[SEVERE] The su command is not configured properly or the oracle user does not have the required privileges to install the Oracle database. If you are running in a Docker environment, ensure to set the environment variable ORACLE_DOCKER_INSTALL=true and try again.
error: %pre(oracle-database-ee-19c-1.0-1.x86_64) scriptlet failed, exit status 1
error: oracle-database-ee-19c-1.0-1.x86_64: install failed
```

export ORACLE_DOCKER_INSTALL=true

或

vi /etc/profile
export ORACLE_DOCKER_INSTALL=true


> 4. 

ERROR:
ORA-01045: user LLBATTERY_ADMIN lacks CREATE SESSION privilege; logon denied

show pdbs;
ll /opt/oracle/oradata/
ll /opt/oracle/oradata/ORCLCDB/orcl/

drop user "LLBATTERY_ADMIN" cascade; # 删除用户

ALTER PLUGGABLE DATABASE ORCL CLOSE;               # 关闭PDB
DROP PLUGGABLE DATABASE ORCL including datafiles;  # 删除PDB文件
rm -rf /opt/oracle/oradata/ORCLCDB/orcl/

重新建立PDB并创建用户


```sh
sqlplus / as sysdba

sqlplus llbattery/amx1823jxX1xasx@192.168.103.133/ORCL
sqlplus llbattery_admin/amx1823jxX1xasx@192.168.103.133/ORCL
sqlplus ITOWER/'12abZdfdS#$DF'@192.168.103.133/ORCL

vi /opt/oracle/product/19c/dbhome_1/network/admin/tnsnames.ora
vi /opt/oracle/product/19c/dbhome_1/network/admin/listener.ora
```
