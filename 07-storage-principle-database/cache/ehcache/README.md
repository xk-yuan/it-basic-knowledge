# ehcache

>

## 资源

> [官网](https://www.ehcache.org/)
>
>   - [文档](https://www.ehcache.org/documentation/) | [文档3.9](https://www.ehcache.org/documentation/3.9/)
>
>   - [github](https://github.com/ehcache)
>
>   - [ehcache3](https://github.com/ehcache/ehcache3)
>   - [ehcache3-samples](https://github.com/ehcache/ehcache3-samples)


> [百度百科-ehcache](https://baike.baidu.com/item/ehcache/6036099)

> [EhCache简单入门](https://www.cnblogs.com/shoshana-kong/p/14923269.html)
>
> [](https://www.cnblogs.com/myseries/p/11370109.html)
>
> [](https://www.jianshu.com/p/5a0669d6305e/)


## 简介

Ehcache 是一种开源的、基于标准的缓存，可提高性能、卸载数据库并简化可扩展性。它是最广泛使用的基于 Java 的缓存，因为它健壮、经过验证、功能齐全，并与其他流行的库和框架集成。Ehcache 从进程内缓存一直扩展到具有 TB 级缓存的混合进程内/进程外部署。

EhCache 是一个纯Java的进程内缓存框架，具有快速、精干等特点，是Hibernate中默认的CacheProvider。是一种广泛使用的开源Java分布式缓存。主要面向通用缓存,Java EE和轻量级容器。它具有内存和磁盘存储，缓存加载器,缓存扩展,缓存异常处理程序,一个gzip缓存servlet过滤器,支持REST和SOAP api等特点。

EhCache支持单机缓存和分布式缓存，分布式可以理解为缓存数据的共享，这就导致内存缓存数据量偏小。ehcache缓存非常存储和读取非常快。

Ehcache最初是由Greg Luck于2003年开始开发。2009年,该项目被Terracotta购买。软件仍然是开源,但一些新的主要功能(例如，快速可重启性之间的一致性的)只能在商业产品中使用，例如Enterprise EHCache and BigMemory。维基媒体Foundationannounced目前使用的就是Ehcache技术。

可以单独使用，一般在第三方库中被用到的比较多（如mybatis、shiro等）ehcache 对分布式支持不够好，多个节点不能同步，通常和redis一块使用。

Ehache是第一个引入缓存数据持久化存储的开源java缓存框架，缓存的数据可以在机器重启后从磁盘上重新获得根据需要将缓存刷到磁盘。ehcache直接在jvm虚拟机中缓存，速度快，效率高；但是缓存共享麻烦，集群分布式应用不方便。redis是通过socket访问到缓存服务，效率比ecache低，比数据库要快很多，处理集群和分布式缓存方便，有成熟的方案。如果是单个应用或者对缓存访问要求很高的应用，用ehcache。如果是大型系统，存在缓存共享、分布式部署、缓存内容很大的，建议用redis。

> 特性

- 快速
- 简单
- 多种缓存策略
- 缓存数据有两级：内存和磁盘，因此无需担心容量问题
- 缓存数据会在虚拟机重启的过程中写入磁盘
- 可以通过RMI、可插入API等方式进行分布式缓存
- 具有缓存和缓存管理器的侦听接口
- 支持多缓存管理器实例，以及一个实例的多个缓存区域
- 提供Hibernate的缓存实现

> 使用ehcache适合两种业务

- 访问次数多, qps高，类似web放刷策略
- 需要缓存数据量小

> 缺点

- 如果不使用ehcache集群，在项目集群部署的情况下，敏感数据的更新可能不及时。所以，敏感数据不使用ehcache，如果使用建议ehcache的过期时间设置的非常小1-10秒


### ehcache3

```xml
<dependency>
    <groupId>org.ehcache</groupId>
    <artifactId>ehcache</artifactId>
    <version>3.9.6</version>
</dependency> 

<!-- JSR-107 API -->
<dependency>
    <groupId>javax.cache</groupId>
    <artifactId>cache-api</artifactId>
    <version>1.1.0</version>
</dependency>
```

