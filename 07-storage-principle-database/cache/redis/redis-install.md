# redis install

## 安装部署

### 容器化安装

> 1. 拉取镜像

docker pull redis:5.0

> 2. 运行容器

docker run --name redis-server -p 6379:6379 -d redis:5.0 redis-server --appendonly yes

  # -v $PWD/data:/data 将主机中/opt/data/redis/目录挂载到容器的/data
  # redis-server --appendonly yes 在容器执行redis-server启动命令，并打开redis持久化配置
  # 没有密码

docker run --name redis-server -p 6379:6379 -d redis:5.0 redis-server --requirepass czxk --appendonly yes

> docker run --name redis-server -p 6379:6379 \
    -v /home/nlkj/redis/data:/data \
    -v /home/nlkj/redis/conf:/etc/redis \
    -d redis:5.0 redis-server --appendonly yes

  - -v /home/redis/data:/data 将主机中/opt/data/redis/目录挂载到容器的/data
  - redis-server --appendonly yes 在容器执行redis-server启动命令，并打开redis持久化配置
  - 没有密码
  - --requirepass wx_ctgcache_test#wx_HY@2021 # 设置密码

> docker run --name redis-server -p 6379:6379 \
    -v /home/data/redis/data:/data \
    -v /home/data/redis/conf:/etc/redis \
    -d redis:5.0 redis-server --appendonly yes

> docker run --name redis-server -p 31046:6379 \
    -v /home/data/redis/data:/data \
    -v /home/data/redis/conf:/etc/redis \
    -d redis:5.0 redis-server --requirepass wx_ctgcache_test#wx_HY@2021 --appendonly yes


docker run --name redis-server -p 6379:6379 -d redis:7.0 redis-server --requirepass 123456 --appendonly yes


### 二进制安装












