# redisson

>

## 资源

> [官网](http://redisson.org/)
>
>   - [文档](https://github.com/redisson/redisson/wiki/Table-of-Content)
>
>   - [github](https://github.com/redisson/redisson)
>
>   - [redisson-examples](https://github.com/redisson/redisson-examples)

> [开发小院 Redisson基本配置](http://www.voidcc.com/redisson/redisson-common-configuration)


> [](https://www.jianshu.com/p/43cfa79e62a5)
>
> [](https://www.zhihu.com/question/376677241)


## 简介

Redisson 是一个具有 In-Memory Data Grid 特性的 Redis Java 客户端。它提供了更方便和最简单的方式来使用 Redis。宗旨是促进使用者对Redis的的关注分离（相关分离），从而让使用者能够将精力更加集中地处理业务逻辑上。

Redisson 基于高性能异步无锁Java Redis客户端和Netty框架。是一个在Redis的的基础上实现的Java的驻内存数据网格（在内存数据网格）。它不仅提供了一系列的分布式的爪哇常用对象，还提供了许多分布式服务。

是Redis官方推荐的Java版的Redis客户端。提供的功能非常多，也非常强大。相较于暴露底层操作的Jedis，Redisson提供了一系列的分布式的 Java 常用对象，还提供了许多分布式服务。redis本身是不支持上述的分布式对象和集合，Redisson是通过利用redis的特性在客户端实现了高级数据结构和特性，例如优先队列的实现，是通过客户端排序整理后再存入redis。客户端实现，意味着当没有任何客户端在线时，这些所有的数据结构和特性都不会保留，也不会自动生效，例如过期事件的触发或原来优先队列的元素增加。

![](https://camo.githubusercontent.com/266bd96dac2f7104c719ff2c7c451ca36edbad5e38e266789140e8ebb7a828f8/68747470733a2f2f7265646973736f6e2e6f72672f6172636869746563747572652e706e67)

- 支持 Redis 单节点（single）模式、哨兵（sentinel）模式、主从（Master/Slave）模式以及集群（Redis Cluster）模式
- 程序接口调用方式采用异步执行和异步流执行两种方式
- 数据序列化，Redisson 的对象编码类是用于将对象进行序列化和反序列化，以实现对该对象在 Redis 里的读取和存储
- 单个集合数据分片，在集群模式下，Redisson 为单个 Redis 集合类型提供了自动分片的功能
- 提供多种分布式对象，如：Object Bucket，Bitset，AtomicLong，Bloom Filter 和 HyperLogLog 等
- 提供丰富的分布式集合，如：Map，Multimap，Set，SortedSet，List，Deque，Queue 等
- 分布式锁和同步器的实现，可重入锁（Reentrant Lock），公平锁（Fair Lock），联锁（MultiLock），红锁（Red Lock），信号量（Semaphonre），可过期性信号锁（PermitExpirableSemaphore）等
- 提供先进的分布式服务，如分布式远程服务（Remote Service），分布式实时对象（Live Object）服务，分布式执行服务（Executor Service），分布式调度任务服务（Schedule Service）和分布式映射归纳服务（MapReduce）


```xml
<dependency>
   <groupId>org.redisson</groupId>
   <artifactId>redisson</artifactId>
   <version>3.16.6</version>
</dependency>  
```

> distributed locks and synchronizers


