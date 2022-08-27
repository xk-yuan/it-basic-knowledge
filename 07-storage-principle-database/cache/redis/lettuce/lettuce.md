# Lettuce

>

## 资源

> [官网](https://lettuce.io/)
>
>   - [文档](https://lettuce.io/docs/)
>
>   - [github](https://github.com/lettuce-io/lettuce-core)

> [](https://zhuanlan.zhihu.com/p/143044609)

> [](https://www.zhihu.com/question/53124685)
>
> [](https://www.cnblogs.com/liyan492/p/9858548.html)
>
> [](https://blog.csdn.net/qq_18671415/article/details/110875621)
>
> [](https://www.jianshu.com/p/609cb280fc06)

## 简介

Lettuce 是一个可扩展的线程安全 Redis 客户端，用于同步、异步和反应式使用。如果多个线程避免阻塞和事务性操作，其基于Netty， 支持高级 Redis 功能，例如 Sentinel、集群、流水线、自动重新连接和 Redis 数据模型。

是Redis的Java实现客户端，提供了比较全面的Redis命令的支持, Redisson 实现了分布式和可扩展的Java数据结构。Lettuce 高级Redis客户端，用于线程安全同步，异步和响应使用，支持集群，Sentinel，管道和编码器。

Jedis 比较全面的提供了Redis的操作特性; Redisson 促使使用者对Redis的关注分离，提供很多分布式相关操作服务，例如，分布式锁，分布式集合，可通过Redis支持延迟队列; Lettuce 主要在一些分布式缓存框架上使用比较多

```xml
<dependency>
  <groupId>io.lettuce</groupId>
  <artifactId>lettuce-core</artifactId>
  <version>x.y.z</version>
</dependency>
```

