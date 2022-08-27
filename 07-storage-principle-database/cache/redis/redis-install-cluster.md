# redis 集群部署

> 部署redis集群

> - 主从部署方案
> - Sentinel哨兵模式部署方案
> - reids cluster部署方案

## 资源

> [官网]](http://www.redis.cn/)
>
>   - [download(http://download.redis.io/releases/)
>   - [redis-5.0.4.tar.gz](http://download.redis.io/releases/redis-5.0.4.tar.gz)
>
>   - [Redis 集群教程](http://www.redis.cn/topics/cluster-tutorial.html)

> [Redis三种集群模式详解](https://www.jb51.net/article/224568.htm)
>
> [Redis 集群的三种方式](https://baijiahao.baidu.com/s?id=1711076375186780998)


> [Redis主从及哨兵模式的部署](https://www.jianshu.com/p/c53da9262e1e)

> [redis搭建哨兵模式](https://blog.csdn.net/weixin_38879931/article/details/122901004)
>
> [redis高可用集群sentinel哨兵模式的搭建和使用](https://blog.csdn.net/weixin_49686768/article/details/121949606)

> [Redis集群](https://blog.csdn.net/weixin_45829957/article/details/116355899)
>
> [redis集群搭建](https://blog.csdn.net/qq_42815754/article/details/82912130)


## 简介

### Redis 主从集群

优点：
1、实现读写分离，提高了可用性，解决了单机故障2、主从复制期间master和slave都是非阻塞方式，仍然可用。
缺点：
1、master宕机期间，需要手动切换主机，同时会有部分数据不能及时同步从服务器，造成数据不一致（需要人工手动介入）
2、slave宕机后，多个slave恢复后，大量的SYNC同步会造成master IO压力倍增（可以手动规避启动时间）
3、在线扩容较复杂。
总结：
redis主从复制的优点主要是提高了可用性缺点

#### 搭建部署

- 192.168.11.101
- 192.168.11.102
- 192.168.11.103

> 配置主从

vim redis.conf
```conf redis.conf
port 6379
daemonize yes
# 设置密码
requirepass 123456

# 设置pid文件和日志文件路径
pidfile "/app/data/redis/6379/redis.pid"
logfile "/app/data/redis/6379/redis.log"
# 设置rdb文件
dbfilename "redis_dump.rdb"
dir "/app/data/redis/6379/"

# 设置主节点的信息
slaveof 127.0.0.1 6379
# 设置主节点的密码（没有可以不用设置）
masterauth lixl123
```

> 启动

redis-server redis.conf


### Redis Sentinel 哨兵模式

Sentinel 哨兵模式是为了弥补主从复制集群中主机宕机后，主备切换的复杂性而演变出来的。哨兵顾名思义，就是用来监控的，主要作用就是监控主从集群，自动切换主备，完成集群故障转移。

是Redis的高可用解决方案：一个或多个Sentinel实例（instance）组成的Sentinel系统（system）可以监视任意多个主服务器，以及这些主服务器属下的所有从服务器，并在主服务器下线时可以自动切换从服务器升级为主服务器。

优点：
1、哨兵模式基于主从复制，因此主从复制的优点哨兵都具备 2、哨兵具备了主从切换和故障转移，因此集群有了更高的可用性
缺点：
1、Redis较难支持在线扩容，在线扩容比较复杂。
总结：
sentinel 哨兵主要用来监控redis主从集群，提高了redis 主从集群的可用性。

#### 搭建部署

- 192.168.11.101
- 192.168.11.102
- 192.168.11.103

> 配置

vim redis.conf
```conf redis.conf
port 6379
daemonize yes
requirepass "123456"
# 绑定当前机器 IP
bind 172.22.169.168
#
# 数据文件存放位置
dir "/app/data/redis/6379/data"
#
pidfile "/app/data/redis/6379/redis.pid"
#
# 不启动集群模式
cluster-enabled no
# 6382和port要对应
cluster-config-file "redis_6379.conf"
cluster-node-timeout 15000
appendonly yes
# 设置主节点的密码
masterauth "123456"
```

vim sentinel.conf
```conf sentinel.conf 
port 16379
# 指定工作目录
dir "/app/data/redis/6379/data"
logfile "sentinel.log"

# 设置哨兵监控的主机地址
# 指定别名  主节点地址  端口  哨兵个数（有几个哨兵监控到主节点宕机执行转移） (num 是当主机宕机，从机选举通过票数1代表有一个投票就可以)
sentinel monitor mymaster 47.119.159.55 6382 1
# 设置主机的密码, 配置连接redis主节点密码（无密码可以省略）
sentinel auth-pass mymaster 123456

# 设置未得到主机响应时间，此处代表5秒未响应视为宕机, 如果哨兵3s内没有收到主节点的心跳，哨兵就认为主节点宕机了，默认是30秒
sentinel down-after-milliseconds mymaster 3000
# 选举出新的主节点之后，可以同时连接从节点的个数
# 设置等待主机活动时间，此处代表15秒主机未活动，则重新选举主机, 如果10秒后,master仍没活过来，则启动failover,默认180s
sentinel failover-timeout mymaster 10000

# 设置重新选举主机后，同一时间同步数据的从机数量，此处代表重新选举主机后，每次两台从机同步主机数据，直到所有从机同步结束
# 通常最后一个参数不能多于启动的sentinel实例数。建议至少启动三台sentinel实例。
sentinel parallel-syncs mymaster 2
```

> 启动redis节点, 启动哨兵

./redis-server redis.conf
./redis-sentinel sentinel.conf


### Redis Sentinel集群

cluster 模式是redis官方提供的集群模式，使用了Sharding 技术，不仅实现了高可用、读写分离、也实现了真正的分布式存储。

1、实现了分布式存储，节省了内存

reids cluster, 是一种服务器 Sharding 技术，redis 3.0版本开始正式提供。Redis官方集群方案 Redis Cluster（服务端sharding）Redis cluster是一种在服务端sharding（分片）的技术。

reids Sentinel 基本已经实现了高可用，但是每台机器都存储相同内容，很浪费内存，所以Redis Cluster实现了分布式存储。

Redis cluster的服务端sharding引入了slot（槽）的概念，一共分为16384（2^14）个slot，集群中的每个node节点负责分摊这些slot，每个进入redis的键值对，根据key进行hash运算，除以16384取模，匹配相应的slot，再分配进相应的node中的实例中。在redis cluster方案中，数据储存的粒度由原来的instance再次精细为slot。Redis cluster提供一种叫做cluster bus（集群总线）的功能特性，采用特殊的二进制协议，通信及响应速度极快。它提供节点故障检测、故障转移、新节点识别等节点管理功能，该功能的进程间通信端口号为服务端口号值+10000，例如redis对外提供服务的端口号为6555，则cluster bus的端口号则为16555。


为了实现集群的高可用，即判断节点是否健康（能否正常使用），redis-cluster有这么一个投票容错机制：如果集群中超过半数的节点投票认为某个节点挂了，那么这个节点就挂了（fail）。这是判断节点是否挂了的方法；

如果集群中任意一个节点挂了，而且该节点没有从节点（备份节点），那么这个集群就挂了。这是判断集群是否挂了的方法；

那么为什么任意一个节点挂了（没有从节点）这个集群就挂了呢？ -> 因为集群内置了16384个slot（哈希槽），并且把所有的物理节点映射到了这16384[0-16383]个slot上，或者说把这些slot均等的分配给了各个节点。当需要在Redis集群存放一个数据（key-value）时，redis会先对这个key进行crc16算法，然后得到一个结果。再把这个结果对16384进行求余，这个余数会对应[0-16383]其中一个槽，进而决定key-value存储到哪个节点中。所以一旦某个节点挂了，该节点对应的slot就无法使用，那么就会导致集群无法正常工作。

> 配置

```conf redis.conf
port 6379
pidfile "/var/run/redis_6379.pid"
dbfilename "dump6379.rdb"
dir "/app/data/redis/redis_cluster"
logfile "/var/log/redis_err_6379.log"
# 选项用于开实例的集群模式
cluster-enabled yes
# 选项则设定了保存节点配置文件的路径
cluster-config-file nodes-6379.conf
# 设定节点失联时间，超过该时间（毫秒），集群自动进行主从切换
cluster-node-timeout 5000
appendonly yes
```

redis-cli --cluster create --cluster-replicas 1 192.168.11.101:6379 192.168.11.102:6379 192.168.11.103:6379

--replicas 1 采用最简单的方式配置集群，一台主机，一台从机，正好三组。

redis-cli -c -p 6379
cluster nodes
cluster info


#### 搭建部署

- 192.168.11.101
- 192.168.11.102
- 192.168.11.103

> 每台机器分别执行

mkdir -p /app/data/redis/

vim /app/data/redis/cluster-6379.conf
```conf cluster-6379.conf
port 6379
pidfile "/var/run/redis_6379.pid"
dir "/app/data/redis/"
dbfilename "dump6379.rdb"
logfile "/var/log/redis_6379.log"

cluster-enabled yes
cluster-config-file nodes-6379.conf
cluster-node-timeout 5000
appendonly yes
```

> 启动redis

./redis-server /app/data/redis/cluster-6379.conf

> 配置集群

redis-cli --cluster create --cluster-replicas 1 192.168.11.101:6379 192.168.11.102:6389 192.168.11.102:6379 192.168.11.103:6389 192.168.11.103:6379 192.168.11.101:6389




