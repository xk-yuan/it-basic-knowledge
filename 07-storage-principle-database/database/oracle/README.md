# Oracle

> 甲骨文商业关系数据库

> 版本 : 11g-Release2、12c-Release2、12c-Release2、18c、19c、21c, 最新版本21c(20220328), 常用 11g, 12c

> Oracle 客户端

- sqlplus
- SQL Developer
- Navicat for Oracle
- PLSQL Developer
- Toad for Oracle

## 资源

> [官网](https://www.oracle.com/index.html) | [中文官网](https://www.oracle.com/cn/index.html)
>
>  - [下载](https://www.oracle.com/cn/downloads/)
>
>  - [文档-19c - 使用](https://docs.oracle.com/en/database/oracle/oracle-database/19/index.html)
>
>  - [文档-12c](https://docs.oracle.com/en/database/oracle/oracle-database/12.2/index.html)

### 

> [百度百科-Oracle](https://baike.baidu.com/item/Oracle/301207)
>
> [百度百科-Oracle数据库](https://baike.baidu.com/item/Oracle数据库/3710800)

> [Oracle 教程](https://www.w3cschool.cn/oraclejc/)

> [docker安装和配置oracle11G](https://www.cnblogs.com/laoluoits/p/13942119.html)

> [19c离线安装](https://blog.csdn.net/Vampire_1122/article/details/123038137)
>
> [](https://blog.csdn.net/kakaops_qing/article/details/110038395)

### 

> [oracle 10g、11g、 12c、19c有什么区别](https://blog.csdn.net/qq_32265203/article/details/109729314)
>
> [oracle 10g 、oracle 11g和oracle 12c有什么区别？](https://www.zhihu.com/question/23095276)
>
> [升级到Oracle 19c：你不可不知的十大SQL问题（上）](https://blog.csdn.net/enmotech/article/details/105760066)

### 

> [Oracle19C入门到熟练002-入门简介](https://blog.csdn.net/langfeiyes/article/details/123598342)
>
> [Oracle19C入门到熟练](https://blog.csdn.net/langfeiyes/article/details/123597992)
>
> [Oracle 19c多租户架构](https://blog.csdn.net/u010257584/article/details/108461167)
>
> [[ORACLE] Oracle Database 19c 架构](https://www.cnblogs.com/tingxin/p/12781095.html)
>
> [oracle19c特性以及CDB环境搭建](https://blog.csdn.net/a2521572115/article/details/121670098)
>
> [Oracle 19c + Oracle Golden Gate 19c CDC实时数据采集实战](https://cdn.modb.pro/db/107141)
> [](https://zhuanlan.zhihu.com/p/360452315)
>
> [理解 Oracle 多租户体系中（12c,18c,19c）Grant授权作用域范围](https://www.lmlphp.com/user/16521/article/item/504700/)
>
> [Oracle19c的CDB和PDB](https://cdn.modb.pro/db/89275)

## 简介

Oracle Database，又名Oracle RDBMS，或简称Oracle。是甲骨文公司的一款关系数据库管理系统。它是在数据库领域一直处于领先地位的产品。可以说Oracle数据库系统是世界上流行的关系数据库管理系统，系统可移植性好、使用方便、功能强，适用于各类大、中、小微机环境。它是一种高效率的、可靠性好的、适应高吞吐量的数据库方案。

Oracle公司（甲骨文）是全球最大的信息管理软件及服务供应商，成立于1977年，总部位于美国加州Redwood shore，面向全球开放oracle认证。

Oracle开发的关系数据库产品因性能卓越而闻名，Oracle数据库产品为财富排行榜上的前1000家公司所采用，许多大型网站也选用了Oracle系统，是世界最好的数据库产品。

Oracle Database，又名Oracle RDBMS，或简称Oracle。是甲骨文公司的一款关系数据库管理系统。它是在数据库领域一直处于领先地位的产品。可以说Oracle数据库系统是世界上流行的关系数据库管理系统，系统可移植性好、使用方便、功能强，适用于各类大、中、小微机环境。它是一种高效率的、可靠性好的、适应高吞吐量的数据库方案。


其逻辑结构，由至少一个表空间和数据库模式对象组成。模式是对象的集合，而模式对象是直接引用数据库数据的逻辑结构。模式对象包括这样一些结构：表、视图、序列、存储过程、同义词、索引、簇和数据库链等。逻辑存储结构包括表空间、段和范围，用于描述怎样使用数据库的物理空间。

逻辑结构由逻辑存储结构(表空间、段、范围、块) 和 逻辑数据结构(表、视图、序列、存储过程、同义词、索引、簇和数据库链等)组成, 而其中的模式对象(逻辑数据结构)和关系形成了数据库的关系设计。

段, Segment, 是表空间中一个指定类型的逻辑存储结构，它由一个或多个范围组成，段将占用并增长存储空间。包括, 数据段：用来存放表数据；索引段：用来存放表索引；临时段：用来存放中间结果；回滚段：用于出现异常时，恢复事务。

范围, Extent, 是数据库存储空间分配的逻辑单位，一个范围由许多连续的数据块组成，范围是由段依次分配的，分配的第一个范围称为初始范围，以后分配的范围称为增量范围。

数据块, Block, 是数据库进行IO操作的最小单位，它与操作系统的块不是一个概念。oracle数据库不是以操作系统的块为单位来请求数据，而是以多个Oracle数据库块为单位。

文件结构, 数据库的物理存储结构是由一些多种物理文件组成，主要有数据文件、控制文件、重做日志文件、归档日志文件、参数文件、口令文件、警告文件等。控制文件, 存储实例、数据文件及日志文件等信息的二进制文件; 数据文件, 存储数据，以.dbf做后缀, 一个表空间对多个数据文件，一个数据文件只对一个表空间; 日志文件, 即Redo Log Files和Archivelog Files, 记录数据库修改信息; 参数文件, spfile和pfile, 记录基本参数。

> 10g、11g、12c、19c 几个常用版本区别？

自 Oracle 18c开始，Oracle将数据库的版本发布变更为年度发布，以践行敏捷迭代的研发理念。所谓年度发布 也就是按照年份，每年发布一个版本。2018年发布了Oracle 18c，2019年是Oracle 19c，2020年发布Oracle 20c

这其中，18c = 12.2.0.2，19c = 12.2.0.3，这两个年度版本仍然处于 12c 的发布序列中，19c 属于 12c 体系的最后一个版本。由于 11g 已经退出了官方支持序列，越来越多的用户开始升级到 19c 。

Oracle 10g是第一个为网络计算设计的数据库管理系统；Oracle 11g合并和扩展了Oracle特有的功能以实现网格计算的优势，将数据中心从分散的系统资源孤岛转换为包含服务器和存储的共享池；Oracle 12c是为云计算设计的。10g和11g的g是grid, 12c的，是以后的版本，12往后都用c，是cloud，云的意思，云是代表可以多个服务，为多个客户按照需要来定制提供服务。

oracle 10g是第一个完整实现数据库集群的版本，grid，asm，flashback，dataguard，audit等都是相比旧版本的重大更新，这算是一个跨度很大的版本升级；oracle 11g在DBA管理上有很多完善，大大提升了DBA对数据库的管控能力，提供的很多自动特性，增强了调优，备份恢复，错误诊断等的功能，大大减轻DBA的低端管理工作； 相对来说，这个版本的升级比较平滑一些；oracle 12c相比上一个版本又是重大升级，特别是其container； "in memory option"也是一个比较重大的功能特性改进。

### 文档 19c

> 1. 用户系统 - 多租户体系, CDB PDB
> 2. 存储结构 - 
> 3. 逻辑结构

### 多租户

> CDB & PDB

CDB (Oracle Multitenant Container Database), 多租户容器数据库, 是 Oracle 12C引入的特性，指的是可以容纳一个或者多个可插拔数据库的数据库，这个特性允许在 CDB 容器数据库中创建并且维护多个数据库，在 CDB中创建的数据库被称为 PDB ，每个 PDB 在 CDB 中是相互独立存在的，在单独使用 PDB 时，与普通数据库无任何区别。

CDB$ROOT, 根容器数据库, 容器数据库Root 容器数据库，是 CDB 环境中的根数据库，主要作用就是容纳所有相关的 PDB 的元数据，以及在 CDB 中对所有的 PDB 进行管理，在根数据库中含有主数据字典视图，其中包含了与 Root 容器有关的元数据和 CDB 中所包含的所有的 PDB 信息。每个 CDB 环境中只能有一个 Root 容器数据库 。

PDB$SEED, CDB seed 为 PDB 的种子，其中提供了数据文件，是创建新的 PDB 的模板，是只读的 ，不可进行修改。

PDB, PDB 数据库, 在 CDB 环境中每个 PDB 都是独立存在的，与传统的 Oracle 数据库基本无差别，每个 PDB 拥有自己的数据文件和 objects ，唯一的区别在于 PDB 可以插入到 CDB 中，以及在 CDB 中拔出，并且在任何一个时间点之上 PDB 必须拔出或者插入到一个 CDB 中，当用户链接 PDB 时不会感觉到根容器和其他 PDB 的存在。

- CDB 用户

CDB 环境中包含两类用户，公用用户和本地用户。

公用用户是在 root 容器数据库中和所有的 PDB 数据库中都存在的用户， 公用用户必须在根容器中创建 ，然后此用户会在所有的现存的 PDB 中自动创建， 公用用户标识必须以 c## 或者 C## 开头 ， sys 和 system 用户是 Oracle 在 CDB 环境中自动创建的公用用户。

创建完成公用用户，需要为公用用户赋予所有可插拔数据库的权限，公用用户才可以访问其他 PDB ，如果在连接根容器时仅仅为公用用户赋予了相关权限，那么该权限不会被传递到所有的可插拔数据库中，必须为公用用户赋予能够传递到 PDB 中的权限，可以创建公用角色然后赋予公用用户，或者在为公共用户付权时指定子句 container=ALL;

