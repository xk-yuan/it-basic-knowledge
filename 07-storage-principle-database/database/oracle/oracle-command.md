# oracle command

> oracle 常用命令

## 库表操作命令

1. 查询所有表数据量

select t.table_name,t.num_rows from user_tables t ORDER BY NUM_ROWS DESC;

2. 合并多个SQL文件

type *.sql >> Amerge.sql

3. 查看数据使用的编码格式

select * from nls_database_parameters where parameter ='NLS_CHARACTERSET';

AL32UTF8

select * from nls_instance_parameters where parameter='NLS_LANGUAGE'; # 客户端编码

AMERICAN

4. 

ALTER DATABASE CHARACTER SET ZHS16GBK;

5. 查询Oracle数据的实例名和service_name

SQL> select instance_name from  V$instance;

INSTANCE_NAME
----------------
orcl

SQL> show parameter service;

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
service_names                        string      orcl

6. ORA-65096 invalid common user or role name

[](https://blog.csdn.net/oscar999/article/details/118012989)
[](https://blog.csdn.net/lixiangss1993/article/details/121677355)

用户名需要以 C#或C##开头

7. 查看表名

SELECT TABLE_NAME FROM user_tables ORDER BY TABLE_NAME;