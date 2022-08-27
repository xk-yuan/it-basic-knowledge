# PostgreSQL

> postgresql


## 资源

## 简介


## 数据库对比

>

### postgresql & mysql

> [](https://www.zhihu.com/question/20010554)


### 常用命令

> 创建数据库 createdb [option...] [dbname [description]]

CREATE DATABASE DB_NAME;

DROP DATABASE [ IF EXISTS ] DB_NAME;

DROPDB [connection-option...] [option...] DB_NAME

> 创建数据表

CREATE TABLE TABLE_NAME (
   column1 datatype,
   column2 datatype,
   column3 datatype,
   .....
   columnN datatype,
   PRIMARY KEY( 一个或多个列 )
);


CREATE TABLE TABLE_NAME (
   ID             INT     PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);

bit bool box bytea char cidr circle date decimal float4 float8 inet int2 int4 int8 interval json jsonb line lseg macaddr money path point 

DROP TABLE TABLE_NAME;

> 插入语句

INSERT INTO TABLE_NAME (column1, column2, column3,...columnN) VALUES (value1, value2, value3,...valueN);

INSERT INTO TABLE_NAME (ID, NAME, AGE, ADDRESS, SALARY) VALUES (1, 2, 3, 4, 5);

> 更新语句

UPDATE TABLE_NAME
SET column1 = value1, column2 = value2...., columnN = valueN
WHERE [condition];

UPDATE TABLE_NAME SET SALARY = 15000 WHERE ID = 1;

> 删除语句

DELETE FROM TABLE_NAME WHERE [condition];

DELETE FROM TABLE_NAME WHERE ID = 1;

> 查询语句

SELECT column1, column2,...columnN FROM TABLE_NAME;

> 表达式

