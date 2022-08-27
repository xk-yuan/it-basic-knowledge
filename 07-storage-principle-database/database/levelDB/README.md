# LevelDB

> 开源的key-value, NOSQL 嵌入式数据库, 支持亿级别规模数据

## 资源

> [leveldb](https://github.com/google/leveldb)

> 总结数据库操作
>
> 1. 数据库分类: SQL 和 NoSQL
> 2. 基于数据库分类, 主要总结有两种数据库操作方式 (公共接口): SQL 操作、和NoSQL, 而NoSQL可以定义key-value操作方式
> 3. 

### 第一步搜索整理

> [百度百科-LevelDB](https://baike.baidu.com/item/LevelDB/6416354)

> [leveldb简介](https://www.jianshu.com/p/828b1820cb30)
>
> [初识：LevelDB](https://www.cnblogs.com/yizhiweiyan/p/13303056.html)
>
> [LevelDB，你好](https://www.cnblogs.com/yizhiweiyan/p/13378783.html)
>
> [数据分析与处理之二（Leveldb 实现原理）](https://www.cnblogs.com/haippy/archive/2011/12/04/2276064.html)
>
> [Leveldb 基本介绍和使用指南](https://zhuanlan.zhihu.com/p/322520485)
>
> [LevelDb（一）：LevelDb简介](https://blog.csdn.net/MOU_IT/article/details/116884919)
>
> [LevelDB、TreeDB、SQLite3性能对比测试](https://www.oschina.net/question/12_25944)
>
> [【深度知识】LevelDB从入门到原理详解](https://www.jianshu.com/p/137eda069f36)
>
> [LevelDB之从TiDB说起](https://www.modb.pro/db/181756)

### 安装使用

> [leveldb 安装及使用](https://www.jianshu.com/p/8392acf7c9db)

### java&go 使用 leveldb

> [LevelDB Java&Go实践](https://www.cnblogs.com/FunTester/p/15561513.html)
>
> [Java LevelDB 初体验](https://ld246.com/article/1530071106598)
>
> [](http://code.google.com/p/leveldb-java/)
>
> [LevelDB Java&Go实践](https://cloud.tencent.com/developer/article/1903101)
>
> [levelDB in Java （基本篇）](https://www.jianshu.com/p/7b095822e47a)

## 简介

由Google, 基于C/C++开发的, 开源的, 可持久化的, key-value数据库, 是 NOSQL 存储引擎库, 提供了一个有序的以字符串为key和value的Map。

LevelDB是Jeff Dean和Sanjay Ghemawat对BigTable中KV存储分片Tablet的高度复刻, 两位大牛也是BigTable论文的作者。

使用场景，比较适合单机KV存储。本质上是一个存储引擎，即一套存储系统以及在这套存储系统上提供的一些操作接口。

> 特点

- Key 和 value 可以是任意长度的字节数组
- 数据是按Key有序存储的，也就是说，范围查询效率会很高
- 支持用户提供自定义Key排序规则
- 与其他KV存储系统类似，提供Put(key, value)，Get(key)，Delete(key)这些基本操作
- 支持在一个原子批量操作中对同一个Key执行多次修改操作
- 通过瞬时快照(Transient Snapshot)为用户提供一致的数据视图
- 支持数据的前向/后向迭代遍历
- 底层使用Snappy compression library压缩算法自动对数据进行压缩
- 将外部活动(例如，文件系统操作)抽象为虚拟接口，为用户自定义这些操作系统交互方式提供了便利，也就是说，用户可以自定义底层到底是与Linux系统交互，还是与Windows系统交互，甚至于HDFS/GFS等分布式文件系统

> 限制

- 不是SQL数据库，不存在关系数据模型，也不支持SQL查询，同样不支持索引
- 在同一时间内，只有一个进程（可以是多线程）能对leveldb进行访问
- 本身不是基于C/S(Client/Server)模型的，也就是说，如果你想要像MySQL等各种其他数据库那样，通过客户端连接远程服务器的方式访问LevelDB的话，那么，你需要自己将LevelDB包装成服务端，然后再实现相应的客户端才可以

### 源码编译安装及其使用

### Java&Go 使用 LevelDB


