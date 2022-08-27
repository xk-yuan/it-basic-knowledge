# YugabyteDB

> 是一种 开源的，高性能的，云原生的，分布式SQL数据库，旨在支持PostgreSQL的所有功能。

> 高性能的分布式ACID事务的开源数据库

## 资源

> [官网](https://www.yugabyte.com/)
>
>   - [文档](https://docs.yugabyte.com/)
>   - [GIT](https://github.com/yugabyte/yugabyte-db)
>
>   - [xCluster 复制-两个数据中心 (2DC) 部署](https://docs.yugabyte.com/latest/architecture/docdb-replication/async-replication)
>   - [异步复制](https://docs.yugabyte.com/latest/deploy/multi-dc/async-replication)
>
>   - [多数据中心部署](https://docs.yugabyte.com/latest/deploy/multi-dc/)
>
>   - [主从部署命令](https://docs.yugabyte.com/latest/admin/yb-admin/#setup-universe-replication)


> [](https://www.zhihu.com/question/429946482/answer/1590899927)

> [](https://www.jdon.com/49487)

> [低延迟构建基于云的本地地理分布SQL应用程序的9种技术](https://blog.yugabyte.com/9-techniques-to-build-cloud-native-geo-distributed-sql-apps-with-low-latency/)

> [](https://zhuanlan.zhihu.com/p/102589603)

> [](http://ericfu.me/yugabyte-db-introduction/)

## 简介

适合需要绝对数据正确性且需要以下至少一项的云原生OLTP（即实时，业务关键）应用程序：可伸缩性，对故障的高度容忍度，全球分布的部署。

分布式事务事务设计基于Google Spanner架构。通过使用Raft共识用于混合和使用混合逻辑时钟的范围内部的分布式ACID事务，可以实现高度的写入一致性。

持续可用性，通过本机故障转移和修复对常见中断具有极强的恢复能力。

使用高性能文档存储、每个碎片分布式一致复制和多碎片ACID事务的独特组合(灵感来自谷歌Spanner)构建，它同时提供扩展的RDBMS和因特网规模的OLTP工作负载，具有低的查询延迟、极好的抗故障能力和全局数据分布。作为云本地数据库，它可以跨公共和私有云部署，也可以轻松地部署在Kubernetes环境中。

是一个事务性的数据库，它集合了云原生应用的4个必需的需求，即SQL作为一种灵活的查询语言，低延迟的性能，持续的可用性和全球分布的可扩展性。


### 云原生 ？

云原生是一种新型技术体系，是云计算未来的发展方向。其是基于分布部署和统一运管的浪潮分布式云，以容器、微服务、DevOps等技术为基础建立的一套云技术产品体系。

云原生应用也就是面向“云”而设计的应用，在使用云原生技术后，开发者无需考虑底层的技术实现，可以充分发挥云平台的弹性和分布式优势，实现快速部署、按需伸缩、不停机交付等。


### Raft共识协议

> [拜占庭将军问题](https://mp.weixin.qq.com/s/PJvCXm9pwU-Wp3LNN7g8pQ)

> [共识算法：Raft](https://www.jianshu.com/p/8e4bbe7e276c)


### 架构

> YugabyteDB集群由两个分布式服务组成-YB -TServer服务和YB-Master服务。

使用Raft共识协议以一种高度一致的方式在内部复制数据，以便在不影响数据正确性的情况下避免节点故障。

### [默认端口](https://docs.yugabyte.com/latest/reference/configuration/default-ports/)

7100 for YB-Master RPC communication 
9100 for YB-TServer RPC communication

7000 for viewing the YB-Master Admin UI  # 集群仪表板

5433 for YSQL
9042 for YCQL
6379 for YEDIS

## 问题记录

Q: 集群步骤需要，奇数个主机部署，目前只有两台（单区域中），两个区域四台
Q: 所有主机服务器，是否都有独立 IP 可以互相访问


## 对比

> [](https://docs.yugabyte.com/latest/comparisons/)

互为主从的情况下，主从都能提供读写，加上keepalived的高可用性

1. 综合网管只做监控查看，不手动操作 无法手动配置 运控主备切换

2. 综合网管只接口报警信息，不接受状态信息

