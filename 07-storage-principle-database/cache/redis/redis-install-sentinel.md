# REDIS 集群 哨兵模式搭建

> 基于单点REDIS或主从REDIS, 扩充搭建REDIS 哨兵模式集群

## 启动测试环境

docker run --name=redis-master-sentinel-1 -p 63791:6379 -it centos:7
docker run --name=redis-standby-sentinel-1 -p 63792:6379 -it centos:7
docker run --name=redis-standby-sentinel-2 -p 63793:6379 -it centos:7

docker cp /app/redis redis-master-sentinel-1:/app/redis
docker cp /app/redis redis-standby-sentinel-1:/app/redis
docker cp /app/redis redis-standby-sentinel-2:/app/redis

## 安装

> 1. 下载

wget http://download.redis.io/releases/redis-5.0.4.tar.gz
tar -zxvf redis-5.0.4.tar.gz
cd redis-5.0.4
make

> 2. 安装

mkdir -p /app/redis/bin
mkdir -p /app/redis/etc

cp src/redis-benchmark /app/redis/bin
cp src/redis-check-aof /app/redis/bin
cp src/redis-check-rdb /app/redis/bin
cp src/redis-cli /app/redis/bin
cp src/redis-sentinel /app/redis/bin
cp src/redis-server /app/redis/bin
cp src/redis-trib.rb /app/redis/bin

cp redis.conf /app/redis/etc
cp sentinel.conf /app/redis/etc

## 一、搭建REDIS

> 1. 配置主

cd /app/redis
cp etc/redis.conf etc/redis.conf.bak
vim etc/redis.conf
```ini
bind 0.0.0.0
daemonize yes
requirepass 0X48qrcP2mRs66xm
appendonly yes
```

> 2. 启动主并测试

./bin/redis-server /app/redis/etc/redis.conf


## 二、搭建从

> 1. 配置从

cd /app/redis
cp etc/redis.conf etc/redis.conf.bak
vim etc/redis.conf
```ini
bind 0.0.0.0
daemonize yes
requirepass 0X48qrcP2mRs66xm

# 设置主节点的信息
slaveof 172.17.0.10 6379
# 设置主节点的密码（没有可以不用设置）
masterauth 0X48qrcP2mRs66xm
```

> 2. 启动从并测试

./bin/redis-server /app/redis/etc/redis.conf


## 三、搭建哨兵

> 1. 配置哨兵

cd /app/redis
cp etc/redis.conf etc/redis.conf.bak
vim etc/redis.conf
```ini
bind 0.0.0.0
daemonize yes
requirepass 0X48qrcP2mRs66xm

# 设置主节点的信息
slaveof 172.17.0.10 6379
# 设置主节点的密码（没有可以不用设置）
masterauth 0X48qrcP2mRs66xm

# 不启动集群模式
cluster-enabled no
# 集群节点配置文件, 由redis集群自动创建更新
cluster-config-file nodes-6379.conf
cluster-node-timeout 15000
appendonly yes
```

cp etc/sentinel.conf etc/sentinel.conf.bak
vim etc/sentinel.conf
```ini
port 26379
daemonize yes

# 设置哨兵监控的主机地址
# 指定别名  主节点地址  端口  哨兵个数（有几个哨兵监控到主节点宕机执行转移） (num 是当主机宕机，从机选举通过票数1代表有一个投票就可以)
sentinel monitor mymaster 172.17.0.10 6379 2
# 设置主机的密码, 配置连接redis主节点密码（无密码可以省略）
sentinel auth-pass mymaster 0X48qrcP2mRs66xm

# 设置未得到主机响应时间，此处代表5秒未响应视为宕机, 如果哨兵3s内没有收到主节点的心跳，哨兵就认为主节点宕机了，默认是30秒
sentinel down-after-milliseconds mymaster 3000
# 选举出新的主节点之后，可以同时连接从节点的个数
# 设置等待主机活动时间，此处代表15秒主机未活动，则重新选举主机, 如果10秒后,master仍没活过来，则启动failover,默认180s
sentinel failover-timeout mymaster 10000
# 设置重新选举主机后，同一时间同步数据的从机数量，此处代表重新选举主机后，每次两台从机同步主机数据，直到所有从机同步结束
# 通常最后一个参数不能多于启动的sentinel实例数。建议至少启动三台sentinel实例。
sentinel parallel-syncs mymaster 2
```

> 2. 启动哨兵

./bin/redis-server /app/redis/etc/redis.conf
./bin/redis-sentinel /app/redis/etc/sentinel.conf


