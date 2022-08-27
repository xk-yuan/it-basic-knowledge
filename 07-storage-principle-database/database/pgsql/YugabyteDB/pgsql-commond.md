# PGSQL

> 

## 资源

> [](https://www.runoob.com/postgresql/postgresql-tutorial.html)

## 简介


## [ysqlsh](https://docs.yugabyte.com/latest/admin/ysqlsh/)

./bin/ysqlsh -h 192.168.10.245 -p 5433 --echo-queries

./bin/ysqlsh -h 192.168.10.245 -p 5433 -U syscontrol

```
useradd postgres
su postgres
./postgres/bin/initdb -D /tmp/yb_pg_initdb_tmp_data_dir -U postgres
```

### 权限操作

> 创建用户

CREATE USER syscontrol WITH PASSWORD '123456';

```
yugabyte=# CREATE USER syscontrol WITH PASSWORD '123456';
CREATE USER syscontrol WITH PASSWORD '123456';
CREATE ROLE
```

> 赋予权限

GRANT privilege [, ...]
ON object [, ...]
TO { PUBLIC | GROUP group | username }

```
GRANT ALL ON DATABASE syscontrol to syscontrol;  # 将数据库 syscontrol 的 ALL 权限赋予 用户 syscontrol

GRANT ALL ON table_name TO syscontrol;          # 将表 table_name 的 ALL 权限赋予 用户 syscontrol
```

GRANT ALL ON alarm_relieve_info TO syscontrol;
GRANT ALL ON collection_log TO syscontrol;
GRANT ALL ON gw_config_info TO syscontrol;
GRANT ALL ON gw_dev_info TO syscontrol;
GRANT ALL ON gw_dev_normal_info TO syscontrol;
GRANT ALL ON gw_dev_warning_info TO syscontrol;
GRANT ALL ON gw_file_path_record TO syscontrol;
GRANT ALL ON gw_pfm_info_collect_plan TO syscontrol;
GRANT ALL ON gw_user_info TO syscontrol;
GRANT ALL ON link_log TO syscontrol;
GRANT ALL ON main_standby_log TO syscontrol;
GRANT ALL ON opr_log TO syscontrol;
GRANT ALL ON request_log TO syscontrol;
GRANT ALL ON sys_status_log TO syscontrol;
GRANT ALL ON trans_log TO syscontrol;

INSERT INTO OPR_LOG ( id, ykdl_id, type, opr_user_id, opr_result_rmk, opr_res, create_time ) VALUES (2, 1, 7, 'root', '', 1, '2021-10-13 11:27:00');

select * from opr_log;


./bin/yugabyted start --ui=true --base_dir=/home/ykdl/db/disk --listen=10.11.0.235

./bin/yugabyted start --ui=true --base_dir=/home/ykdl/db/disk --listen=10.11.0.236 --join=10.11.0.235


### 1. 数据库操作

> 创建数据库

CREATE DATABASE syscontrol;

> 设置数据库权限

GRANT ALL ON DATABASE syscontrol to syscontrol;

> syscontrol

\c syscontrol;

### 2. 表格操作

> 查询当前db所有表

select * from pg_tables;

```
yugabyte=# select * from pg_tables;

     schemaname     |        tablename        | tableowner | tablespace | hasindexes | hasrules | hastriggers | rowsecurity 
--------------------+-------------------------+------------+------------+------------+----------+-------------+-------------
 pg_catalog         | pg_default_acl          | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_pltemplate           | postgres   | pg_global  | t          | f        | f           | f
 pg_catalog         | pg_tablespace           | postgres   | pg_global  | t          | f        | f           | f
 pg_catalog         | pg_shdepend             | postgres   | pg_global  | t          | f        | f           | f
 pg_catalog         | pg_type                 | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_attribute            | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_proc                 | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_class                | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_authid               | postgres   | pg_global  | t          | f        | f           | f
 pg_catalog         | pg_auth_members         | postgres   | pg_global  | t          | f        | f           | f
 pg_catalog         | pg_database             | postgres   | pg_global  | t          | f        | f           | f
 pg_catalog         | pg_foreign_server       | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_user_mapping         | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_sequence             | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_foreign_data_wrapper | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_shdescription        | postgres   | pg_global  | t          | f        | f           | f
 pg_catalog         | pg_aggregate            | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_am                   | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_amop                 | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_amproc               | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_attrdef              | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_cast                 | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_constraint           | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_conversion           | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_depend               | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_description          | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_index                | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_inherits             | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_language             | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_largeobject          | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_namespace            | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_opclass              | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_operator             | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_rewrite              | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_statistic            | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_trigger              | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_opfamily             | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_db_role_setting      | postgres   | pg_global  | t          | f        | f           | f
 pg_catalog         | pg_largeobject_metadata | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_extension            | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_foreign_table        | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_policy               | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_partitioned_table    | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_statistic_ext        | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_init_privs           | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_collation            | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_event_trigger        | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_enum                 | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_range                | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_transform            | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_shseclabel           | postgres   | pg_global  | t          | f        | f           | f
 pg_catalog         | pg_seclabel             | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_ts_dict              | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_ts_parser            | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_ts_config            | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_ts_config_map        | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_ts_template          | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_replication_origin   | postgres   | pg_global  | t          | f        | f           | f
 pg_catalog         | pg_subscription         | postgres   | pg_global  | t          | f        | f           | f
 pg_catalog         | pg_subscription_rel     | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_publication          | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_publication_rel      | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_tablegroup           | postgres   |            | t          | f        | f           | f
 pg_catalog         | pg_yb_catalog_version   | postgres   | pg_global  | t          | f        | f           | f
 information_schema | sql_features            | postgres   |            | f          | f        | f           | f
 information_schema | sql_implementation_info | postgres   |            | f          | f        | f           | f
 information_schema | sql_languages           | postgres   |            | f          | f        | f           | f
 information_schema | sql_packages            | postgres   |            | f          | f        | f           | f
 information_schema | sql_parts               | postgres   |            | f          | f        | f           | f
 information_schema | sql_sizing              | postgres   |            | f          | f        | f           | f
 information_schema | sql_sizing_profiles     | postgres   |            | f          | f        | f           | f
(71 rows)
```

> 列出当前数据库中的所有表

\d

```
yugabyte=# \d

Did not find any relations.
```

> 查看表结构

\d {table_name}

```
yugabyte=# \d pg_tables;

              View "pg_catalog.pg_tables"
   Column    |  Type   | Collation | Nullable | Default 
-------------+---------+-----------+----------+---------
 schemaname  | name    |           |          | 
 tablename   | name    |           |          | 
 tableowner  | name    |           |          | 
 tablespace  | name    |           |          | 
 hasindexes  | boolean |           |          | 
 hasrules    | boolean |           |          | 
 hastriggers | boolean |           |          | 
 rowsecurity | boolean |           |          | 
```

> 2. 创建表

```
CREATE TABLE table_name(
   column1 datatype,
   column2 datatype,
   column3 datatype,
   .....
   columnN datatype,
   PRIMARY KEY( 一个或多个列 )
);

yugabyte=# CREATE TABLE syscontrol (
yugabyte(#    ID INT PRIMARY KEY     NOT NULL,
yugabyte(#    NAME           TEXT    NOT NULL,
yugabyte(#    AGE            INT     NOT NULL,
yugabyte(#    ADDRESS        CHAR(50),
yugabyte(#    SALARY         REAL
yugabyte(# );
CREATE TABLE syscontrol(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);
CREATE TABLE

yugabyte-# \d
          List of relations
 Schema |  Name   | Type  |  Owner   
--------+---------+-------+----------
 public | syscontrol | table | yugabyte
(1 row)

yugabyte-# \d syscontrol

                  Table "public.syscontrol"
 Column  |     Type      | Collation | Nullable | Default 
---------+---------------+-----------+----------+---------
 id      | integer       |           | not null | 
 name    | text          |           | not null | 
 age     | integer       |           | not null | 
 address | character(50) |           |          | 
 salary  | real          |           |          | 
Indexes:
    "syscontrol_pkey" PRIMARY KEY, lsm (id HASH)
```


### 3. 数据操作


> 查询数据

```
SELECT column1, column2,...columnN FROM table_name;

select * from syscontrol;
```


