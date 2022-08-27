# yugabytedb install

## 安装部署

> [部署](https://docs.yugabyte.com/latest/deploy/manual-deployment/)


### 容器安装

1. image

> docker pull yugabytedb/yugabyte:2.5.3.1-b10

2. linux

docker run -d --name yugabyte --net=host -p 7000:7000 -p 9000:9000 -p 9042:9042 -p 5433 yugabytedb/yugabyte:2.5.3.1-b10 bash -c "bin/yugabyted start"

docker run -d --name yugabyte --net=host -p 7000:7000 -p 9000:9000 -p 9042:9042 -p 5433 yugabytedb/yugabyte:2.5.3.1-b10 bash -c "bin/yugabyted start"

docker run -m 300M --memory-reservation 100M  -d --name yugabyte -p 7000:7000 -p 9001:9000 -p 9042:9042 -p 5433:5433 yugabytedb/yugabyte:2.5.3.1-b10 bash -c "bin/yugabyted start && sleep 600000000000"

docker run --rm -p 7000:7000 -p 9000:9000 -p 9042:9042 -p 5433:5433 yugabytedb/yugabyte:2.5.3.1-b10 bash -c "bin/yugabyted start && sleep 6000"

read -t 60 -p 'wait input ... ' INPUT_VALUE # 等待60秒控制台输入，并赋值给 变量 INPUT_VALUE

sleep 60 # 休眠60秒

> 本地集群

> ./bin/yugabyted start

创建集群后，客户端可以分别在localhost:5433和连接到YSQL和YCQL API localhost:9042。您还可以检查./var/data以查看数据目录和./var/logs日志目录

该 YB-主管理用户界面 可在http://127.0.0.1:7000 和 YB-TSERVER管理UI，请 http://127.0.0.1:9000。

> ./bin/yugabyted status  # 查看集群状态

> 集群配置

> 服务器 A:

docker run --net=host --name yugabyte-a \
  -v /home/ykdl:/home/ykdl
  -d yugabytedb/yugabyte:2.5.3.1-b10 \
  bash -c "/home/ykdl/yugabyte.sh"

-p 7000:7000 -p 9000:9000 -p 9042:9042 -p 5433

docker run --name yugabyte-a -p 7000:7000 -p 9000:9000 -p 9042:9042 -p 5433:5433  -v F://home/ykdl:/home/ykdl -d yugabytedb/yugabyte:2.5.3.1-b10 bash -c "/home/ykdl/yugabyte.sh"

> docker network create --subnet=172.18.0.0/16 mynet
>  --net mynet --ip 172.18.0.3

> 集群

docker run --name yugabyte-a -v F://home/ykdl:/home/ykdl -d yugabytedb/yugabyte:2.5.3.1-b10 bash -c "/home/ykdl/yugabyte-a.sh"
docker run --name yugabyte-b -v F://home/ykdl:/home/ykdl -d yugabytedb/yugabyte:2.5.3.1-b10 bash -c "/home/ykdl/yugabyte-b.sh"
docker run --name yugabyte-c -v F://home/ykdl:/home/ykdl -d yugabytedb/yugabyte:2.5.3.1-b10 bash -c "/home/ykdl/yugabyte-c.sh"
docker run --name yugabyte-d -v F://home/ykdl:/home/ykdl -d yugabytedb/yugabyte:2.5.3.1-b10 bash -c "/home/ykdl/yugabyte-d.sh"


### 离线安装

#### 1. 安装依赖

> 校验检测时间

date # 查询系统当前时间

ntpdate  0.pool.ntp.org # 同步标准时间


> python --version && python 3.7.3 | apt install python-is-python3

Python 2.7.5 (旧版本)

#### 2. 下载安装

> wget https://downloads.yugabyte.com/yugabyte-2.8.0.0-linux.tar.gz

> tar -zxvf yugabyte-2.8.0.0-linux.tar.gz && cd yugabyte-2.8.0.0/

#### 3. 安装配置

> ./bin/post_install.sh   # 安装配置

```sh
[root@localhost yugabyte-2.5.3.1]# ./bin/post_install.sh
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so ldb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib ldb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so log-dump
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib log-dump
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so sst_dump
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib sst_dump
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so yb-admin
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib yb-admin
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so yb-bulk_load
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib yb-bulk_load
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so yb-generate_partitions_main
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib yb-generate_partitions_main
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so yb-master
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib yb-master
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so yb-pbc-dump
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib yb-pbc-dump
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so yb-ts-cli
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib yb-ts-cli
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so yb-tserver
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib yb-tserver
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so yb-ysck
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib yb-ysck
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so redis-cli
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib redis-cli
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so postgres
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib postgres
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so postmaster
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib postmaster
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so ecpg
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib ecpg
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so initdb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib initdb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_archivecleanup
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_archivecleanup
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_basebackup
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_basebackup
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_receivewal
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_receivewal
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_recvlogical
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_recvlogical
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_config
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_config
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_controldata
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_controldata
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_ctl
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_ctl
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so ysql_dump
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib ysql_dump
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_restore
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_restore
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so ysql_dumpall
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib ysql_dumpall
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_resetwal
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_resetwal
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_rewind
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_rewind
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_test_fsync
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_test_fsync
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_test_timing
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_test_timing
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_upgrade
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_upgrade
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_verify_checksums
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_verify_checksums
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_waldump
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_waldump
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so ysql_bench
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib ysql_bench
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so ysqlsh
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib ysqlsh
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so createdb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib createdb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so dropdb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib dropdb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so createuser
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib createuser
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so dropuser
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib dropuser
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so clusterdb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib clusterdb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so vacuumdb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib vacuumdb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so reindexdb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib reindexdb
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_isready
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_isready
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so oid2name
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib oid2name
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so pg_standby
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib pg_standby
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-interpreter /home/ykdl/yugabyte-2.5.3.1/lib/ld.so vacuumlo
+ /home/ykdl/yugabyte-2.5.3.1/bin/patchelf --set-rpath /home/ykdl/yugabyte-2.5.3.1/lib/yb:/home/ykdl/yugabyte-2.5.3.1/lib/yb-thirdparty:/home/ykdl/yugabyte-2.5.3.1/linuxbrew/lib vacuumlo
```

> ./bin/yugabyted start   # 验证快速启动单机版

```sh
[root@localhost yugabyte-2.5.3.1]# ./bin/yugabyted start
Starting yugabyted...
WARNING: Failed to meet recommended settings. Ulimits too low - open_files.
Note yugabyted will still run, although it may fail for larger workloads. For more info, see https://docs.yugabyte.com/latest/deploy/manual-deployment/system-config

✅ System checks           

+--------------------------------------------------------------------------------------------------+
|                                            yugabyted                                             |
+--------------------------------------------------------------------------------------------------+
| Status              : Running. Leader Master is present                                          |
| Web console         : http://127.0.0.1:7000                                                      |
| JDBC                : jdbc:postgresql://127.0.0.1:5433/yugabyte?user=yugabyte&password=yugabyte  |
| YSQL                : bin/ysqlsh   -U yugabyte -d yugabyte                                       |
| YCQL                : bin/ycqlsh   -u cassandra                                                  |
| Data Dir            : /root/var/data                                                             |
| Log Dir             : /root/var/logs                                                             |
| Universe UUID       : 602034ff-9df5-4cc8-b368-7ce554d2ae20                                       |
+--------------------------------------------------------------------------------------------------+
🚀 yugabyted started successfully! To load a sample dataset, try 'yugabyted demo'.
🎉 Join us on Slack at https://www.yugabyte.com/slack
👕 Claim your free t-shirt at https://www.yugabyte.com/community-rewards/

> ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------

[root@localhost yugabyte-2.5.3.1]# ps -ef|grep yugabyte

root       6391      1  0 09:53 ?        00:00:00 python ./bin/yugabyted start

root       6399   6391 15 09:53 ?        00:00:05 
/home/ykdl/yugabyte-2.5.3.1/bin/yb-master \
  --stop_on_parent_termination \
  --undefok=stop_on_parent_termination \
  --fs_data_dirs=/root/var/data \
  --webserver_interface=0.0.0.0 \
  --metrics_snapshotter_tserver_metrics_whitelist=handler_latency_yb_tserver_TabletServerService_Read_count,handler_latency_yb_tserver_TabletServerService_Write_count,handler_latency_yb_tserver_TabletServerService_Read_sum,handler_latency_yb_tserver_TabletServerService_Write_sum,disk_usage,cpu_usage,node_up --yb_num_shards_per_tserver=1 --ysql_num_shards_per_tserver=1 --cluster_uuid=602034ff-9df5-4cc8-b368-7ce554d2ae20 \
  --rpc_bind_addresses=127.0.0.1:7100 \
  --server_broadcast_addresses=127.0.0.1:7100 \
  --replication_factor=1 \
  --use_initial_sys_catalog_snapshot \
  --server_dump_info_path=/root/var/data/master-info \
  --master_enable_metrics_snapshotter=true \
  --webserver_port=7000 \
  --default_memory_limit_to_ram_ratio=0.35 \
  --instance_uuid_override=c41d0c7ee2ee484e868f897704983be0 \
  --master_addresses=127.0.0.1:7100

root       6456   6391  1 09:53 ?        00:00:00 
/home/ykdl/yugabyte-2.5.3.1/bin/yb-tserver \
  --stop_on_parent_termination \
  --undefok=stop_on_parent_termination \
  --fs_data_dirs=/root/var/data \
  --webserver_interface=0.0.0.0 \
  --metrics_snapshotter_tserver_metrics_whitelist=handler_latency_yb_tserver_TabletServerService_Read_count,handler_latency_yb_tserver_TabletServerService_Write_count,handler_latency_yb_tserver_TabletServerService_Read_sum,handler_latency_yb_tserver_TabletServerService_Write_sum,disk_usage,cpu_usage,node_up --yb_num_shards_per_tserver=1 --ysql_num_shards_per_tserver=1 --cluster_uuid=602034ff-9df5-4cc8-b368-7ce554d2ae20 \
  --rpc_bind_addresses=0.0.0.0:9100 \
  --server_broadcast_addresses=127.0.0.1:9100 \
  --cql_proxy_bind_address=0.0.0.0:9042 \
  --server_dump_info_path=/root/var/data/tserver-info \
  --start_pgsql_proxy \
  --pgsql_proxy_bind_address=0.0.0.0:5433 \
  --tserver_enable_metrics_snapshotter=true \
  --metrics_snapshotter_interval_ms=11000 \
  --webserver_port=9000 \
  --default_memory_limit_to_ram_ratio=0.6 \
  --instance_uuid_override=5c4eca8db78746e6a899d3e547706e8a \
  --start_redis_proxy=false \
  --tserver_master_addrs=127.0.0.1:7100

root       6546   6456  0 09:53 ?        00:00:00 
/home/ykdl/yugabyte-2.5.3.1/postgres/bin/postgres \
  -D /root/var/data/pg_data \
  -p 5433 -h 0.0.0.0 \
  -k /tmp/.yb.8228272234018189749 \
  -c unix_socket_permissions=0700 \
  -c logging_collector=on \
  -c log_directory=/root/var/data/yb-data/tserver/logs \
  -c shared_preload_libraries=pg_stat_statements,yb_pg_metrics,pgaudit,pg_hint_plan \
  -c yb_pg_metrics.node_name=localhost.localdomain:9000 \
  -c yb_pg_metrics.port=13000 \
  -c config_file=/root/var/data/pg_data/ysql_pg.conf \
  -c hba_file=/root/var/data/pg_data/ysql_hba.conf
root       6567   1336  0 09:54 pts/0    00:00:00 grep --color=auto yugabyte
```

> ./bin/yugabyted status  # 查看状态

```sh
[root@localhost yugabyte-2.5.3.1]# ./bin/yugabyted status

+--------------------------------------------------------------------------------------------------+
|                                            yugabyted                                             |
+--------------------------------------------------------------------------------------------------+
| Status              : Running. Leader Master is present                                          |
| Web console         : http://127.0.0.1:7000                                                      |
| JDBC                : jdbc:postgresql://127.0.0.1:5433/yugabyte?user=yugabyte&password=yugabyte  |
| YSQL                : bin/ysqlsh   -U yugabyte -d yugabyte                                       |
| YCQL                : bin/ycqlsh   -u cassandra                                                  |
| Data Dir            : /root/var/data                                                             |
| Log Dir             : /root/var/logs                                                             |
| Universe UUID       : 602034ff-9df5-4cc8-b368-7ce554d2ae20                                       |
+--------------------------------------------------------------------------------------------------+
```

> ./bin/yugabyted stop  # 停止

```sh
[root@localhost yugabyte-2.5.3.1]# ./bin/yugabyted stop
Stopped yugabyted using config /root/var/conf/yugabyted.conf.

> ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------

[root@localhost yugabyte-2.5.3.1]# ./bin/yugabyted -h

Usage: yugabyted [-h]
                          
                          {start,stop,destroy,status,version,collect_logs,connect,demo}
                          ...

To start yugabyted, run 'yugabyted start'.

Commands:
  {start,stop,destroy,status,version,collect_logs,connect,demo}
    start               Start yugabyted.
    stop                Stop running yugabyted.
    destroy             Destroy yugabyted cluster and remove data.
    status              Print status of yugabyted.
    version             Version of yugabyted.
    collect_logs        Collect and package logs for troubleshooting.
    connect             Connect to an API through the CLI.
    demo                Load and interact with preset demo data.

Flags:
  -h, --help            show this help message and exit

Run 'yugabyted [command] -h' for help with specific commands.
```

#### 4. 手动部署集群

> [YB-Master 服务](https://docs.yugabyte.com/latest/architecture/concepts/yb-master/) | [](https://docs.yugabyte.com/latest/reference/configuration/yb-master/)

![](https://docs.yugabyte.com/images/architecture/master_overview.png)

- 系统集群中，充当元数据管理器的角色，存在哪些用户和角色，与它们相关联的权限等等，并负责协调后台操作，并执行各种管理操作，例如创建、更改和删除表

- flagfile         指定要从中加载标志的配置文件
- master_addresses 指定用于yb-master共识配置的所有RPC地址的逗号分隔列表; 逗号分隔值的数量应与 YB-Master 服务器的总数（或复制因子）相匹配
- fs_data_dirs     指定以逗号分隔的挂载目录列表，其中yb-master将添加yb-data/master数据目录master.err、master.out、 和pg_data目录
- rpc_bind_addresses  指定要绑定到 RPC 连接的网络接口地址的逗号分隔列表; 默认：0.0.0.0:7100
- server_broadcast_addresses 指定服务器的公共 IP 或 DNS 主机名（带有可选端口）。服务器使用此值相互通信，具体取决于连接策略参数。

> [YB-TServer 服务](https://docs.yugabyte.com/latest/architecture/concepts/yb-tserver/) | [](https://docs.yugabyte.com/latest/reference/configuration/yb-tserver/)

![](https://docs.yugabyte.com/images/architecture/tserver_overview.png)

- 负责YugabyteDB集群中最终用户请求的实际IO.

- tserver_master_addrs     指定所有yb-masterRPC 地址的逗号分隔列表; 逗号分隔值的数量应与 YB-Master 服务器的总数（或复制因子）相匹配;
- rpc_bind_addresses       指定要绑定到 RPC 连接的网络接口地址的逗号分隔列表; 值必须与所有yb-master和yb-tserver配置匹配;
- pgsql_proxy_bind_address
- cql_proxy_bind_address   指定 YCQL API 的绑定地址;默认值：0.0.0.0:9042
- fs_data_dirs             指定以逗号分隔的挂载目录列表，其中yb-tserver将添加yb-data/tserver数据目录tserver.err、tserver.out、 和pg_data目录
- start_pgsql_proxy   
- enable_ysql=true         当值为 时启用 YSQL API true。替换已弃用的--start_pgsql_proxy标志。

- placement_cloud          部署此实例的云的名称
- placement_region         部署此实例的区域或数据中心的名称
- placement_zone           部署此实例的可用区 (AZ) 或机架的名称


##### 集群每台服务器都执行操作 (172.151.17.130, 172.151.17.220, 172.151.17.140)

> mkdir -p /home/ykdl/db/disk1 && mkdir -p /home/ykdl/db/disk2     # 1. 创建目录

> a. 直接执行                                                       # 2. 启动 YB-Maste

./bin/yb-master \
  --master_addresses 172.151.17.130:7100,172.151.17.220:7100,172.151.17.140:7100 \
  --rpc_bind_addresses 172.151.17.130:7100 \
  --fs_data_dirs "/home/ykdl/db/disk1,/home/ykdl/db/disk2" \
  --placement_cloud aws \
  --placement_region us-west \
  --placement_zone us-west-2a \
  >& /home/ykdl/db/disk1/yb-master.out &

> b. 配置文件执行

./bin/yb-master --flagfile master.conf >& /home/ykdl/db/disk1/yb-master.out &

```ini master.conf
--master_addresses=172.151.17.130:7100,172.151.17.220:7100,172.151.17.140:7100
--rpc_bind_addresses=172.151.17.130:7100
--fs_data_dirs=/home/ykdl/db/disk1,/home/ykdl/db/disk2
--placement_cloud=aws 
--placement_region=us-west
--placement_zone=us-west-2a 
```

> a. 直接执行                                                       # 3. 启动 YB-TServer

./bin/yb-tserver \
  --tserver_master_addrs 172.151.17.130:7100,172.151.17.220:7100,172.151.17.140:7100 \
  --rpc_bind_addresses 172.151.17.130:9100 \
  --pgsql_proxy_bind_address 172.151.17.130:5433 \
  --cql_proxy_bind_address 172.151.17.130:9042 \
  --fs_data_dirs "/home/ykdl/db/disk1,/home/ykdl/db/disk2" \
  --start_pgsql_proxy \
  --placement_cloud aws \
  --placement_region us-west \
  --placement_zone us-west-2a \
  >& /home/ykdl/db/disk1/yb-tserver.out &

> b. 配置文件执行

./bin/yb-tserver --flagfile tserver.conf >& /home/ykdl/db/disk1/yb-tserver.out &

```ini
--tserver_master_addrs=172.151.17.130:7100,172.151.17.220:7100,172.151.17.140:7100
--rpc_bind_addresses=172.151.17.130:9100
--pgsql_proxy_bind_address=172.151.17.130:5433
--cql_proxy_bind_address=172.151.17.130:9042
--fs_data_dirs=/home/ykdl/db/disk1,/home/ykdl/db/disk2
--start_pgsql_proxy
--placement_cloud=aws 
--placement_region=us-west 
--placement_zone=us-west-2a 
```

> 验证

curl -s http://<any-master-ip>:7000/cluster-config
curl -s http://<any-server-ip>:9000

### 防火墙设置

> firewall-cmd --query-port=7000/tcp
> firewall-cmd --zone=public --add-port=7000/tcp --permanent  # master ui
> firewall-cmd --zone=public --add-port=9000/tcp --permanent  # server ui
>
> firewall-cmd --zone=public --add-port=7100/tcp --permanent  # master 集群通信端口
> firewall-cmd --zone=public --add-port=9100/tcp --permanent  # server 通信端口
> firewall-cmd --zone=public --add-port=5433/tcp --permanent  # pgsql  数据库端口
> firewall-cmd --zone=public --add-port=9042/tcp --permanent  # YCQL API
> firewall-cmd --reload
> firewall-cmd --list-port

./bin/yb-ctl destroy


### 5. 集群配置 (使用 yb-master ，yb-tserver 命令)

> 该集群配置测试结果，matser 和 tserver 服务，设置最少复制数据为3，可容忍单机数目 1，超过此数服务异常

> 实现，两个单独网络，并组成整个集群

> 四台机器, 192.168.10.240,192.168.10.241,192.168.10.242,192.168.10.243

> 192.168.10.240

> 1. yb-master 配置

./bin/yb-master \
  --master_addresses 192.168.10.241:7100,192.168.10.242:7100,192.168.10.243:7100 \
  --rpc_bind_addresses 192.168.10.240:7100 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  --master_replication_factor 3 \
  --tserver_master_replication_factor 3 \
  >& /home/ykdl/db/disk/yb-master.out &

./bin/yb-master \
  --master_addresses 192.168.10.241:7100,192.168.10.242:7100,192.168.10.243:7100 \
  --rpc_bind_addresses 192.168.10.241:7100 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  --master_replication_factor 3 \
  --tserver_master_replication_factor 3 \
  >& /home/ykdl/db/disk/yb-master.out &

./bin/yb-master \
  --master_addresses 192.168.10.241:7100,192.168.10.242:7100,192.168.10.243:7100 \
  --rpc_bind_addresses 192.168.10.242:7100 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  --master_replication_factor 3 \
  --tserver_master_replication_factor 3 \
  >& /home/ykdl/db/disk/yb-master.out &

./bin/yb-master \
  --master_addresses 192.168.10.241:7100,192.168.10.242:7100,192.168.10.243:7100 \
  --rpc_bind_addresses 192.168.10.243:7100 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  --master_replication_factor 3 \
  --tserver_master_replication_factor 3 \
  >& /home/ykdl/db/disk/yb-master.out &

> 2. yb-tserver 配置

./bin/yb-tserver \
  --tserver_master_addrs 192.168.10.241:7100,192.168.10.242:7100,192.168.10.243:7100 \
  --rpc_bind_addresses 192.168.10.240:9100 \
  --pgsql_proxy_bind_address 192.168.10.240:5433 \
  --cql_proxy_bind_address 192.168.10.240:9042 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --start_pgsql_proxy \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  >& /home/ykdl/db/disk/yb-tserver.out &

./bin/yb-tserver \
  --tserver_master_addrs 192.168.10.241:7100,192.168.10.242:7100,192.168.10.243:7100 \
  --rpc_bind_addresses 192.168.10.241:9100 \
  --pgsql_proxy_bind_address 192.168.10.241:5433 \
  --cql_proxy_bind_address 192.168.10.241:9042 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --start_pgsql_proxy \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  >& /home/ykdl/db/disk/yb-tserver.out &

./bin/yb-tserver \
  --tserver_master_addrs 192.168.10.241:7100,192.168.10.242:7100,192.168.10.243:7100 \
  --rpc_bind_addresses 192.168.10.242:9100 \
  --pgsql_proxy_bind_address 192.168.10.242:5433 \
  --cql_proxy_bind_address 192.168.10.242:9042 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --start_pgsql_proxy \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  >& /home/ykdl/db/disk/yb-tserver.out &

./bin/yb-tserver \
  --tserver_master_addrs 192.168.10.241:7100,192.168.10.242:7100,192.168.10.243:7100 \
  --rpc_bind_addresses 192.168.10.243:9100 \
  --pgsql_proxy_bind_address 192.168.10.243:5433 \
  --cql_proxy_bind_address 192.168.10.243:9042 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --start_pgsql_proxy \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  >& /home/ykdl/db/disk/yb-tserver.out &


### 6. 集群配置 (使用 yugabyted 命令)

> 该集群配置测试结果，matser 和 tserver 服务，设置最少复制数据为3，可容忍单机数目 1，超过此数服务异常 

> 192.168.10.240,192.168.10.241,192.168.10.242,192.168.10.243

> mkdir -p /home/ykdl/db/disk && cd /home/ykdl/yugabyte-2.5.3.1/

1. 创建单节点集群

./bin/yugabyted start --ui=true --base_dir=/home/ykdl/db/disk --listen=192.168.10.241

--tserver_flags="pg_yb_session_timeout_ms=1200000,ysql_max_connections=400"

```log
[root@localhost yugabyte-2.5.3.1]# ./bin/yugabyted start --ui=true --base_dir=/home/ykdl/db/disk --listen=192.168.10.241
Starting yugabyted...
WARNING: Failed to meet recommended settings. Ulimits too low - open_files.
Note yugabyted will still run, although it may fail for larger workloads. For more info, see https://docs.yugabyte.com/latest/deploy/manual-deployment/system-config

✅ System checks           
✅ UI schema ready       
| Bringing up UI...
| Bringing up UI...
- Bringing up UI...
- Bringing up UI...
❌ UI status        

+--------------------------------------------------------------------------------------------------+
|                                            yugabyted                                             |
+--------------------------------------------------------------------------------------------------+
| Status              : Running. Leader Master is present                                          |
| Web console         : http://192.168.10.241:7200                                                 |
| JDBC                : jdbc:postgresql://192.168.10.241:5433/yugabyte?user=yugabyte&password=yugabyte |
| YSQL                : bin/ysqlsh -h 192.168.10.241  -U yugabyte -d yugabyte                      |
| YCQL                : bin/ycqlsh 192.168.10.241 9042 -u cassandra                                |
| Data Dir            : /home/ykdl/db/disk/data                                                    |
| Log Dir             : /home/ykdl/db/disk/logs                                                    |
| Universe UUID       : 3846e7d7-2c53-4e58-b46d-efdc645c2b4d                                       |
+--------------------------------------------------------------------------------------------------+
🚀 yugabyted started successfully! To load a sample dataset, try 'yugabyted demo'.
🎉 Join us on Slack at https://www.yugabyte.com/slack
👕 Claim your free t-shirt at https://www.yugabyte.com/community-rewards/
```

2. 多节点集群，加入集群

./bin/yugabyted start --ui=true --base_dir=/home/ykdl/db/disk --listen=192.168.10.240 --join=192.168.10.241

./bin/yugabyted start --ui=true --base_dir=/home/ykdl/db/disk --listen=192.168.10.242 --join=192.168.10.241

```log
[root@localhost yugabyte-2.5.3.1]# ./bin/yugabyted start --ui=true --base_dir=/home/ykdl/db/disk --listen=192.168.10.242 --join=192.168.10.241
Starting yugabyted...
WARNING: Failed to meet recommended settings. Ulimits too low - open_files.
Note yugabyted will still run, although it may fail for larger workloads. For more info, see https://docs.yugabyte.com/latest/deploy/manual-deployment/system-config

✅ System checks           
✅ UI schema ready       
/ Bringing up UI...
/ Bringing up UI...
/ Bringing up UI...
| Bringing up UI...
❌ UI status        

+--------------------------------------------------------------------------------------------------+
|                                            yugabyted                                             |
+--------------------------------------------------------------------------------------------------+
| Status              : Running. Leader Master is present                                          |
| Web console         : http://192.168.10.242:7200                                                 |
| JDBC                : jdbc:postgresql://192.168.10.242:5433/yugabyte?user=yugabyte&password=yugabyte |
| YSQL                : bin/ysqlsh -h 192.168.10.242  -U yugabyte -d yugabyte                      |
| YCQL                : bin/ycqlsh 192.168.10.242 9042 -u cassandra                                |
| Data Dir            : /home/ykdl/db/disk/data                                                    |
| Log Dir             : /home/ykdl/db/disk/logs                                                    |
| Universe UUID       : 3846e7d7-2c53-4e58-b46d-efdc645c2b4d                                       |
+--------------------------------------------------------------------------------------------------+
🚀 yugabyted started successfully! To load a sample dataset, try 'yugabyted demo'.
🎉 Join us on Slack at https://www.yugabyte.com/slack
👕 Claim your free t-shirt at https://www.yugabyte.com/community-rewards/
```

./bin/yugabyted start --ui=true --base_dir=/home/ykdl/db/disk --listen=192.168.10.243 --join=192.168.10.241

```log
[root@localhost yugabyte-2.5.3.1]# ./bin/yugabyted start --ui=true --base_dir=/home/ykdl/db/disk --listen=192.168.10.243 --join=192.168.10.241
Starting yugabyted...
WARNING: Failed to meet recommended settings. Ulimits too low - open_files.
Note yugabyted will still run, although it may fail for larger workloads. For more info, see https://docs.yugabyte.com/latest/deploy/manual-deployment/system-config

✅ System checks           
✅ UI schema ready       
❌ UI status        

+--------------------------------------------------------------------------------------------------+
|                                            yugabyted                                             |
+--------------------------------------------------------------------------------------------------+
| Status              : Running. Leader Master is present                                          |
| Web console         : http://192.168.10.243:7200                                                 |
| JDBC                : jdbc:postgresql://192.168.10.243:5433/yugabyte?user=yugabyte&password=yugabyte |
| YSQL                : bin/ysqlsh -h 192.168.10.243  -U yugabyte -d yugabyte                      |
| YCQL                : bin/ycqlsh 192.168.10.243 9042 -u cassandra                                |
| Data Dir            : /home/ykdl/db/disk/data                                                    |
| Log Dir             : /home/ykdl/db/disk/logs                                                    |
| Universe UUID       : 3846e7d7-2c53-4e58-b46d-efdc645c2b4d                                       |
+--------------------------------------------------------------------------------------------------+
🚀 yugabyted started successfully! To load a sample dataset, try 'yugabyted demo'.
🎉 Join us on Slack at https://www.yugabyte.com/slack
👕 Claim your free t-shirt at https://www.yugabyte.com/community-rewards/
```

> ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------


```log 192.168.10.241:9000 /home/ykdl/db/disk/data/yb-data/master/logs/yb-master.INFO
 Log file created at: 2021/05/31 10:17:21
Running on machine: localhost.yunk
Application fingerprint: version 2.5.3.1 build 10 revision 1d86b4cd1ee9cb675feee7df8fadd8d811ea0e45 build_type RELEASE built at 16 Mar 2021 17:59:44 UTC
Running duration (h:mm:ss): 0:00:00
Log line format: [IWEF]mmdd hh:mm:ss.uuuuuu threadid file:line] msg
I0531 10:17:21.213666 30004 master_main.cc:104] NumCPUs determined to be: 2
I0531 10:17:21.214171 30004 server_base_options.cc:137] Updating master addrs to {192.168.10.241:7100}
I0531 10:17:21.214218 30004 server_base_options.cc:137] Updating master addrs to {192.168.10.241:7100}
I0531 10:17:21.214344 30004 mem_tracker.cc:249] MemTracker: hard memory limit is 2.673885 GB
I0531 10:17:21.214355 30004 mem_tracker.cc:251] MemTracker: soft memory limit is 2.272802 GB
I0531 10:17:21.214507 30004 server_base_options.cc:137] Updating master addrs to {192.168.10.241:7100}
I0531 10:17:21.216440 30004 server_base_options.cc:137] Updating master addrs to {192.168.10.241:7100}
I0531 10:17:21.216651 30004 rpc_server.cc:86] yb::server::RpcServer created at 0x2d7e0b0
I0531 10:17:21.216673 30004 master.cc:149] yb::master::Master created at 0x7ffc22f216b0
I0531 10:17:21.216686 30004 master.cc:150] yb::master::TSManager created at 0x2d90930
I0531 10:17:21.216691 30004 master.cc:151] yb::master::CatalogManager created at 0x2f86000
I0531 10:17:21.216759 30004 master_main.cc:125] Initializing master server...
I0531 10:17:21.218673 30004 server_base.cc:468] Could not load existing FS layout: Not found (yb/util/env_posix.cc:1514): /home/ykdl/db/disk/data/yb-data/master/instance: No such file or directory (system error 2)
I0531 10:17:21.218686 30004 server_base.cc:469] Creating new FS layout
I0531 10:17:21.220597 30004 fs_manager.cc:463] Generated new instance metadata in path /home/ykdl/db/disk/data/yb-data/master/instance:
uuid: "4def1fb8aab846efafe961628c995dda"
format_stamp: "Formatted at 2021-05-31 10:17:21 on localhost.yunk"
I0531 10:17:21.221138 30004 fs_manager.cc:251] Opened local filesystem: /home/ykdl/db/disk/data
uuid: "4def1fb8aab846efafe961628c995dda"
format_stamp: "Formatted at 2021-05-31 10:17:21 on localhost.yunk"
I0531 10:17:21.221408 30004 server_base.cc:251] Auto setting FLAGS_num_reactor_threads to 2
I0531 10:17:21.222084 30004 thread_pool.cc:171] Starting thread pool { name: Master queue_limit: 10000 max_workers: 1024 }
I0531 10:17:21.223089 30004 master_main.cc:128] Starting Master server...
I0531 10:17:21.223110 30024 async_initializer.cc:82] Starting to init ybclient
I0531 10:17:21.223129 30004 ulimit_util.cc:214] Configured soft limit for cpu time is already larger than specified min value (unlimited vs. unlimited). Skipping.
I0531 10:17:21.223165 30004 ulimit_util.cc:214] Configured soft limit for file size is already larger than specified min value (unlimited vs. unlimited). Skipping.
I0531 10:17:21.223170 30004 ulimit_util.cc:214] Configured soft limit for data seg size is already larger than specified min value (unlimited vs. unlimited). Skipping.
I0531 10:17:21.223176 30004 ulimit_util.cc:214] Configured soft limit for stack size is already larger than specified min value (8388608 vs. 8388608). Skipping.
I0531 10:17:21.223181 30004 ulimit_util.cc:214] Configured soft limit for max user processes is already larger than specified min value (31167 vs. 12000). Skipping.
I0531 10:17:21.223191 30004 env_posix.cc:1445] Modifying limit for open files from 1024 to 4096
I0531 10:17:21.223204 30004 ulimit_util.cc:214] Configured soft limit for max locked memory is already larger than specified min value (65536 vs. 65536). Skipping.
I0531 10:17:21.223209 30004 ulimit_util.cc:214] Configured soft limit for max memory size is already larger than specified min value (unlimited vs. unlimited). Skipping.
I0531 10:17:21.223230 30004 master_main.cc:130] ulimit cur(max)...
ulimit: core file size 0(unlimited) blks
ulimit: data seg size unlimited(unlimited) kb
ulimit: open files 4096(4096)
ulimit: file size unlimited(unlimited) blks
ulimit: pending signals 31167(31167)
ulimit: file locks unlimited(unlimited)
ulimit: max locked memory 64(64) kb
ulimit: max memory size unlimited(unlimited) kb
ulimit: stack size 8192(unlimited) kb
ulimit: cpu time unlimited(unlimited) secs
ulimit: max user processes 31167(31167)
W0531 10:17:21.223244 30024 master.cc:194] Failed to get current config: Service unavailable (yb/master/catalog_manager.cc:1552): CatalogManager is not running
I0531 10:17:21.223402 30024 client-internal.cc:2252] New master addresses: [192.168.10.241:7100]
I0531 10:17:21.223677 30004 service_pool.cc:148] yb.master.MasterBackupService: yb::rpc::ServicePoolImpl created at 0x2d82b40
I0531 10:17:21.224552 30004 service_pool.cc:148] yb.master.MasterService: yb::rpc::ServicePoolImpl created at 0x2d83440
I0531 10:17:21.224802 30004 service_pool.cc:148] yb.tserver.TabletServerService: yb::rpc::ServicePoolImpl created at 0x2d83680
I0531 10:17:21.224972 30004 thread_pool.cc:171] Starting thread pool { name: Master-high-pri queue_limit: 10000 max_workers: 1024 }
I0531 10:17:21.224987 30004 service_pool.cc:148] yb.consensus.ConsensusService: yb::rpc::ServicePoolImpl created at 0x2d83b00
I0531 10:17:21.225312 30004 service_pool.cc:148] yb.tserver.RemoteBootstrapService: yb::rpc::ServicePoolImpl created at 0x2d83d40
I0531 10:17:21.225455 30004 webserver.cc:158] Starting webserver on 192.168.10.241:7000
I0531 10:17:21.225467 30004 webserver.cc:163] Document root: /home/ykdl/yugabyte-2.5.3.1/www
I0531 10:17:21.225602 30004 webserver.cc:153] Webserver listen spec is 192.168.10.241:7000
I0531 10:17:21.225924 30004 webserver.cc:252] Webserver started. Bound to: http://192.168.10.241:7000/
I0531 10:17:21.226037 30004 service_pool.cc:148] yb.server.GenericService: yb::rpc::ServicePoolImpl created at 0x341a000
I0531 10:17:21.226145 30004 rpc_server.cc:169] RPC server started. Bound to: 192.168.10.241:7100
I0531 10:17:21.227604 30004 server_base.cc:330] Dumped server information to /home/ykdl/db/disk/data/master-info
I0531 10:17:21.227663 30004 server_base.cc:517] Using private rpc address 192.168.10.241
I0531 10:17:21.227679 30004 server_base.cc:539] Using http address 192.168.10.241
I0531 10:17:21.227830 30029 sys_catalog.cc:222] Trying to load previous SysCatalogTable data from disk
I0531 10:17:21.227946 30029 catalog_manager.cc:1407] Did not find previous SysCatalogTable data on disk. Not found (yb/util/env_posix.cc:1514): Could not load Raft group metadata from /home/ykdl/db/disk/data/yb-data/master/tablet-meta/00000000000000000000000000000000: /home/ykdl/db/disk/data/yb-data/master/tablet-meta/00000000000000000000000000000000: No such file or directory (system error 2)
I0531 10:17:21.227983 30029 sys_catalog.cc:288] Creating new SysCatalogTable data
I0531 10:17:21.229380 30029 sys_catalog.cc:339] Determining permanent_uuid for [192.168.10.241:7100]
I0531 10:17:21.231057 30030 server_base.cc:517] Using private rpc address 192.168.10.241
I0531 10:17:21.231580 30029 sys_catalog.cc:354] Setting up raft configuration: opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } }
I0531 10:17:21.231711 30029 consensus_meta.cc:282] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Updating active role from UNKNOWN_ROLE to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:21.232409 30029 server_base.cc:517] Using private rpc address 192.168.10.241
I0531 10:17:21.232529 30029 tablet_peer.cc:1212] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [state=BOOTSTRAPPING]: Changed state from NOT_STARTED to BOOTSTRAPPING
I0531 10:17:21.232834 30029 consensus_meta.cc:282] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Updating active role from UNKNOWN_ROLE to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:21.232872 30029 tablet_bootstrap_if.cc:79] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Bootstrap starting.
I0531 10:17:21.232998 30029 tablet.cc:451] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Schema version for sys.catalog is 0
I0531 10:17:21.233208 30029 transaction_participant.cc:133] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Create
I0531 10:17:21.233323 30029 docdb_rocksdb_util.cc:277] Auto setting FLAGS_rocksdb_max_background_flushes to 1
I0531 10:17:21.233343 30029 docdb_rocksdb_util.cc:300] Auto setting FLAGS_rocksdb_max_background_compactions to 1
I0531 10:17:21.233347 30029 docdb_rocksdb_util.cc:311] Auto setting FLAGS_rocksdb_base_background_compactions to 1
I0531 10:17:21.233351 30029 docdb_rocksdb_util.cc:334] Auto setting FLAGS_priority_thread_pool_size to 1
I0531 10:17:21.233533 30029 tablet.cc:577] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Creating RocksDB database in dir /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000
I0531 10:17:21.234156 30029 tablet.cc:735] Opening RocksDB at: /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000
I0531 10:17:21.234534 30029 db_impl.cc:770] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: Creating manifest 1 
I0531 10:17:21.235810 30029 version_set.cc:2839] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: Recovered from manifest file:/home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000/MANIFEST-000001 succeeded,manifest_file_number is 1, next_file_number is 3, last_sequence is 1125899906842624, log_number is 0,prev_log_number is 0,max_column_family is 0, flushed_values is 
I0531 10:17:21.235822 30029 version_set.cc:2847] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: Column family [default] (ID 0), log number is 0
I0531 10:17:21.236925 30029 tablet.cc:750] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Opening intents DB at: /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000.intents
I0531 10:17:21.237112 30029 db_impl.cc:770] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: Creating manifest 1 
I0531 10:17:21.237939 30029 version_set.cc:2839] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: Recovered from manifest file:/home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000.intents/MANIFEST-000001 succeeded,manifest_file_number is 1, next_file_number is 3, last_sequence is 1125899906842624, log_number is 0,prev_log_number is 0,max_column_family is 0, flushed_values is 
I0531 10:17:21.237951 30029 version_set.cc:2847] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: Column family [default] (ID 0), log number is 0
I0531 10:17:21.238626 30029 tablet.cc:793] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Successfully opened a RocksDB database at /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000, obj: 0x2e28800
I0531 10:17:21.238658 30029 tablet_bootstrap.cc:608] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Time spent opening tablet: real 0.005s	user 0.001s	sys 0.003s
I0531 10:17:21.238656 30032 transaction_loader.cc:89] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load transactions start
I0531 10:17:21.238740 30032 transaction_loader.cc:132] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: LoadTransactions done: loaded 0 transactions
I0531 10:17:21.238770 30029 tablet_bootstrap.cc:533] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: No blocks or log segments found. Creating new log.
I0531 10:17:21.238876 30029 log.cc:1040] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Setting log wal retention time to 0 seconds
I0531 10:17:21.239013 30029 log.cc:565] durable_wal_write is turned on.
I0531 10:17:21.239559 30029 tablet_bootstrap_if.cc:79] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: No bootstrap required, opened a new log
I0531 10:17:21.239591 30029 log.cc:1040] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Setting log wal retention time to 0 seconds
I0531 10:17:21.240022 30029 consensus_meta.cc:282] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Updating active role from UNKNOWN_ROLE to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:21.240870 30029 transaction_participant.cc:188] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Start
I0531 10:17:21.240897 30029 tablet_peer.cc:922] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [state=BOOTSTRAPPING]: Setting cdc min replicated index to 9223372036854775807
I0531 10:17:21.240909 30032 transaction_participant.cc:965] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: LoadFinished: starting transaction status resolution
I0531 10:17:21.241665 30029 consensus_meta.cc:282] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Updating active role from FOLLOWER to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:21.241699 30029 raft_consensus.cc:425] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 0 FOLLOWER]: Replica starting. Triggering 0 pending operations. Active config: opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } }
I0531 10:17:21.241757 30029 raft_consensus.cc:455] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 0 FOLLOWER]: Consensus starting up: Expiring fail detector timer to make a prompt election more likely
I0531 10:17:21.241827 30029 raft_consensus.cc:1045] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 0 FOLLOWER]: Becoming Follower/Learner. State: Replica: 4def1fb8aab846efafe961628c995dda, State: 1, Role: FOLLOWER, Watermarks: {Received: 0.0 Committed: 0.0} Leader: 0.0, new leader: , initial_fd_wait: 
I0531 10:17:21.241853 30029 consensus_meta.cc:282] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Updating active role from FOLLOWER to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:21.241932 30029 consensus_queue.cc:274] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [NON_LEADER]: Queue going to NON_LEADER mode. State: All replicated op: 0.0, Majority replicated op: 0.0, Committed index: 0.0, Last applied: 0.0, Last appended: 0.0, Current term: 0, Majority size: -1, State: QUEUE_OPEN, Mode: NON_LEADER
I0531 10:17:21.241961 30029 raft_consensus.cc:3076] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 0 FOLLOWER]: Calling mark dirty synchronously for reason code CONSENSUS_STARTED
I0531 10:17:21.241999 30029 sys_catalog.cc:380] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [sys.catalog]: SysCatalogTable state changed. Locked=0. Reason: RaftConsensus started. Latest consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }
I0531 10:17:21.242018 30029 sys_catalog.cc:384] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [sys.catalog]: This master's current role is: FOLLOWER
I0531 10:17:21.242031 30029 tablet_peer.cc:1212] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [state=RUNNING]: Changed state from BOOTSTRAPPING to RUNNING
I0531 10:17:21.242048 30029 sys_catalog.cc:380] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [sys.catalog]: SysCatalogTable state changed. Locked=0. Reason: Started TabletPeer. Latest consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }
I0531 10:17:21.242053 30029 sys_catalog.cc:384] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [sys.catalog]: This master's current role is: FOLLOWER
I0531 10:17:21.242461 30029 db_impl.cc:2469] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: SetOptions() on column family [default], inputs:
I0531 10:17:21.242471 30029 db_impl.cc:2472] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: level0_stop_writes_trigger: 2147483647
I0531 10:17:21.242476 30029 db_impl.cc:2472] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: level0_slowdown_writes_trigger: 2147483647
I0531 10:17:21.242480 30029 db_impl.cc:2477] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: [default] SetOptions succeeded
I0531 10:17:21.242488 30029 mutable_cf_options.cc:83] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                         write_buffer_size: 134217728
I0531 10:17:21.242493 30029 mutable_cf_options.cc:85] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                   max_write_buffer_number: 2
I0531 10:17:21.242497 30029 mutable_cf_options.cc:87] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                          arena_block_size: 131072
I0531 10:17:21.242501 30029 mutable_cf_options.cc:89] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                memtable_prefix_bloom_bits: 0
I0531 10:17:21.242504 30029 mutable_cf_options.cc:91] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:              memtable_prefix_bloom_probes: 6
I0531 10:17:21.242512 30029 mutable_cf_options.cc:93] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:  memtable_prefix_bloom_huge_page_tlb_size: 0
I0531 10:17:21.242516 30029 mutable_cf_options.cc:95] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                     max_successive_merges: 0
I0531 10:17:21.242520 30029 mutable_cf_options.cc:97] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                            filter_deletes: 0
I0531 10:17:21.242523 30029 mutable_cf_options.cc:99] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                  disable_auto_compactions: 1
I0531 10:17:21.242527 30029 mutable_cf_options.cc:101] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:       soft_pending_compaction_bytes_limit: 0
I0531 10:17:21.242530 30029 mutable_cf_options.cc:103] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:       hard_pending_compaction_bytes_limit: 0
I0531 10:17:21.242534 30029 mutable_cf_options.cc:105] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:        level0_file_num_compaction_trigger: 5
I0531 10:17:21.242538 30029 mutable_cf_options.cc:107] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            level0_slowdown_writes_trigger: 2147483647
I0531 10:17:21.242542 30029 mutable_cf_options.cc:109] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                level0_stop_writes_trigger: 2147483647
I0531 10:17:21.242545 30029 mutable_cf_options.cc:111] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            max_grandparent_overlap_factor: 10
I0531 10:17:21.242548 30029 mutable_cf_options.cc:113] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                expanded_compaction_factor: 25
I0531 10:17:21.242552 30029 mutable_cf_options.cc:115] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                  source_compaction_factor: 1
I0531 10:17:21.242555 30029 mutable_cf_options.cc:117] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                     target_file_size_base: 2097152
I0531 10:17:21.242559 30029 mutable_cf_options.cc:119] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:               target_file_size_multiplier: 1
I0531 10:17:21.242563 30029 mutable_cf_options.cc:121] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                  max_bytes_for_level_base: 10485760
I0531 10:17:21.242566 30029 mutable_cf_options.cc:123] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            max_bytes_for_level_multiplier: 10
I0531 10:17:21.242571 30029 mutable_cf_options.cc:131] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: max_bytes_for_level_multiplier_additional: 1, 1, 1, 1, 1, 1, 1
I0531 10:17:21.242575 30029 mutable_cf_options.cc:133] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            verify_checksums_in_compaction: 1
I0531 10:17:21.242578 30029 mutable_cf_options.cc:135] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:         max_sequential_skip_in_iterations: 8
I0531 10:17:21.242955 30029 db_impl.cc:2469] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: SetOptions() on column family [default], inputs:
I0531 10:17:21.242965 30029 db_impl.cc:2472] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: disable_auto_compactions: false
I0531 10:17:21.242970 30029 db_impl.cc:2477] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: [default] SetOptions succeeded
I0531 10:17:21.242974 30029 mutable_cf_options.cc:83] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                         write_buffer_size: 134217728
I0531 10:17:21.242985 30029 mutable_cf_options.cc:85] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                   max_write_buffer_number: 2
I0531 10:17:21.242990 30029 mutable_cf_options.cc:87] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                          arena_block_size: 131072
I0531 10:17:21.242993 30029 mutable_cf_options.cc:89] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                memtable_prefix_bloom_bits: 0
I0531 10:17:21.242996 30029 mutable_cf_options.cc:91] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:              memtable_prefix_bloom_probes: 6
I0531 10:17:21.243000 30029 mutable_cf_options.cc:93] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:  memtable_prefix_bloom_huge_page_tlb_size: 0
I0531 10:17:21.243003 30029 mutable_cf_options.cc:95] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                     max_successive_merges: 0
I0531 10:17:21.243007 30029 mutable_cf_options.cc:97] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                            filter_deletes: 0
I0531 10:17:21.243010 30029 mutable_cf_options.cc:99] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                  disable_auto_compactions: 0
I0531 10:17:21.243014 30029 mutable_cf_options.cc:101] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:       soft_pending_compaction_bytes_limit: 0
I0531 10:17:21.243017 30029 mutable_cf_options.cc:103] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:       hard_pending_compaction_bytes_limit: 0
I0531 10:17:21.243021 30029 mutable_cf_options.cc:105] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:        level0_file_num_compaction_trigger: 5
I0531 10:17:21.243024 30029 mutable_cf_options.cc:107] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            level0_slowdown_writes_trigger: 2147483647
I0531 10:17:21.243028 30029 mutable_cf_options.cc:109] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                level0_stop_writes_trigger: 2147483647
I0531 10:17:21.243032 30029 mutable_cf_options.cc:111] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            max_grandparent_overlap_factor: 10
I0531 10:17:21.243036 30029 mutable_cf_options.cc:113] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                expanded_compaction_factor: 25
I0531 10:17:21.243039 30029 mutable_cf_options.cc:115] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                  source_compaction_factor: 1
I0531 10:17:21.243042 30029 mutable_cf_options.cc:117] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                     target_file_size_base: 2097152
I0531 10:17:21.243046 30029 mutable_cf_options.cc:119] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:               target_file_size_multiplier: 1
I0531 10:17:21.243049 30029 mutable_cf_options.cc:121] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                  max_bytes_for_level_base: 10485760
I0531 10:17:21.243053 30029 mutable_cf_options.cc:123] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            max_bytes_for_level_multiplier: 10
I0531 10:17:21.243058 30029 mutable_cf_options.cc:131] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: max_bytes_for_level_multiplier_additional: 1, 1, 1, 1, 1, 1, 1
I0531 10:17:21.243062 30029 mutable_cf_options.cc:133] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            verify_checksums_in_compaction: 1
I0531 10:17:21.243065 30029 mutable_cf_options.cc:135] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:         max_sequential_skip_in_iterations: 8
I0531 10:17:21.243402 30029 db_impl.cc:2469] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: SetOptions() on column family [default], inputs:
I0531 10:17:21.243412 30029 db_impl.cc:2472] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: level0_stop_writes_trigger: 2147483647
I0531 10:17:21.243415 30029 db_impl.cc:2472] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: level0_slowdown_writes_trigger: 2147483647
I0531 10:17:21.243418 30029 db_impl.cc:2477] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: [default] SetOptions succeeded
I0531 10:17:21.243422 30029 mutable_cf_options.cc:83] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                         write_buffer_size: 134217728
I0531 10:17:21.243427 30029 mutable_cf_options.cc:85] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                   max_write_buffer_number: 2
I0531 10:17:21.243429 30029 mutable_cf_options.cc:87] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                          arena_block_size: 131072
I0531 10:17:21.243433 30029 mutable_cf_options.cc:89] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                memtable_prefix_bloom_bits: 0
I0531 10:17:21.243436 30029 mutable_cf_options.cc:91] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:              memtable_prefix_bloom_probes: 6
I0531 10:17:21.243439 30029 mutable_cf_options.cc:93] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:  memtable_prefix_bloom_huge_page_tlb_size: 0
I0531 10:17:21.243443 30029 mutable_cf_options.cc:95] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                     max_successive_merges: 0
I0531 10:17:21.243446 30029 mutable_cf_options.cc:97] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                            filter_deletes: 0
I0531 10:17:21.243449 30029 mutable_cf_options.cc:99] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                  disable_auto_compactions: 1
I0531 10:17:21.243453 30029 mutable_cf_options.cc:101] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:       soft_pending_compaction_bytes_limit: 0
I0531 10:17:21.243456 30029 mutable_cf_options.cc:103] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:       hard_pending_compaction_bytes_limit: 0
I0531 10:17:21.243459 30029 mutable_cf_options.cc:105] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:        level0_file_num_compaction_trigger: 5
I0531 10:17:21.243463 30029 mutable_cf_options.cc:107] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            level0_slowdown_writes_trigger: 2147483647
I0531 10:17:21.243466 30029 mutable_cf_options.cc:109] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                level0_stop_writes_trigger: 2147483647
I0531 10:17:21.243469 30029 mutable_cf_options.cc:111] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            max_grandparent_overlap_factor: 10
I0531 10:17:21.243474 30029 mutable_cf_options.cc:113] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                expanded_compaction_factor: 25
I0531 10:17:21.243476 30029 mutable_cf_options.cc:115] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                  source_compaction_factor: 1
I0531 10:17:21.243479 30029 mutable_cf_options.cc:117] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                     target_file_size_base: 2097152
I0531 10:17:21.243482 30029 mutable_cf_options.cc:119] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:               target_file_size_multiplier: 1
I0531 10:17:21.243486 30029 mutable_cf_options.cc:121] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                  max_bytes_for_level_base: 10485760
I0531 10:17:21.243496 30029 mutable_cf_options.cc:123] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            max_bytes_for_level_multiplier: 10
I0531 10:17:21.243502 30029 mutable_cf_options.cc:131] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: max_bytes_for_level_multiplier_additional: 1, 1, 1, 1, 1, 1, 1
I0531 10:17:21.243505 30029 mutable_cf_options.cc:133] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            verify_checksums_in_compaction: 1
I0531 10:17:21.243508 30029 mutable_cf_options.cc:135] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:         max_sequential_skip_in_iterations: 8
I0531 10:17:21.243834 30029 db_impl.cc:2469] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: SetOptions() on column family [default], inputs:
I0531 10:17:21.243844 30029 db_impl.cc:2472] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: disable_auto_compactions: false
I0531 10:17:21.243846 30029 db_impl.cc:2477] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: [default] SetOptions succeeded
I0531 10:17:21.243851 30029 mutable_cf_options.cc:83] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                         write_buffer_size: 134217728
I0531 10:17:21.243854 30029 mutable_cf_options.cc:85] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                   max_write_buffer_number: 2
I0531 10:17:21.243858 30029 mutable_cf_options.cc:87] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                          arena_block_size: 131072
I0531 10:17:21.243877 30029 mutable_cf_options.cc:89] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                memtable_prefix_bloom_bits: 0
I0531 10:17:21.243881 30029 mutable_cf_options.cc:91] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:              memtable_prefix_bloom_probes: 6
I0531 10:17:21.243885 30029 mutable_cf_options.cc:93] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:  memtable_prefix_bloom_huge_page_tlb_size: 0
I0531 10:17:21.243888 30029 mutable_cf_options.cc:95] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                     max_successive_merges: 0
I0531 10:17:21.243891 30029 mutable_cf_options.cc:97] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                            filter_deletes: 0
I0531 10:17:21.243894 30029 mutable_cf_options.cc:99] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                  disable_auto_compactions: 0
I0531 10:17:21.243898 30029 mutable_cf_options.cc:101] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:       soft_pending_compaction_bytes_limit: 0
I0531 10:17:21.243901 30029 mutable_cf_options.cc:103] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:       hard_pending_compaction_bytes_limit: 0
I0531 10:17:21.243904 30029 mutable_cf_options.cc:105] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:        level0_file_num_compaction_trigger: 5
I0531 10:17:21.243908 30029 mutable_cf_options.cc:107] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            level0_slowdown_writes_trigger: 2147483647
I0531 10:17:21.243911 30029 mutable_cf_options.cc:109] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                level0_stop_writes_trigger: 2147483647
I0531 10:17:21.243916 30029 mutable_cf_options.cc:111] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            max_grandparent_overlap_factor: 10
I0531 10:17:21.243918 30029 mutable_cf_options.cc:113] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                expanded_compaction_factor: 25
I0531 10:17:21.243927 30029 mutable_cf_options.cc:115] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                  source_compaction_factor: 1
I0531 10:17:21.243929 30029 mutable_cf_options.cc:117] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                     target_file_size_base: 2097152
I0531 10:17:21.243933 30029 mutable_cf_options.cc:119] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:               target_file_size_multiplier: 1
I0531 10:17:21.243937 30029 mutable_cf_options.cc:121] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                  max_bytes_for_level_base: 10485760
I0531 10:17:21.243939 30029 mutable_cf_options.cc:123] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            max_bytes_for_level_multiplier: 10
I0531 10:17:21.243944 30029 mutable_cf_options.cc:131] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: max_bytes_for_level_multiplier_additional: 1, 1, 1, 1, 1, 1, 1
I0531 10:17:21.243948 30029 mutable_cf_options.cc:133] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            verify_checksums_in_compaction: 1
I0531 10:17:21.243952 30029 mutable_cf_options.cc:135] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:         max_sequential_skip_in_iterations: 8
I0531 10:17:21.243997 30029 tablet_peer.cc:1109] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [state=RUNNING]: Registered log gc
I0531 10:17:21.244029 30029 sys_catalog.cc:598] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [sys.catalog]: configured and running, proceeding with master startup.
W0531 10:17:21.244215 30033 catalog_manager_bg_tasks.cc:107] Catalog manager background task thread going to sleep: Service unavailable (yb/master/scoped_leader_shared_lock.cc:62): Catalog manager is not initialized. State: 1
I0531 10:17:21.244398 30004 master_main.cc:133] Master server successfully started.
I0531 10:17:21.245101 30004 total_mem_watcher.cc:73] Root memtracker limit: 2871062118 (2738 MiB); this server will stop if memory usage exceeds 200% of that: 5742124236 bytes (5476 MiB).
W0531 10:17:21.354063 30024 client-internal.cc:1140] Failed to get hostname: Network error (yb/util/net/net_util.cc:426): Unable to lookup FQDN (localhost.yunk), getaddrinfo returned -2 (EAI_NONAME): Success (system error 0)
I0531 10:17:21.354969 30024 async_initializer.cc:86] Successfully built ybclient
I0531 10:17:24.320102 30049 raft_consensus.cc:969] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 0 FOLLOWER]: ReportFailDetected: Starting NORMAL_ELECTION...
I0531 10:17:24.320155 30049 raft_consensus.cc:573] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 0 FOLLOWER]: Triggering leader pre-election, mode=NORMAL_ELECTION
I0531 10:17:24.320209 30049 raft_consensus.cc:3140] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 0 FOLLOWER]: Snoozing failure detection for 3.228s
I0531 10:17:24.320233 30049 raft_consensus.cc:612] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 0 FOLLOWER]: Starting pre-election with config: opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } }
I0531 10:17:24.320327 30049 leader_election.cc:241] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [CANDIDATE]: Term 1 pre-election: Election decided. Result: candidate won.
I0531 10:17:24.320484 30049 raft_consensus.cc:3140] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 0 FOLLOWER]: Snoozing failure detection for 3.133s
I0531 10:17:24.320499 30049 raft_consensus.cc:3013] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 0 FOLLOWER]: Leader pre-election won for term 1
I0531 10:17:24.320525 30049 raft_consensus.cc:573] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 0 FOLLOWER]: Triggering leader election, mode=NORMAL_ELECTION
I0531 10:17:24.320533 30049 raft_consensus.cc:3140] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 0 FOLLOWER]: Snoozing failure detection for 3.195s
I0531 10:17:24.320541 30049 raft_consensus.cc:3201] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 0 FOLLOWER]: Advancing to term 1
I0531 10:17:24.321506 30049 consensus_meta.cc:282] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Updating active role from FOLLOWER to FOLLOWER. Consensus state: current_term: 1 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:24.321532 30049 raft_consensus.cc:612] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 1 FOLLOWER]: Starting election with config: opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } }
I0531 10:17:24.322144 30049 leader_election.cc:241] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [CANDIDATE]: Term 1 election: Election decided. Result: candidate won.
I0531 10:17:24.322172 30049 raft_consensus.cc:3140] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 1 FOLLOWER]: Snoozing failure detection for 3.035s
I0531 10:17:24.322181 30049 raft_consensus.cc:3027] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 1 FOLLOWER]: Leader election won for term 1
I0531 10:17:24.322188 30049 replica_state.cc:1170] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 1 FOLLOWER]: Reset our lease: 2711405.313s
I0531 10:17:24.322202 30049 replica_state.cc:1406] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 1 FOLLOWER]: SetLeaderNoOpCommittedUnlocked(0), committed: { term: 0 index: 0 }, received: { term: 0 index: 0 }
I0531 10:17:24.322232 30049 consensus_meta.cc:282] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Updating active role from FOLLOWER to LEADER. Consensus state: current_term: 1 leader_uuid: "4def1fb8aab846efafe961628c995dda" config { opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:24.322240 30049 raft_consensus.cc:3076] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 1 LEADER]: Calling mark dirty synchronously for reason code NEW_LEADER_ELECTED
I0531 10:17:24.322257 30049 sys_catalog.cc:380] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [sys.catalog]: SysCatalogTable state changed. Locked=1. Reason: New leader 4def1fb8aab846efafe961628c995dda elected. Latest consensus state: current_term: 1 leader_uuid: "4def1fb8aab846efafe961628c995dda" config { opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }
I0531 10:17:24.322270 30049 sys_catalog.cc:384] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [sys.catalog]: This master's current role is: LEADER
I0531 10:17:24.322424 30049 raft_consensus.cc:997] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 1 LEADER]: Becoming Leader. State: Replica: 4def1fb8aab846efafe961628c995dda, State: 1, Role: LEADER, Watermarks: {Received: 0.0 Committed: 0.0} Leader: 0.0
I0531 10:17:24.322480 30049 consensus_queue.cc:256] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [LEADER]: Queue going to LEADER mode. State: All replicated op: 0.0, Majority replicated op: 0.0, Committed index: 0.0, Last applied: 0.0, Last appended: 0.0, Current term: 1, Majority size: 1, State: QUEUE_OPEN, Mode: LEADER, active raft config: opid_index: -1 peers { permanent_uuid: "4def1fb8aab846efafe961628c995dda" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 7100 } last_known_broadcast_addr { host: "192.168.10.241" port: 7100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } }
I0531 10:17:24.322504 30049 raft_consensus.cc:1015] Sending NO_OP at op { term: 0 index: 0 }
I0531 10:17:24.322625 30031 master_service.cc:678] Patching role from leader to follower because of: Leader not ready to serve requests. (yb/consensus/consensus.cc:156): Leader not yet replicated NoOp to be ready to serve requests
I0531 10:17:24.324213 30051 catalog_manager.cc:749] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Loading table and tablet metadata into memory for term 1
I0531 10:17:24.324249 30051 catalog_manager.cc:787] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: VisitSysCatalog: Wait on leader_lock_ for any existing operations to finish.
I0531 10:17:24.324281 30051 catalog_manager.cc:798] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: VisitSysCatalog: Acquire catalog manager lock_ before loading sys catalog.
I0531 10:17:24.324327 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading tables into memory.
I0531 10:17:24.324725 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading tablets into memory.
I0531 10:17:24.324771 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading namespaces into memory.
I0531 10:17:24.324803 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading user-defined types into memory.
I0531 10:17:24.324833 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading cluster configuration into memory.
I0531 10:17:24.324882 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading roles into memory.
I0531 10:17:24.324918 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading Redis config into memory.
I0531 10:17:24.324946 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading sys config into memory.
I0531 10:17:24.324980 30051 catalog_manager_ent.cc:266] RunLoaders: Loading snapshots into memory.
I0531 10:17:24.325011 30051 catalog_manager_ent.cc:272] RunLoaders: Loading CDC streams into memory.
I0531 10:17:24.325035 30051 catalog_manager_ent.cc:278] RunLoaders: Loading universe replication info into memory.
I0531 10:17:24.327114 30050 replica_state.cc:1406] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 1 LEADER]: SetLeaderNoOpCommittedUnlocked(1), committed: { term: 0 index: 0 }, received: { term: 1 index: 2 }
I0531 10:17:24.327162 30050 replica_state.cc:795] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [term 1 LEADER]: Advanced the committed_op_id across terms. Last committed operation was: { term: 0 index: 0 } New committed index is: { term: 1 index: 1 }
I0531 10:17:24.328490 30051 catalog_manager.cc:836] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Restoring snapshot in sys catalog
I0531 10:17:24.331204 30050 db_impl.cc:649] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: Shutting down RocksDB at: /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000.intents
I0531 10:17:24.331388 30050 db_impl.cc:759] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: Shutdown done
W0531 10:17:24.331621 30050 env.cc:93] Failed to get children /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000.intents/archive: IO error (yb/rocksdb/util/env_posix.cc:234): /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000.intents/archive: No such file or directory
I0531 10:17:24.331703 30050 db_impl.cc:649] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: Shutting down RocksDB at: /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000
I0531 10:17:24.331712 30050 db_impl.cc:662] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: Skipping mem table flush - disable_flush_on_shutdown_ is set
I0531 10:17:24.331782 30050 db_impl.cc:759] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: Shutdown done
W0531 10:17:24.331961 30050 env.cc:93] Failed to get children /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000/archive: IO error (yb/rocksdb/util/env_posix.cc:234): /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000/archive: No such file or directory
I0531 10:17:24.332610 30050 version_set.cc:2839] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Recovered from manifest file:/home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000/MANIFEST-000011 succeeded,manifest_file_number is 11, next_file_number is 13, last_sequence is 1125899908363543, log_number is 0,prev_log_number is 0,max_column_family is 0, flushed_values is 0x0000000003492600 -> { op_id: 1.21348 hybrid_time: { physical: 1615917694181885 } history_cutoff:  hybrid_time_filter:  }
I0531 10:17:24.332624 30050 version_set.cc:2847] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Column family [default] (ID 0), log number is 3
I0531 10:17:24.332681 30050 version_set.cc:2280] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Creating manifest 13
I0531 10:17:24.332916 30050 version_set.cc:3346] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Writing version edit: comparator: "leveldb.BytewiseComparator"

I0531 10:17:24.333173 30050 version_set.cc:3346] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Writing version edit: log_number: 3
new_files {
  level: 0
  number: 10
  total_file_size: 24318438
  base_file_size: 176568
  smallest {
    key: "H\200\000\000\001S000000010000300080000000000000af\000\000!J\200#\200\001\226\222\323Y[O\200J\001\272]\002\000\000\000\004"
    seqno: 1125899906842625
    user_values {
      tag: 1
      data: "\200\001\226\222\325)\033e\200J"
    }
    user_values {
      tag: 10
      data: "H\200\000\000\001"
    }
    user_values {
      tag: 11
      data: "$"
    }
    user_values {
      tag: 12
      data: "$"
    }
    user_values {
      tag: 13
      data: "$"
    }
    user_values {
      tag: 14
      data: "$"
    }
    user_frontier {
      [type.googleapis.com/yb.docdb.ConsensusFrontierPB] {
        op_id {
          term: 1
          index: 2
        }
        hybrid_time: 6618798453055660032
        history_cutoff: 18446744073709551614
      }
    }
  }
  largest {
    key: "y\016\340@\000\000\000\000\200\0000\000\000\001\000\000\000O\000\0000\260!K\215#\200\001\226\222\317\003\376\263\200>+\001\0235\027\000\000\000\004"
    seqno: 1125899908363543
    user_values {
      tag: 1
      data: "\200\001\226\222\317\003\336\002\200?\253"
    }
    user_values {
      tag: 10
      data: "S\377\374\014\013\211\344N\232\202\037eG\217/\366\217\000\000"
    }
    user_values {
      tag: 11
      data: "Sysql-catalog-configuration\000\000"
    }
    user_values {
      tag: 12
      data: "Syes_or_no_check\000\000"
    }
    user_values {
      tag: 13
      data: "SS\377\374\014\013\211\344N\232\202\037eG\217/\366\217\000\001\000\001!\000\000"
    }
    user_values {
      tag: 14
      data: "SS\310\343\036&\347hD\210\221\031v\243O\350n\342\000\001\000\001!\000\000"
    }
    user_frontier {
      [type.googleapis.com/yb.docdb.ConsensusFrontierPB] {
        op_id {
          term: 1
          index: 21348
        }
        hybrid_time: 6618798875369000960
        history_cutoff: 18446744073709551614
      }
    }
  }
}
flushed_frontier {
  [type.googleapis.com/yb.docdb.ConsensusFrontierPB] {
    op_id {
      term: 1
      index: 21348
    }
    hybrid_time: 6618798875369000960
    history_cutoff: 18446744073709551614
  }
}

I0531 10:17:24.333310 30050 version_set.cc:2280] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Creating manifest 13
I0531 10:17:24.333372 30050 version_set.cc:3346] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Writing version edit: comparator: "leveldb.BytewiseComparator"

I0531 10:17:24.333422 30050 version_set.cc:3346] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Writing version edit: log_number: 3
flushed_frontier {
  [type.googleapis.com/yb.docdb.ConsensusFrontierPB] {
    op_id {
      term: 1
      index: 4
    }
    hybrid_time: 6645580776778723328
    history_cutoff: 18446744073709551614
  }
}

I0531 10:17:24.333808 30050 tablet.cc:577] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Creating RocksDB database in dir /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000
I0531 10:17:24.334146 30050 tablet.cc:735] Opening RocksDB at: /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000
I0531 10:17:24.334802 30050 version_set.cc:2839] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: Recovered from manifest file:/home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000/MANIFEST-000013 succeeded,manifest_file_number is 13, next_file_number is 15, last_sequence is 1125899908363543, log_number is 0,prev_log_number is 0,max_column_family is 0, flushed_values is 0x0000000003492900 -> { op_id: 1.4 hybrid_time: { physical: 1622456244330743 } history_cutoff:  hybrid_time_filter:  }
I0531 10:17:24.334820 30050 version_set.cc:2847] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: Column family [default] (ID 0), log number is 3
I0531 10:17:24.334981 30050 db_impl.cc:1161] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: [JOB 1] Delete /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000//MANIFEST-000011 type=4 #11 -- OK
I0531 10:17:24.335487 30050 tablet.cc:750] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Opening intents DB at: /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000.intents
I0531 10:17:24.335600 30050 db_impl.cc:770] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: Creating manifest 1 
I0531 10:17:24.336400 30050 version_set.cc:2839] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: Recovered from manifest file:/home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000.intents/MANIFEST-000001 succeeded,manifest_file_number is 1, next_file_number is 3, last_sequence is 1125899906842624, log_number is 0,prev_log_number is 0,max_column_family is 0, flushed_values is 
I0531 10:17:24.336418 30050 version_set.cc:2847] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: Column family [default] (ID 0), log number is 0
I0531 10:17:24.336958 30050 tablet.cc:793] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Successfully opened a RocksDB database at /home/ykdl/db/disk/data/yb-data/master/data/rocksdb/table-sys.catalog.uuid/tablet-00000000000000000000000000000000, obj: 0x2e29200
I0531 10:17:24.336971 30050 tablet_snapshots.cc:242] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Checkpoint restored from /home/ykdl/yugabyte-2.5.3.1/share/initial_sys_catalog_snapshot/rocksdb
I0531 10:17:24.336977 30050 tablet_snapshots.cc:243] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Sequence numbers: old=1125899906842628, restored=1125899908363543
I0531 10:17:24.336982 30050 tablet_snapshots.cc:246] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Re-enabling compactions
I0531 10:17:24.337301 30050 db_impl.cc:2469] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: SetOptions() on column family [default], inputs:
I0531 10:17:24.337311 30050 db_impl.cc:2472] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: level0_stop_writes_trigger: 2147483647
I0531 10:17:24.337314 30050 db_impl.cc:2472] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: level0_slowdown_writes_trigger: 2147483647
I0531 10:17:24.337318 30050 db_impl.cc:2477] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: [default] SetOptions succeeded
I0531 10:17:24.337322 30050 mutable_cf_options.cc:83] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                         write_buffer_size: 134217728
I0531 10:17:24.337327 30050 mutable_cf_options.cc:85] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                   max_write_buffer_number: 2
I0531 10:17:24.337329 30050 mutable_cf_options.cc:87] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                          arena_block_size: 131072
I0531 10:17:24.337333 30050 mutable_cf_options.cc:89] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                memtable_prefix_bloom_bits: 0
I0531 10:17:24.337337 30050 mutable_cf_options.cc:91] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:              memtable_prefix_bloom_probes: 6
I0531 10:17:24.337340 30050 mutable_cf_options.cc:93] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:  memtable_prefix_bloom_huge_page_tlb_size: 0
I0531 10:17:24.337343 30050 mutable_cf_options.cc:95] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                     max_successive_merges: 0
I0531 10:17:24.337347 30050 mutable_cf_options.cc:97] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                            filter_deletes: 0
I0531 10:17:24.337350 30050 mutable_cf_options.cc:99] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                  disable_auto_compactions: 1
I0531 10:17:24.337353 30050 mutable_cf_options.cc:101] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:       soft_pending_compaction_bytes_limit: 0
I0531 10:17:24.337357 30050 mutable_cf_options.cc:103] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:       hard_pending_compaction_bytes_limit: 0
I0531 10:17:24.337360 30050 mutable_cf_options.cc:105] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:        level0_file_num_compaction_trigger: 5
I0531 10:17:24.337363 30050 mutable_cf_options.cc:107] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            level0_slowdown_writes_trigger: 2147483647
I0531 10:17:24.337371 30050 mutable_cf_options.cc:109] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                level0_stop_writes_trigger: 2147483647
I0531 10:17:24.337375 30050 mutable_cf_options.cc:111] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            max_grandparent_overlap_factor: 10
I0531 10:17:24.337378 30050 mutable_cf_options.cc:113] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                expanded_compaction_factor: 25
I0531 10:17:24.337383 30050 mutable_cf_options.cc:115] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                  source_compaction_factor: 1
I0531 10:17:24.337385 30050 mutable_cf_options.cc:117] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                     target_file_size_base: 2097152
I0531 10:17:24.337388 30050 mutable_cf_options.cc:119] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:               target_file_size_multiplier: 1
I0531 10:17:24.337393 30050 mutable_cf_options.cc:121] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                  max_bytes_for_level_base: 10485760
I0531 10:17:24.337395 30050 mutable_cf_options.cc:123] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            max_bytes_for_level_multiplier: 10
I0531 10:17:24.337400 30050 mutable_cf_options.cc:131] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: max_bytes_for_level_multiplier_additional: 1, 1, 1, 1, 1, 1, 1
I0531 10:17:24.337404 30050 mutable_cf_options.cc:133] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            verify_checksums_in_compaction: 1
I0531 10:17:24.337407 30050 mutable_cf_options.cc:135] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:         max_sequential_skip_in_iterations: 8
I0531 10:17:24.337734 30050 db_impl.cc:2469] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: SetOptions() on column family [default], inputs:
I0531 10:17:24.337744 30050 db_impl.cc:2472] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: disable_auto_compactions: false
I0531 10:17:24.337747 30050 db_impl.cc:2477] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: [default] SetOptions succeeded
I0531 10:17:24.337751 30050 mutable_cf_options.cc:83] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                         write_buffer_size: 134217728
I0531 10:17:24.337755 30050 mutable_cf_options.cc:85] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                   max_write_buffer_number: 2
I0531 10:17:24.337759 30050 mutable_cf_options.cc:87] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                          arena_block_size: 131072
I0531 10:17:24.337762 30050 mutable_cf_options.cc:89] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                memtable_prefix_bloom_bits: 0
I0531 10:17:24.337765 30050 mutable_cf_options.cc:91] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:              memtable_prefix_bloom_probes: 6
I0531 10:17:24.337769 30050 mutable_cf_options.cc:93] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:  memtable_prefix_bloom_huge_page_tlb_size: 0
I0531 10:17:24.337772 30050 mutable_cf_options.cc:95] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                     max_successive_merges: 0
I0531 10:17:24.337775 30050 mutable_cf_options.cc:97] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                            filter_deletes: 0
I0531 10:17:24.337779 30050 mutable_cf_options.cc:99] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                  disable_auto_compactions: 0
I0531 10:17:24.337788 30050 mutable_cf_options.cc:101] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:       soft_pending_compaction_bytes_limit: 0
I0531 10:17:24.337792 30050 mutable_cf_options.cc:103] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:       hard_pending_compaction_bytes_limit: 0
I0531 10:17:24.337795 30050 mutable_cf_options.cc:105] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:        level0_file_num_compaction_trigger: 5
I0531 10:17:24.337800 30050 mutable_cf_options.cc:107] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            level0_slowdown_writes_trigger: 2147483647
I0531 10:17:24.337802 30050 mutable_cf_options.cc:109] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                level0_stop_writes_trigger: 2147483647
I0531 10:17:24.337806 30050 mutable_cf_options.cc:111] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            max_grandparent_overlap_factor: 10
I0531 10:17:24.337810 30050 mutable_cf_options.cc:113] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                expanded_compaction_factor: 25
I0531 10:17:24.337812 30050 mutable_cf_options.cc:115] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                  source_compaction_factor: 1
I0531 10:17:24.337816 30050 mutable_cf_options.cc:117] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                     target_file_size_base: 2097152
I0531 10:17:24.337819 30050 mutable_cf_options.cc:119] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:               target_file_size_multiplier: 1
I0531 10:17:24.337822 30050 mutable_cf_options.cc:121] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:                  max_bytes_for_level_base: 10485760
I0531 10:17:24.337826 30050 mutable_cf_options.cc:123] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            max_bytes_for_level_multiplier: 10
I0531 10:17:24.337831 30050 mutable_cf_options.cc:131] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]: max_bytes_for_level_multiplier_additional: 1, 1, 1, 1, 1, 1, 1
I0531 10:17:24.337834 30050 mutable_cf_options.cc:133] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:            verify_checksums_in_compaction: 1
I0531 10:17:24.337837 30050 mutable_cf_options.cc:135] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [R]:         max_sequential_skip_in_iterations: 8
I0531 10:17:24.338193 30050 db_impl.cc:2469] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: SetOptions() on column family [default], inputs:
I0531 10:17:24.338202 30050 db_impl.cc:2472] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: level0_stop_writes_trigger: 2147483647
I0531 10:17:24.338207 30050 db_impl.cc:2472] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: level0_slowdown_writes_trigger: 2147483647
I0531 10:17:24.338209 30050 db_impl.cc:2477] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: [default] SetOptions succeeded
I0531 10:17:24.338213 30050 mutable_cf_options.cc:83] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                         write_buffer_size: 134217728
I0531 10:17:24.338217 30050 mutable_cf_options.cc:85] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                   max_write_buffer_number: 2
I0531 10:17:24.338220 30050 mutable_cf_options.cc:87] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                          arena_block_size: 131072
I0531 10:17:24.338224 30050 mutable_cf_options.cc:89] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                memtable_prefix_bloom_bits: 0
I0531 10:17:24.338227 30050 mutable_cf_options.cc:91] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:              memtable_prefix_bloom_probes: 6
I0531 10:17:24.338235 30050 mutable_cf_options.cc:93] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:  memtable_prefix_bloom_huge_page_tlb_size: 0
I0531 10:17:24.338239 30050 mutable_cf_options.cc:95] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                     max_successive_merges: 0
I0531 10:17:24.338243 30050 mutable_cf_options.cc:97] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                            filter_deletes: 0
I0531 10:17:24.338245 30050 mutable_cf_options.cc:99] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                  disable_auto_compactions: 1
I0531 10:17:24.338249 30050 mutable_cf_options.cc:101] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:       soft_pending_compaction_bytes_limit: 0
I0531 10:17:24.338253 30050 mutable_cf_options.cc:103] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:       hard_pending_compaction_bytes_limit: 0
I0531 10:17:24.338256 30050 mutable_cf_options.cc:105] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:        level0_file_num_compaction_trigger: 5
I0531 10:17:24.338259 30050 mutable_cf_options.cc:107] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            level0_slowdown_writes_trigger: 2147483647
I0531 10:17:24.338263 30050 mutable_cf_options.cc:109] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                level0_stop_writes_trigger: 2147483647
I0531 10:17:24.338266 30050 mutable_cf_options.cc:111] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            max_grandparent_overlap_factor: 10
I0531 10:17:24.338269 30050 mutable_cf_options.cc:113] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                expanded_compaction_factor: 25
I0531 10:17:24.338272 30050 mutable_cf_options.cc:115] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                  source_compaction_factor: 1
I0531 10:17:24.338276 30050 mutable_cf_options.cc:117] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                     target_file_size_base: 2097152
I0531 10:17:24.338279 30050 mutable_cf_options.cc:119] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:               target_file_size_multiplier: 1
I0531 10:17:24.338284 30050 mutable_cf_options.cc:121] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                  max_bytes_for_level_base: 10485760
I0531 10:17:24.338286 30050 mutable_cf_options.cc:123] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            max_bytes_for_level_multiplier: 10
I0531 10:17:24.338291 30050 mutable_cf_options.cc:131] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: max_bytes_for_level_multiplier_additional: 1, 1, 1, 1, 1, 1, 1
I0531 10:17:24.338294 30050 mutable_cf_options.cc:133] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            verify_checksums_in_compaction: 1
I0531 10:17:24.338299 30050 mutable_cf_options.cc:135] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:         max_sequential_skip_in_iterations: 8
I0531 10:17:24.338635 30050 db_impl.cc:2469] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: SetOptions() on column family [default], inputs:
I0531 10:17:24.338645 30050 db_impl.cc:2472] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: disable_auto_compactions: false
I0531 10:17:24.338649 30050 db_impl.cc:2477] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: [default] SetOptions succeeded
I0531 10:17:24.338654 30050 mutable_cf_options.cc:83] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                         write_buffer_size: 134217728
I0531 10:17:24.338661 30050 mutable_cf_options.cc:85] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                   max_write_buffer_number: 2
I0531 10:17:24.338665 30050 mutable_cf_options.cc:87] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                          arena_block_size: 131072
I0531 10:17:24.338668 30050 mutable_cf_options.cc:89] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                memtable_prefix_bloom_bits: 0
I0531 10:17:24.338671 30050 mutable_cf_options.cc:91] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:              memtable_prefix_bloom_probes: 6
I0531 10:17:24.338675 30050 mutable_cf_options.cc:93] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:  memtable_prefix_bloom_huge_page_tlb_size: 0
I0531 10:17:24.338678 30050 mutable_cf_options.cc:95] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                     max_successive_merges: 0
I0531 10:17:24.338682 30050 mutable_cf_options.cc:97] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                            filter_deletes: 0
I0531 10:17:24.338685 30050 mutable_cf_options.cc:99] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                  disable_auto_compactions: 0
I0531 10:17:24.338688 30050 mutable_cf_options.cc:101] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:       soft_pending_compaction_bytes_limit: 0
I0531 10:17:24.338692 30050 mutable_cf_options.cc:103] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:       hard_pending_compaction_bytes_limit: 0
I0531 10:17:24.338696 30050 mutable_cf_options.cc:105] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:        level0_file_num_compaction_trigger: 5
I0531 10:17:24.338699 30050 mutable_cf_options.cc:107] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            level0_slowdown_writes_trigger: 2147483647
I0531 10:17:24.338702 30050 mutable_cf_options.cc:109] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                level0_stop_writes_trigger: 2147483647
I0531 10:17:24.338706 30050 mutable_cf_options.cc:111] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            max_grandparent_overlap_factor: 10
I0531 10:17:24.338709 30050 mutable_cf_options.cc:113] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                expanded_compaction_factor: 25
I0531 10:17:24.338712 30050 mutable_cf_options.cc:115] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                  source_compaction_factor: 1
I0531 10:17:24.338716 30050 mutable_cf_options.cc:117] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                     target_file_size_base: 2097152
I0531 10:17:24.338719 30050 mutable_cf_options.cc:119] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:               target_file_size_multiplier: 1
I0531 10:17:24.338722 30050 mutable_cf_options.cc:121] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:                  max_bytes_for_level_base: 10485760
I0531 10:17:24.338726 30050 mutable_cf_options.cc:123] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            max_bytes_for_level_multiplier: 10
I0531 10:17:24.338730 30050 mutable_cf_options.cc:131] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]: max_bytes_for_level_multiplier_additional: 1, 1, 1, 1, 1, 1, 1
I0531 10:17:24.338734 30050 mutable_cf_options.cc:133] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:            verify_checksums_in_compaction: 1
I0531 10:17:24.338737 30050 mutable_cf_options.cc:135] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda [I]:         max_sequential_skip_in_iterations: 8
I0531 10:17:25.323241 30047 master_service.cc:678] Patching role from leader to follower because of: Leader not ready to serve requests. (yb/master/scoped_leader_shared_lock.cc:96): Leader not yet ready to serve requests: leader_ready_term_ = -1; cstate.current_term = 1 [suppressed 1446 similar messages]
I0531 10:17:25.484488 30051 sys_catalog_initialization.cc:157] Imported 555 tablet metadata changes
I0531 10:17:25.484928 30051 catalog_manager.cc:846] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Re-initializing cluster config
I0531 10:17:25.484990 30051 catalog_manager.cc:1002] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Setting cluster UUID to 3846e7d7-2c53-4e58-b46d-efdc645c2b4d from the --cluster_uuid flag
I0531 10:17:25.485452 30051 catalog_manager.cc:850] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Restoring snapshot completed, considering initdb finished
I0531 10:17:25.485469 30051 catalog_manager.cc:6899] initdb completed successfully
I0531 10:17:25.485918 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading tables into memory.
I0531 10:17:25.486691 30051 catalog_loaders.cc:92] Loaded metadata for table pg_user_mapping_user_server_index [id=000000010000300080000000000000af]
I0531 10:17:25.486757 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_data_wrapper_name_index [id=00000001000030008000000000000224]
I0531 10:17:25.486791 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_server_name_index [id=00000001000030008000000000000225]
I0531 10:17:25.486821 30051 catalog_loaders.cc:92] Loaded metadata for table pg_default_acl [id=0000000100003000800000000000033a]
I0531 10:17:25.486851 30051 catalog_loaders.cc:92] Loaded metadata for table pg_default_acl_role_nsp_obj_index [id=0000000100003000800000000000033b]
I0531 10:17:25.486898 30051 catalog_loaders.cc:92] Loaded metadata for table pg_pltemplate [id=00000001000030008000000000000470]
I0531 10:17:25.486933 30051 catalog_loaders.cc:92] Loaded metadata for table pg_tablespace [id=000000010000300080000000000004bd]
I0531 10:17:25.486961 30051 catalog_loaders.cc:92] Loaded metadata for table pg_shdepend [id=000000010000300080000000000004be]
I0531 10:17:25.486990 30051 catalog_loaders.cc:92] Loaded metadata for table pg_shdepend_depender_index [id=000000010000300080000000000004d0]
I0531 10:17:25.487018 30051 catalog_loaders.cc:92] Loaded metadata for table pg_shdepend_reference_index [id=000000010000300080000000000004d1]
I0531 10:17:25.487053 30051 catalog_loaders.cc:92] Loaded metadata for table pg_type [id=000000010000300080000000000004df]
I0531 10:17:25.487088 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attribute [id=000000010000300080000000000004e1]
I0531 10:17:25.487123 30051 catalog_loaders.cc:92] Loaded metadata for table pg_proc [id=000000010000300080000000000004e7]
I0531 10:17:25.487159 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class [id=000000010000300080000000000004eb]
I0531 10:17:25.487190 30051 catalog_loaders.cc:92] Loaded metadata for table pg_authid [id=000000010000300080000000000004ec]
I0531 10:17:25.487216 30051 catalog_loaders.cc:92] Loaded metadata for table pg_auth_members [id=000000010000300080000000000004ed]
I0531 10:17:25.487246 30051 catalog_loaders.cc:92] Loaded metadata for table pg_database [id=000000010000300080000000000004ee]
I0531 10:17:25.487273 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_server [id=00000001000030008000000000000589]
I0531 10:17:25.487300 30051 catalog_loaders.cc:92] Loaded metadata for table pg_user_mapping [id=0000000100003000800000000000058a]
I0531 10:17:25.487326 30051 catalog_loaders.cc:92] Loaded metadata for table pg_inherits_parent_index [id=0000000100003000800000000000088b]
I0531 10:17:25.487355 30051 catalog_loaders.cc:92] Loaded metadata for table pg_sequence [id=000000010000300080000000000008b0]
I0531 10:17:25.487383 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_data_wrapper [id=00000001000030008000000000000918]
I0531 10:17:25.487417 30051 catalog_loaders.cc:92] Loaded metadata for table pg_shdescription [id=0000000100003000800000000000095c]
I0531 10:17:25.487447 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conparentid_index [id=00000001000030008000000000000a13]
I0531 10:17:25.487479 30051 catalog_loaders.cc:92] Loaded metadata for table pg_aggregate [id=00000001000030008000000000000a28]
I0531 10:17:25.487507 30051 catalog_loaders.cc:92] Loaded metadata for table pg_am [id=00000001000030008000000000000a29]
I0531 10:17:25.487534 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop [id=00000001000030008000000000000a2a]
I0531 10:17:25.487561 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amproc [id=00000001000030008000000000000a2b]
I0531 10:17:25.487588 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attrdef [id=00000001000030008000000000000a2c]
I0531 10:17:25.487615 30051 catalog_loaders.cc:92] Loaded metadata for table pg_cast [id=00000001000030008000000000000a2d]
I0531 10:17:25.487648 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint [id=00000001000030008000000000000a2e]
I0531 10:17:25.487675 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion [id=00000001000030008000000000000a2f]
I0531 10:17:25.487704 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend [id=00000001000030008000000000000a30]
I0531 10:17:25.487730 30051 catalog_loaders.cc:92] Loaded metadata for table pg_description [id=00000001000030008000000000000a31]
I0531 10:17:25.487762 30051 catalog_loaders.cc:92] Loaded metadata for table pg_index [id=00000001000030008000000000000a32]
I0531 10:17:25.487789 30051 catalog_loaders.cc:92] Loaded metadata for table pg_inherits [id=00000001000030008000000000000a33]
I0531 10:17:25.487818 30051 catalog_loaders.cc:92] Loaded metadata for table pg_language [id=00000001000030008000000000000a34]
I0531 10:17:25.487843 30051 catalog_loaders.cc:92] Loaded metadata for table pg_largeobject [id=00000001000030008000000000000a35]
I0531 10:17:25.487880 30051 catalog_loaders.cc:92] Loaded metadata for table pg_namespace [id=00000001000030008000000000000a37]
I0531 10:17:25.487910 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opclass [id=00000001000030008000000000000a38]
I0531 10:17:25.487941 30051 catalog_loaders.cc:92] Loaded metadata for table pg_operator [id=00000001000030008000000000000a39]
I0531 10:17:25.487968 30051 catalog_loaders.cc:92] Loaded metadata for table pg_rewrite [id=00000001000030008000000000000a3a]
I0531 10:17:25.488000 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic [id=00000001000030008000000000000a3b]
I0531 10:17:25.488032 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger [id=00000001000030008000000000000a3c]
I0531 10:17:25.488060 30051 catalog_loaders.cc:92] Loaded metadata for table pg_am_name_index [id=00000001000030008000000000000a5b]
I0531 10:17:25.488090 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop_fam_strat_index [id=00000001000030008000000000000a5d]
I0531 10:17:25.488118 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop_opr_fam_index [id=00000001000030008000000000000a5e]
I0531 10:17:25.488147 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amproc_fam_proc_index [id=00000001000030008000000000000a5f]
I0531 10:17:25.488176 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attrdef_adrelid_adnum_index [id=00000001000030008000000000000a60]
I0531 10:17:25.488204 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attribute_relid_attnam_index [id=00000001000030008000000000000a62]
I0531 10:17:25.488231 30051 catalog_loaders.cc:92] Loaded metadata for table pg_cast_source_target_index [id=00000001000030008000000000000a65]
I0531 10:17:25.488260 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class_relname_nsp_index [id=00000001000030008000000000000a67]
I0531 10:17:25.488286 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conname_nsp_index [id=00000001000030008000000000000a68]
I0531 10:17:25.488320 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conrelid_contypid_conname_index [id=00000001000030008000000000000a69]
I0531 10:17:25.488348 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_contypid_index [id=00000001000030008000000000000a6a]
I0531 10:17:25.488376 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion_default_index [id=00000001000030008000000000000a6c]
I0531 10:17:25.488404 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion_name_nsp_index [id=00000001000030008000000000000a6d]
I0531 10:17:25.488431 30051 catalog_loaders.cc:92] Loaded metadata for table pg_database_datname_index [id=00000001000030008000000000000a6f]
I0531 10:17:25.488458 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend_depender_index [id=00000001000030008000000000000a71]
I0531 10:17:25.488487 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend_reference_index [id=00000001000030008000000000000a72]
I0531 10:17:25.488514 30051 catalog_loaders.cc:92] Loaded metadata for table pg_authid_rolname_index [id=00000001000030008000000000000a74]
I0531 10:17:25.488541 30051 catalog_loaders.cc:92] Loaded metadata for table pg_index_indrelid_index [id=00000001000030008000000000000a76]
I0531 10:17:25.488569 30051 catalog_loaders.cc:92] Loaded metadata for table pg_language_name_index [id=00000001000030008000000000000a79]
I0531 10:17:25.488606 30051 catalog_loaders.cc:92] Loaded metadata for table pg_namespace_nspname_index [id=00000001000030008000000000000a7c]
I0531 10:17:25.488638 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opclass_am_name_nsp_index [id=00000001000030008000000000000a7e]
I0531 10:17:25.488667 30051 catalog_loaders.cc:92] Loaded metadata for table pg_operator_oprname_l_r_n_index [id=00000001000030008000000000000a81]
I0531 10:17:25.488695 30051 catalog_loaders.cc:92] Loaded metadata for table pg_proc_proname_args_nsp_index [id=00000001000030008000000000000a83]
I0531 10:17:25.488723 30051 catalog_loaders.cc:92] Loaded metadata for table pg_rewrite_rel_rulename_index [id=00000001000030008000000000000a85]
I0531 10:17:25.488749 30051 catalog_loaders.cc:92] Loaded metadata for table pg_auth_members_member_role_index [id=00000001000030008000000000000a87]
I0531 10:17:25.488776 30051 catalog_loaders.cc:92] Loaded metadata for table pg_tablespace_spcname_index [id=00000001000030008000000000000a8a]
I0531 10:17:25.488803 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger_tgconstraint_index [id=00000001000030008000000000000a8b]
I0531 10:17:25.488831 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger_tgrelid_tgname_index [id=00000001000030008000000000000a8d]
I0531 10:17:25.488992 30051 catalog_loaders.cc:92] Loaded metadata for table pg_type_typname_nsp_index [id=00000001000030008000000000000a90]
I0531 10:17:25.489032 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opfamily [id=00000001000030008000000000000ac1]
I0531 10:17:25.489061 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opfamily_am_name_nsp_index [id=00000001000030008000000000000ac2]
I0531 10:17:25.489089 30051 catalog_loaders.cc:92] Loaded metadata for table pg_db_role_setting [id=00000001000030008000000000000b94]
I0531 10:17:25.489115 30051 catalog_loaders.cc:92] Loaded metadata for table pg_largeobject_metadata [id=00000001000030008000000000000bb3]
I0531 10:17:25.489142 30051 catalog_loaders.cc:92] Loaded metadata for table pg_extension [id=00000001000030008000000000000c07]
I0531 10:17:25.489171 30051 catalog_loaders.cc:92] Loaded metadata for table pg_extension_name_index [id=00000001000030008000000000000c09]
I0531 10:17:25.489197 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_table [id=00000001000030008000000000000c2e]
I0531 10:17:25.489225 30051 catalog_loaders.cc:92] Loaded metadata for table pg_collation_name_enc_nsp_index [id=00000001000030008000000000000c5c]
I0531 10:17:25.489253 30051 catalog_loaders.cc:92] Loaded metadata for table pg_policy [id=00000001000030008000000000000cb8]
I0531 10:17:25.489289 30051 catalog_loaders.cc:92] Loaded metadata for table pg_policy_polrelid_polname_index [id=00000001000030008000000000000cba]
I0531 10:17:25.489318 30051 catalog_loaders.cc:92] Loaded metadata for table pg_partitioned_table [id=00000001000030008000000000000d16]
I0531 10:17:25.489346 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext_relid_index [id=00000001000030008000000000000d33]
I0531 10:17:25.489374 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext [id=00000001000030008000000000000d35]
I0531 10:17:25.489403 30051 catalog_loaders.cc:92] Loaded metadata for table pg_init_privs [id=00000001000030008000000000000d42]
I0531 10:17:25.489428 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class_tblspc_relfilenode_index [id=00000001000030008000000000000d7f]
I0531 10:17:25.489457 30051 catalog_loaders.cc:92] Loaded metadata for table pg_collation [id=00000001000030008000000000000d80]
I0531 10:17:25.489485 30051 catalog_loaders.cc:92] Loaded metadata for table pg_event_trigger [id=00000001000030008000000000000d8a]
I0531 10:17:25.489512 30051 catalog_loaders.cc:92] Loaded metadata for table pg_event_trigger_evtname_index [id=00000001000030008000000000000d8b]
I0531 10:17:25.489539 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum [id=00000001000030008000000000000dad]
I0531 10:17:25.489567 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum_typid_label_index [id=00000001000030008000000000000daf]
I0531 10:17:25.489593 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum_typid_sortorder_index [id=00000001000030008000000000000dce]
I0531 10:17:25.489620 30051 catalog_loaders.cc:92] Loaded metadata for table pg_range [id=00000001000030008000000000000dd5]
I0531 10:17:25.489648 30051 catalog_loaders.cc:92] Loaded metadata for table pg_transform_type_lang_index [id=00000001000030008000000000000df7]
I0531 10:17:25.489676 30051 catalog_loaders.cc:92] Loaded metadata for table pg_transform [id=00000001000030008000000000000df8]
I0531 10:17:25.489702 30051 catalog_loaders.cc:92] Loaded metadata for table pg_shseclabel [id=00000001000030008000000000000e08]
I0531 10:17:25.489729 30051 catalog_loaders.cc:92] Loaded metadata for table pg_seclabel [id=00000001000030008000000000000e0c]
I0531 10:17:25.489755 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_dict [id=00000001000030008000000000000e10]
I0531 10:17:25.489782 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_parser [id=00000001000030008000000000000e11]
I0531 10:17:25.489809 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config [id=00000001000030008000000000000e12]
I0531 10:17:25.489835 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config_map [id=00000001000030008000000000000e13]
I0531 10:17:25.489871 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_dict_dictname_index [id=00000001000030008000000000000e14]
I0531 10:17:25.489904 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_parser_prsname_index [id=00000001000030008000000000000e16]
I0531 10:17:25.489931 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config_cfgname_index [id=00000001000030008000000000000e18]
I0531 10:17:25.489959 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_template [id=00000001000030008000000000000eb4]
I0531 10:17:25.489986 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_template_tmplname_index [id=00000001000030008000000000000eb6]
I0531 10:17:25.490015 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext_name_index [id=00000001000030008000000000000f9d]
I0531 10:17:25.490041 30051 catalog_loaders.cc:92] Loaded metadata for table pg_replication_origin [id=00000001000030008000000000001770]
I0531 10:17:25.490068 30051 catalog_loaders.cc:92] Loaded metadata for table pg_replication_origin_roname_index [id=00000001000030008000000000001772]
I0531 10:17:25.490096 30051 catalog_loaders.cc:92] Loaded metadata for table pg_subscription [id=000000010000300080000000000017d4]
I0531 10:17:25.490129 30051 catalog_loaders.cc:92] Loaded metadata for table pg_subscription_rel [id=000000010000300080000000000017d6]
I0531 10:17:25.490157 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication [id=000000010000300080000000000017d8]
I0531 10:17:25.490183 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_rel [id=000000010000300080000000000017da]
I0531 10:17:25.490211 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_pubname_index [id=000000010000300080000000000017df]
I0531 10:17:25.490237 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_rel_prrelid_prpubid_index [id=000000010000300080000000000017e1]
I0531 10:17:25.490265 30051 catalog_loaders.cc:92] Loaded metadata for table pg_subscription_subname_index [id=000000010000300080000000000017e3]
I0531 10:17:25.490293 30051 catalog_loaders.cc:92] Loaded metadata for table pg_tablegroup [id=00000001000030008000000000001f40]
I0531 10:17:25.490319 30051 catalog_loaders.cc:92] Loaded metadata for table pg_yb_catalog_version [id=00000001000030008000000000001f4a]
I0531 10:17:25.490347 30051 catalog_loaders.cc:92] Loaded metadata for table sql_features [id=00000001000030008000000000003033]
I0531 10:17:25.490375 30051 catalog_loaders.cc:92] Loaded metadata for table sql_implementation_info [id=00000001000030008000000000003035]
I0531 10:17:25.490403 30051 catalog_loaders.cc:92] Loaded metadata for table sql_languages [id=00000001000030008000000000003037]
I0531 10:17:25.490430 30051 catalog_loaders.cc:92] Loaded metadata for table sql_packages [id=00000001000030008000000000003039]
I0531 10:17:25.490458 30051 catalog_loaders.cc:92] Loaded metadata for table sql_parts [id=0000000100003000800000000000303b]
I0531 10:17:25.490483 30051 catalog_loaders.cc:92] Loaded metadata for table sql_sizing [id=0000000100003000800000000000303d]
I0531 10:17:25.490510 30051 catalog_loaders.cc:92] Loaded metadata for table sql_sizing_profiles [id=0000000100003000800000000000303f]
I0531 10:17:25.490537 30051 catalog_loaders.cc:92] Loaded metadata for table pg_user_mapping_user_server_index [id=000030ac0000300080000000000000af]
I0531 10:17:25.490564 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_data_wrapper_name_index [id=000030ac000030008000000000000224]
I0531 10:17:25.490592 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_server_name_index [id=000030ac000030008000000000000225]
I0531 10:17:25.490619 30051 catalog_loaders.cc:92] Loaded metadata for table pg_default_acl [id=000030ac00003000800000000000033a]
I0531 10:17:25.490648 30051 catalog_loaders.cc:92] Loaded metadata for table pg_default_acl_role_nsp_obj_index [id=000030ac00003000800000000000033b]
I0531 10:17:25.490684 30051 catalog_loaders.cc:92] Loaded metadata for table pg_type [id=000030ac0000300080000000000004df]
I0531 10:17:25.490716 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attribute [id=000030ac0000300080000000000004e1]
I0531 10:17:25.490751 30051 catalog_loaders.cc:92] Loaded metadata for table pg_proc [id=000030ac0000300080000000000004e7]
I0531 10:17:25.490787 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class [id=000030ac0000300080000000000004eb]
I0531 10:17:25.490818 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_server [id=000030ac000030008000000000000589]
I0531 10:17:25.490844 30051 catalog_loaders.cc:92] Loaded metadata for table pg_user_mapping [id=000030ac00003000800000000000058a]
I0531 10:17:25.490883 30051 catalog_loaders.cc:92] Loaded metadata for table pg_inherits_parent_index [id=000030ac00003000800000000000088b]
I0531 10:17:25.490917 30051 catalog_loaders.cc:92] Loaded metadata for table pg_sequence [id=000030ac0000300080000000000008b0]
I0531 10:17:25.490945 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_data_wrapper [id=000030ac000030008000000000000918]
I0531 10:17:25.490973 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conparentid_index [id=000030ac000030008000000000000a13]
I0531 10:17:25.491010 30051 catalog_loaders.cc:92] Loaded metadata for table pg_aggregate [id=000030ac000030008000000000000a28]
I0531 10:17:25.491040 30051 catalog_loaders.cc:92] Loaded metadata for table pg_am [id=000030ac000030008000000000000a29]
I0531 10:17:25.491068 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop [id=000030ac000030008000000000000a2a]
I0531 10:17:25.491096 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amproc [id=000030ac000030008000000000000a2b]
I0531 10:17:25.491122 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attrdef [id=000030ac000030008000000000000a2c]
I0531 10:17:25.491148 30051 catalog_loaders.cc:92] Loaded metadata for table pg_cast [id=000030ac000030008000000000000a2d]
I0531 10:17:25.491181 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint [id=000030ac000030008000000000000a2e]
I0531 10:17:25.491209 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion [id=000030ac000030008000000000000a2f]
I0531 10:17:25.491236 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend [id=000030ac000030008000000000000a30]
I0531 10:17:25.491307 30051 catalog_loaders.cc:92] Loaded metadata for table pg_description [id=000030ac000030008000000000000a31]
I0531 10:17:25.491343 30051 catalog_loaders.cc:92] Loaded metadata for table pg_index [id=000030ac000030008000000000000a32]
I0531 10:17:25.491370 30051 catalog_loaders.cc:92] Loaded metadata for table pg_inherits [id=000030ac000030008000000000000a33]
I0531 10:17:25.491398 30051 catalog_loaders.cc:92] Loaded metadata for table pg_language [id=000030ac000030008000000000000a34]
I0531 10:17:25.491425 30051 catalog_loaders.cc:92] Loaded metadata for table pg_largeobject [id=000030ac000030008000000000000a35]
I0531 10:17:25.491452 30051 catalog_loaders.cc:92] Loaded metadata for table pg_namespace [id=000030ac000030008000000000000a37]
I0531 10:17:25.491480 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opclass [id=000030ac000030008000000000000a38]
I0531 10:17:25.491510 30051 catalog_loaders.cc:92] Loaded metadata for table pg_operator [id=000030ac000030008000000000000a39]
I0531 10:17:25.491539 30051 catalog_loaders.cc:92] Loaded metadata for table pg_rewrite [id=000030ac000030008000000000000a3a]
I0531 10:17:25.491570 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic [id=000030ac000030008000000000000a3b]
I0531 10:17:25.491608 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger [id=000030ac000030008000000000000a3c]
I0531 10:17:25.491638 30051 catalog_loaders.cc:92] Loaded metadata for table pg_am_name_index [id=000030ac000030008000000000000a5b]
I0531 10:17:25.491667 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop_fam_strat_index [id=000030ac000030008000000000000a5d]
I0531 10:17:25.491695 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop_opr_fam_index [id=000030ac000030008000000000000a5e]
I0531 10:17:25.491724 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amproc_fam_proc_index [id=000030ac000030008000000000000a5f]
I0531 10:17:25.491751 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attrdef_adrelid_adnum_index [id=000030ac000030008000000000000a60]
I0531 10:17:25.491786 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attribute_relid_attnam_index [id=000030ac000030008000000000000a62]
I0531 10:17:25.491816 30051 catalog_loaders.cc:92] Loaded metadata for table pg_cast_source_target_index [id=000030ac000030008000000000000a65]
I0531 10:17:25.491843 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class_relname_nsp_index [id=000030ac000030008000000000000a67]
I0531 10:17:25.491946 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conname_nsp_index [id=000030ac000030008000000000000a68]
I0531 10:17:25.491986 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conrelid_contypid_conname_index [id=000030ac000030008000000000000a69]
I0531 10:17:25.492014 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_contypid_index [id=000030ac000030008000000000000a6a]
I0531 10:17:25.492049 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion_default_index [id=000030ac000030008000000000000a6c]
I0531 10:17:25.492079 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion_name_nsp_index [id=000030ac000030008000000000000a6d]
I0531 10:17:25.492106 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend_depender_index [id=000030ac000030008000000000000a71]
I0531 10:17:25.492133 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend_reference_index [id=000030ac000030008000000000000a72]
I0531 10:17:25.492161 30051 catalog_loaders.cc:92] Loaded metadata for table pg_index_indrelid_index [id=000030ac000030008000000000000a76]
I0531 10:17:25.492187 30051 catalog_loaders.cc:92] Loaded metadata for table pg_language_name_index [id=000030ac000030008000000000000a79]
I0531 10:17:25.492220 30051 catalog_loaders.cc:92] Loaded metadata for table pg_namespace_nspname_index [id=000030ac000030008000000000000a7c]
I0531 10:17:25.492251 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opclass_am_name_nsp_index [id=000030ac000030008000000000000a7e]
I0531 10:17:25.492280 30051 catalog_loaders.cc:92] Loaded metadata for table pg_operator_oprname_l_r_n_index [id=000030ac000030008000000000000a81]
I0531 10:17:25.492308 30051 catalog_loaders.cc:92] Loaded metadata for table pg_proc_proname_args_nsp_index [id=000030ac000030008000000000000a83]
I0531 10:17:25.492336 30051 catalog_loaders.cc:92] Loaded metadata for table pg_rewrite_rel_rulename_index [id=000030ac000030008000000000000a85]
I0531 10:17:25.492363 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger_tgconstraint_index [id=000030ac000030008000000000000a8b]
I0531 10:17:25.492390 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger_tgrelid_tgname_index [id=000030ac000030008000000000000a8d]
I0531 10:17:25.492417 30051 catalog_loaders.cc:92] Loaded metadata for table pg_type_typname_nsp_index [id=000030ac000030008000000000000a90]
I0531 10:17:25.492444 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opfamily [id=000030ac000030008000000000000ac1]
I0531 10:17:25.492471 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opfamily_am_name_nsp_index [id=000030ac000030008000000000000ac2]
I0531 10:17:25.492498 30051 catalog_loaders.cc:92] Loaded metadata for table pg_largeobject_metadata [id=000030ac000030008000000000000bb3]
I0531 10:17:25.492525 30051 catalog_loaders.cc:92] Loaded metadata for table pg_extension [id=000030ac000030008000000000000c07]
I0531 10:17:25.492560 30051 catalog_loaders.cc:92] Loaded metadata for table pg_extension_name_index [id=000030ac000030008000000000000c09]
I0531 10:17:25.492589 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_table [id=000030ac000030008000000000000c2e]
I0531 10:17:25.492617 30051 catalog_loaders.cc:92] Loaded metadata for table pg_collation_name_enc_nsp_index [id=000030ac000030008000000000000c5c]
I0531 10:17:25.492645 30051 catalog_loaders.cc:92] Loaded metadata for table pg_policy [id=000030ac000030008000000000000cb8]
I0531 10:17:25.492672 30051 catalog_loaders.cc:92] Loaded metadata for table pg_policy_polrelid_polname_index [id=000030ac000030008000000000000cba]
I0531 10:17:25.492699 30051 catalog_loaders.cc:92] Loaded metadata for table pg_partitioned_table [id=000030ac000030008000000000000d16]
I0531 10:17:25.492725 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext_relid_index [id=000030ac000030008000000000000d33]
I0531 10:17:25.492753 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext [id=000030ac000030008000000000000d35]
I0531 10:17:25.492780 30051 catalog_loaders.cc:92] Loaded metadata for table pg_init_privs [id=000030ac000030008000000000000d42]
I0531 10:17:25.492806 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class_tblspc_relfilenode_index [id=000030ac000030008000000000000d7f]
I0531 10:17:25.492835 30051 catalog_loaders.cc:92] Loaded metadata for table pg_collation [id=000030ac000030008000000000000d80]
I0531 10:17:25.492872 30051 catalog_loaders.cc:92] Loaded metadata for table pg_event_trigger [id=000030ac000030008000000000000d8a]
I0531 10:17:25.492919 30051 catalog_loaders.cc:92] Loaded metadata for table pg_event_trigger_evtname_index [id=000030ac000030008000000000000d8b]
I0531 10:17:25.492949 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum [id=000030ac000030008000000000000dad]
I0531 10:17:25.492976 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum_typid_label_index [id=000030ac000030008000000000000daf]
I0531 10:17:25.493005 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum_typid_sortorder_index [id=000030ac000030008000000000000dce]
I0531 10:17:25.493032 30051 catalog_loaders.cc:92] Loaded metadata for table pg_range [id=000030ac000030008000000000000dd5]
I0531 10:17:25.493059 30051 catalog_loaders.cc:92] Loaded metadata for table pg_transform_type_lang_index [id=000030ac000030008000000000000df7]
I0531 10:17:25.493086 30051 catalog_loaders.cc:92] Loaded metadata for table pg_transform [id=000030ac000030008000000000000df8]
I0531 10:17:25.493113 30051 catalog_loaders.cc:92] Loaded metadata for table pg_seclabel [id=000030ac000030008000000000000e0c]
I0531 10:17:25.493139 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_dict [id=000030ac000030008000000000000e10]
I0531 10:17:25.493166 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_parser [id=000030ac000030008000000000000e11]
I0531 10:17:25.493193 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config [id=000030ac000030008000000000000e12]
I0531 10:17:25.493218 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config_map [id=000030ac000030008000000000000e13]
I0531 10:17:25.493250 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_dict_dictname_index [id=000030ac000030008000000000000e14]
I0531 10:17:25.493280 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_parser_prsname_index [id=000030ac000030008000000000000e16]
I0531 10:17:25.493309 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config_cfgname_index [id=000030ac000030008000000000000e18]
I0531 10:17:25.493335 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_template [id=000030ac000030008000000000000eb4]
I0531 10:17:25.493362 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_template_tmplname_index [id=000030ac000030008000000000000eb6]
I0531 10:17:25.493389 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext_name_index [id=000030ac000030008000000000000f9d]
I0531 10:17:25.493417 30051 catalog_loaders.cc:92] Loaded metadata for table pg_subscription_rel [id=000030ac0000300080000000000017d6]
I0531 10:17:25.493443 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication [id=000030ac0000300080000000000017d8]
I0531 10:17:25.493469 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_rel [id=000030ac0000300080000000000017da]
I0531 10:17:25.493495 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_pubname_index [id=000030ac0000300080000000000017df]
I0531 10:17:25.493523 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_rel_prrelid_prpubid_index [id=000030ac0000300080000000000017e1]
I0531 10:17:25.493549 30051 catalog_loaders.cc:92] Loaded metadata for table pg_tablegroup [id=000030ac000030008000000000001f40]
I0531 10:17:25.493582 30051 catalog_loaders.cc:92] Loaded metadata for table sql_features [id=000030ac000030008000000000003033]
I0531 10:17:25.493610 30051 catalog_loaders.cc:92] Loaded metadata for table sql_implementation_info [id=000030ac000030008000000000003035]
I0531 10:17:25.493639 30051 catalog_loaders.cc:92] Loaded metadata for table sql_languages [id=000030ac000030008000000000003037]
I0531 10:17:25.493666 30051 catalog_loaders.cc:92] Loaded metadata for table sql_packages [id=000030ac000030008000000000003039]
I0531 10:17:25.493692 30051 catalog_loaders.cc:92] Loaded metadata for table sql_parts [id=000030ac00003000800000000000303b]
I0531 10:17:25.493718 30051 catalog_loaders.cc:92] Loaded metadata for table sql_sizing [id=000030ac00003000800000000000303d]
I0531 10:17:25.493749 30051 catalog_loaders.cc:92] Loaded metadata for table sql_sizing_profiles [id=000030ac00003000800000000000303f]
I0531 10:17:25.493777 30051 catalog_loaders.cc:92] Loaded metadata for table pg_user_mapping_user_server_index [id=000030ad0000300080000000000000af]
I0531 10:17:25.493854 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_data_wrapper_name_index [id=000030ad000030008000000000000224]
I0531 10:17:25.493906 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_server_name_index [id=000030ad000030008000000000000225]
I0531 10:17:25.493934 30051 catalog_loaders.cc:92] Loaded metadata for table pg_default_acl [id=000030ad00003000800000000000033a]
I0531 10:17:25.493963 30051 catalog_loaders.cc:92] Loaded metadata for table pg_default_acl_role_nsp_obj_index [id=000030ad00003000800000000000033b]
I0531 10:17:25.494004 30051 catalog_loaders.cc:92] Loaded metadata for table pg_type [id=000030ad0000300080000000000004df]
I0531 10:17:25.494038 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attribute [id=000030ad0000300080000000000004e1]
I0531 10:17:25.494073 30051 catalog_loaders.cc:92] Loaded metadata for table pg_proc [id=000030ad0000300080000000000004e7]
I0531 10:17:25.494109 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class [id=000030ad0000300080000000000004eb]
I0531 10:17:25.494138 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_server [id=000030ad000030008000000000000589]
I0531 10:17:25.494164 30051 catalog_loaders.cc:92] Loaded metadata for table pg_user_mapping [id=000030ad00003000800000000000058a]
I0531 10:17:25.494190 30051 catalog_loaders.cc:92] Loaded metadata for table pg_inherits_parent_index [id=000030ad00003000800000000000088b]
I0531 10:17:25.494223 30051 catalog_loaders.cc:92] Loaded metadata for table pg_sequence [id=000030ad0000300080000000000008b0]
I0531 10:17:25.494252 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_data_wrapper [id=000030ad000030008000000000000918]
I0531 10:17:25.494279 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conparentid_index [id=000030ad000030008000000000000a13]
I0531 10:17:25.494311 30051 catalog_loaders.cc:92] Loaded metadata for table pg_aggregate [id=000030ad000030008000000000000a28]
I0531 10:17:25.494338 30051 catalog_loaders.cc:92] Loaded metadata for table pg_am [id=000030ad000030008000000000000a29]
I0531 10:17:25.494370 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop [id=000030ad000030008000000000000a2a]
I0531 10:17:25.494400 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amproc [id=000030ad000030008000000000000a2b]
I0531 10:17:25.494426 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attrdef [id=000030ad000030008000000000000a2c]
I0531 10:17:25.494452 30051 catalog_loaders.cc:92] Loaded metadata for table pg_cast [id=000030ad000030008000000000000a2d]
I0531 10:17:25.494484 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint [id=000030ad000030008000000000000a2e]
I0531 10:17:25.494513 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion [id=000030ad000030008000000000000a2f]
I0531 10:17:25.494539 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend [id=000030ad000030008000000000000a30]
I0531 10:17:25.494565 30051 catalog_loaders.cc:92] Loaded metadata for table pg_description [id=000030ad000030008000000000000a31]
I0531 10:17:25.494596 30051 catalog_loaders.cc:92] Loaded metadata for table pg_index [id=000030ad000030008000000000000a32]
I0531 10:17:25.494627 30051 catalog_loaders.cc:92] Loaded metadata for table pg_inherits [id=000030ad000030008000000000000a33]
I0531 10:17:25.494658 30051 catalog_loaders.cc:92] Loaded metadata for table pg_language [id=000030ad000030008000000000000a34]
I0531 10:17:25.494688 30051 catalog_loaders.cc:92] Loaded metadata for table pg_largeobject [id=000030ad000030008000000000000a35]
I0531 10:17:25.494719 30051 catalog_loaders.cc:92] Loaded metadata for table pg_namespace [id=000030ad000030008000000000000a37]
I0531 10:17:25.494755 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opclass [id=000030ad000030008000000000000a38]
I0531 10:17:25.494786 30051 catalog_loaders.cc:92] Loaded metadata for table pg_operator [id=000030ad000030008000000000000a39]
I0531 10:17:25.494813 30051 catalog_loaders.cc:92] Loaded metadata for table pg_rewrite [id=000030ad000030008000000000000a3a]
I0531 10:17:25.494848 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic [id=000030ad000030008000000000000a3b]
I0531 10:17:25.494895 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger [id=000030ad000030008000000000000a3c]
I0531 10:17:25.494925 30051 catalog_loaders.cc:92] Loaded metadata for table pg_am_name_index [id=000030ad000030008000000000000a5b]
I0531 10:17:25.494954 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop_fam_strat_index [id=000030ad000030008000000000000a5d]
I0531 10:17:25.494983 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop_opr_fam_index [id=000030ad000030008000000000000a5e]
I0531 10:17:25.495012 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amproc_fam_proc_index [id=000030ad000030008000000000000a5f]
I0531 10:17:25.495043 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attrdef_adrelid_adnum_index [id=000030ad000030008000000000000a60]
I0531 10:17:25.495070 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attribute_relid_attnam_index [id=000030ad000030008000000000000a62]
I0531 10:17:25.495106 30051 catalog_loaders.cc:92] Loaded metadata for table pg_cast_source_target_index [id=000030ad000030008000000000000a65]
I0531 10:17:25.495136 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class_relname_nsp_index [id=000030ad000030008000000000000a67]
I0531 10:17:25.495163 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conname_nsp_index [id=000030ad000030008000000000000a68]
I0531 10:17:25.495191 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conrelid_contypid_conname_index [id=000030ad000030008000000000000a69]
I0531 10:17:25.495218 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_contypid_index [id=000030ad000030008000000000000a6a]
I0531 10:17:25.495245 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion_default_index [id=000030ad000030008000000000000a6c]
I0531 10:17:25.495273 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion_name_nsp_index [id=000030ad000030008000000000000a6d]
I0531 10:17:25.495301 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend_depender_index [id=000030ad000030008000000000000a71]
I0531 10:17:25.495327 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend_reference_index [id=000030ad000030008000000000000a72]
I0531 10:17:25.495354 30051 catalog_loaders.cc:92] Loaded metadata for table pg_index_indrelid_index [id=000030ad000030008000000000000a76]
I0531 10:17:25.495381 30051 catalog_loaders.cc:92] Loaded metadata for table pg_language_name_index [id=000030ad000030008000000000000a79]
I0531 10:17:25.495409 30051 catalog_loaders.cc:92] Loaded metadata for table pg_namespace_nspname_index [id=000030ad000030008000000000000a7c]
I0531 10:17:25.495441 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opclass_am_name_nsp_index [id=000030ad000030008000000000000a7e]
I0531 10:17:25.495471 30051 catalog_loaders.cc:92] Loaded metadata for table pg_operator_oprname_l_r_n_index [id=000030ad000030008000000000000a81]
I0531 10:17:25.495499 30051 catalog_loaders.cc:92] Loaded metadata for table pg_proc_proname_args_nsp_index [id=000030ad000030008000000000000a83]
I0531 10:17:25.495527 30051 catalog_loaders.cc:92] Loaded metadata for table pg_rewrite_rel_rulename_index [id=000030ad000030008000000000000a85]
I0531 10:17:25.495554 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger_tgconstraint_index [id=000030ad000030008000000000000a8b]
I0531 10:17:25.495581 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger_tgrelid_tgname_index [id=000030ad000030008000000000000a8d]
I0531 10:17:25.495613 30051 catalog_loaders.cc:92] Loaded metadata for table pg_type_typname_nsp_index [id=000030ad000030008000000000000a90]
I0531 10:17:25.495641 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opfamily [id=000030ad000030008000000000000ac1]
I0531 10:17:25.495669 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opfamily_am_name_nsp_index [id=000030ad000030008000000000000ac2]
I0531 10:17:25.495695 30051 catalog_loaders.cc:92] Loaded metadata for table pg_largeobject_metadata [id=000030ad000030008000000000000bb3]
I0531 10:17:25.495723 30051 catalog_loaders.cc:92] Loaded metadata for table pg_extension [id=000030ad000030008000000000000c07]
I0531 10:17:25.495749 30051 catalog_loaders.cc:92] Loaded metadata for table pg_extension_name_index [id=000030ad000030008000000000000c09]
I0531 10:17:25.495781 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_table [id=000030ad000030008000000000000c2e]
I0531 10:17:25.495810 30051 catalog_loaders.cc:92] Loaded metadata for table pg_collation_name_enc_nsp_index [id=000030ad000030008000000000000c5c]
I0531 10:17:25.495839 30051 catalog_loaders.cc:92] Loaded metadata for table pg_policy [id=000030ad000030008000000000000cb8]
I0531 10:17:25.495880 30051 catalog_loaders.cc:92] Loaded metadata for table pg_policy_polrelid_polname_index [id=000030ad000030008000000000000cba]
I0531 10:17:25.495913 30051 catalog_loaders.cc:92] Loaded metadata for table pg_partitioned_table [id=000030ad000030008000000000000d16]
I0531 10:17:25.495940 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext_relid_index [id=000030ad000030008000000000000d33]
I0531 10:17:25.495970 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext [id=000030ad000030008000000000000d35]
I0531 10:17:25.495996 30051 catalog_loaders.cc:92] Loaded metadata for table pg_init_privs [id=000030ad000030008000000000000d42]
I0531 10:17:25.496022 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class_tblspc_relfilenode_index [id=000030ad000030008000000000000d7f]
I0531 10:17:25.496099 30051 catalog_loaders.cc:92] Loaded metadata for table pg_collation [id=000030ad000030008000000000000d80]
I0531 10:17:25.496130 30051 catalog_loaders.cc:92] Loaded metadata for table pg_event_trigger [id=000030ad000030008000000000000d8a]
I0531 10:17:25.496157 30051 catalog_loaders.cc:92] Loaded metadata for table pg_event_trigger_evtname_index [id=000030ad000030008000000000000d8b]
I0531 10:17:25.496191 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum [id=000030ad000030008000000000000dad]
I0531 10:17:25.496220 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum_typid_label_index [id=000030ad000030008000000000000daf]
I0531 10:17:25.496248 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum_typid_sortorder_index [id=000030ad000030008000000000000dce]
I0531 10:17:25.496275 30051 catalog_loaders.cc:92] Loaded metadata for table pg_range [id=000030ad000030008000000000000dd5]
I0531 10:17:25.496302 30051 catalog_loaders.cc:92] Loaded metadata for table pg_transform_type_lang_index [id=000030ad000030008000000000000df7]
I0531 10:17:25.496330 30051 catalog_loaders.cc:92] Loaded metadata for table pg_transform [id=000030ad000030008000000000000df8]
I0531 10:17:25.496356 30051 catalog_loaders.cc:92] Loaded metadata for table pg_seclabel [id=000030ad000030008000000000000e0c]
I0531 10:17:25.496382 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_dict [id=000030ad000030008000000000000e10]
I0531 10:17:25.496409 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_parser [id=000030ad000030008000000000000e11]
I0531 10:17:25.496436 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config [id=000030ad000030008000000000000e12]
I0531 10:17:25.496462 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config_map [id=000030ad000030008000000000000e13]
I0531 10:17:25.496490 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_dict_dictname_index [id=000030ad000030008000000000000e14]
I0531 10:17:25.496521 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_parser_prsname_index [id=000030ad000030008000000000000e16]
I0531 10:17:25.496556 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config_cfgname_index [id=000030ad000030008000000000000e18]
I0531 10:17:25.496584 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_template [id=000030ad000030008000000000000eb4]
I0531 10:17:25.496618 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_template_tmplname_index [id=000030ad000030008000000000000eb6]
I0531 10:17:25.496646 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext_name_index [id=000030ad000030008000000000000f9d]
I0531 10:17:25.496673 30051 catalog_loaders.cc:92] Loaded metadata for table pg_subscription_rel [id=000030ad0000300080000000000017d6]
I0531 10:17:25.496701 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication [id=000030ad0000300080000000000017d8]
I0531 10:17:25.496727 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_rel [id=000030ad0000300080000000000017da]
I0531 10:17:25.496754 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_pubname_index [id=000030ad0000300080000000000017df]
I0531 10:17:25.496781 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_rel_prrelid_prpubid_index [id=000030ad0000300080000000000017e1]
I0531 10:17:25.496809 30051 catalog_loaders.cc:92] Loaded metadata for table pg_tablegroup [id=000030ad000030008000000000001f40]
I0531 10:17:25.496843 30051 catalog_loaders.cc:92] Loaded metadata for table sql_features [id=000030ad000030008000000000003033]
I0531 10:17:25.496889 30051 catalog_loaders.cc:92] Loaded metadata for table sql_implementation_info [id=000030ad000030008000000000003035]
I0531 10:17:25.496922 30051 catalog_loaders.cc:92] Loaded metadata for table sql_languages [id=000030ad000030008000000000003037]
I0531 10:17:25.496949 30051 catalog_loaders.cc:92] Loaded metadata for table sql_packages [id=000030ad000030008000000000003039]
I0531 10:17:25.496976 30051 catalog_loaders.cc:92] Loaded metadata for table sql_parts [id=000030ad00003000800000000000303b]
I0531 10:17:25.497002 30051 catalog_loaders.cc:92] Loaded metadata for table sql_sizing [id=000030ad00003000800000000000303d]
I0531 10:17:25.497030 30051 catalog_loaders.cc:92] Loaded metadata for table sql_sizing_profiles [id=000030ad00003000800000000000303f]
I0531 10:17:25.497056 30051 catalog_loaders.cc:92] Loaded metadata for table pg_user_mapping_user_server_index [id=000030af0000300080000000000000af]
I0531 10:17:25.497084 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_data_wrapper_name_index [id=000030af000030008000000000000224]
I0531 10:17:25.497112 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_server_name_index [id=000030af000030008000000000000225]
I0531 10:17:25.497138 30051 catalog_loaders.cc:92] Loaded metadata for table pg_default_acl [id=000030af00003000800000000000033a]
I0531 10:17:25.497166 30051 catalog_loaders.cc:92] Loaded metadata for table pg_default_acl_role_nsp_obj_index [id=000030af00003000800000000000033b]
I0531 10:17:25.497201 30051 catalog_loaders.cc:92] Loaded metadata for table pg_type [id=000030af0000300080000000000004df]
I0531 10:17:25.497239 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attribute [id=000030af0000300080000000000004e1]
I0531 10:17:25.497275 30051 catalog_loaders.cc:92] Loaded metadata for table pg_proc [id=000030af0000300080000000000004e7]
I0531 10:17:25.497313 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class [id=000030af0000300080000000000004eb]
I0531 10:17:25.497340 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_server [id=000030af000030008000000000000589]
I0531 10:17:25.497373 30051 catalog_loaders.cc:92] Loaded metadata for table pg_user_mapping [id=000030af00003000800000000000058a]
I0531 10:17:25.497400 30051 catalog_loaders.cc:92] Loaded metadata for table pg_inherits_parent_index [id=000030af00003000800000000000088b]
I0531 10:17:25.497428 30051 catalog_loaders.cc:92] Loaded metadata for table pg_sequence [id=000030af0000300080000000000008b0]
I0531 10:17:25.497460 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_data_wrapper [id=000030af000030008000000000000918]
I0531 10:17:25.497488 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conparentid_index [id=000030af000030008000000000000a13]
I0531 10:17:25.497519 30051 catalog_loaders.cc:92] Loaded metadata for table pg_aggregate [id=000030af000030008000000000000a28]
I0531 10:17:25.497547 30051 catalog_loaders.cc:92] Loaded metadata for table pg_am [id=000030af000030008000000000000a29]
I0531 10:17:25.497575 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop [id=000030af000030008000000000000a2a]
I0531 10:17:25.497606 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amproc [id=000030af000030008000000000000a2b]
I0531 10:17:25.497635 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attrdef [id=000030af000030008000000000000a2c]
I0531 10:17:25.497663 30051 catalog_loaders.cc:92] Loaded metadata for table pg_cast [id=000030af000030008000000000000a2d]
I0531 10:17:25.497695 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint [id=000030af000030008000000000000a2e]
I0531 10:17:25.497723 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion [id=000030af000030008000000000000a2f]
I0531 10:17:25.497750 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend [id=000030af000030008000000000000a30]
I0531 10:17:25.497776 30051 catalog_loaders.cc:92] Loaded metadata for table pg_description [id=000030af000030008000000000000a31]
I0531 10:17:25.497807 30051 catalog_loaders.cc:92] Loaded metadata for table pg_index [id=000030af000030008000000000000a32]
I0531 10:17:25.497833 30051 catalog_loaders.cc:92] Loaded metadata for table pg_inherits [id=000030af000030008000000000000a33]
I0531 10:17:25.497869 30051 catalog_loaders.cc:92] Loaded metadata for table pg_language [id=000030af000030008000000000000a34]
I0531 10:17:25.497900 30051 catalog_loaders.cc:92] Loaded metadata for table pg_largeobject [id=000030af000030008000000000000a35]
I0531 10:17:25.497925 30051 catalog_loaders.cc:92] Loaded metadata for table pg_namespace [id=000030af000030008000000000000a37]
I0531 10:17:25.497958 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opclass [id=000030af000030008000000000000a38]
I0531 10:17:25.497990 30051 catalog_loaders.cc:92] Loaded metadata for table pg_operator [id=000030af000030008000000000000a39]
I0531 10:17:25.498018 30051 catalog_loaders.cc:92] Loaded metadata for table pg_rewrite [id=000030af000030008000000000000a3a]
I0531 10:17:25.498051 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic [id=000030af000030008000000000000a3b]
I0531 10:17:25.498082 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger [id=000030af000030008000000000000a3c]
I0531 10:17:25.498109 30051 catalog_loaders.cc:92] Loaded metadata for table pg_am_name_index [id=000030af000030008000000000000a5b]
I0531 10:17:25.498137 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop_fam_strat_index [id=000030af000030008000000000000a5d]
I0531 10:17:25.498167 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop_opr_fam_index [id=000030af000030008000000000000a5e]
I0531 10:17:25.498195 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amproc_fam_proc_index [id=000030af000030008000000000000a5f]
I0531 10:17:25.498224 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attrdef_adrelid_adnum_index [id=000030af000030008000000000000a60]
I0531 10:17:25.498250 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attribute_relid_attnam_index [id=000030af000030008000000000000a62]
I0531 10:17:25.498323 30051 catalog_loaders.cc:92] Loaded metadata for table pg_cast_source_target_index [id=000030af000030008000000000000a65]
I0531 10:17:25.498360 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class_relname_nsp_index [id=000030af000030008000000000000a67]
I0531 10:17:25.498395 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conname_nsp_index [id=000030af000030008000000000000a68]
I0531 10:17:25.498430 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conrelid_contypid_conname_index [id=000030af000030008000000000000a69]
I0531 10:17:25.498458 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_contypid_index [id=000030af000030008000000000000a6a]
I0531 10:17:25.498487 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion_default_index [id=000030af000030008000000000000a6c]
I0531 10:17:25.498515 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion_name_nsp_index [id=000030af000030008000000000000a6d]
I0531 10:17:25.498543 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend_depender_index [id=000030af000030008000000000000a71]
I0531 10:17:25.498570 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend_reference_index [id=000030af000030008000000000000a72]
I0531 10:17:25.498608 30051 catalog_loaders.cc:92] Loaded metadata for table pg_index_indrelid_index [id=000030af000030008000000000000a76]
I0531 10:17:25.498641 30051 catalog_loaders.cc:92] Loaded metadata for table pg_language_name_index [id=000030af000030008000000000000a79]
I0531 10:17:25.498668 30051 catalog_loaders.cc:92] Loaded metadata for table pg_namespace_nspname_index [id=000030af000030008000000000000a7c]
I0531 10:17:25.498695 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opclass_am_name_nsp_index [id=000030af000030008000000000000a7e]
I0531 10:17:25.498730 30051 catalog_loaders.cc:92] Loaded metadata for table pg_operator_oprname_l_r_n_index [id=000030af000030008000000000000a81]
I0531 10:17:25.498760 30051 catalog_loaders.cc:92] Loaded metadata for table pg_proc_proname_args_nsp_index [id=000030af000030008000000000000a83]
I0531 10:17:25.498790 30051 catalog_loaders.cc:92] Loaded metadata for table pg_rewrite_rel_rulename_index [id=000030af000030008000000000000a85]
I0531 10:17:25.498816 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger_tgconstraint_index [id=000030af000030008000000000000a8b]
I0531 10:17:25.498842 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger_tgrelid_tgname_index [id=000030af000030008000000000000a8d]
I0531 10:17:25.498881 30051 catalog_loaders.cc:92] Loaded metadata for table pg_type_typname_nsp_index [id=000030af000030008000000000000a90]
I0531 10:17:25.498911 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opfamily [id=000030af000030008000000000000ac1]
I0531 10:17:25.498939 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opfamily_am_name_nsp_index [id=000030af000030008000000000000ac2]
I0531 10:17:25.498966 30051 catalog_loaders.cc:92] Loaded metadata for table pg_largeobject_metadata [id=000030af000030008000000000000bb3]
I0531 10:17:25.498994 30051 catalog_loaders.cc:92] Loaded metadata for table pg_extension [id=000030af000030008000000000000c07]
I0531 10:17:25.499022 30051 catalog_loaders.cc:92] Loaded metadata for table pg_extension_name_index [id=000030af000030008000000000000c09]
I0531 10:17:25.499047 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_table [id=000030af000030008000000000000c2e]
I0531 10:17:25.499080 30051 catalog_loaders.cc:92] Loaded metadata for table pg_collation_name_enc_nsp_index [id=000030af000030008000000000000c5c]
I0531 10:17:25.499111 30051 catalog_loaders.cc:92] Loaded metadata for table pg_policy [id=000030af000030008000000000000cb8]
I0531 10:17:25.499145 30051 catalog_loaders.cc:92] Loaded metadata for table pg_policy_polrelid_polname_index [id=000030af000030008000000000000cba]
I0531 10:17:25.499174 30051 catalog_loaders.cc:92] Loaded metadata for table pg_partitioned_table [id=000030af000030008000000000000d16]
I0531 10:17:25.499202 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext_relid_index [id=000030af000030008000000000000d33]
I0531 10:17:25.499229 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext [id=000030af000030008000000000000d35]
I0531 10:17:25.499256 30051 catalog_loaders.cc:92] Loaded metadata for table pg_init_privs [id=000030af000030008000000000000d42]
I0531 10:17:25.499289 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class_tblspc_relfilenode_index [id=000030af000030008000000000000d7f]
I0531 10:17:25.499320 30051 catalog_loaders.cc:92] Loaded metadata for table pg_collation [id=000030af000030008000000000000d80]
I0531 10:17:25.499347 30051 catalog_loaders.cc:92] Loaded metadata for table pg_event_trigger [id=000030af000030008000000000000d8a]
I0531 10:17:25.499374 30051 catalog_loaders.cc:92] Loaded metadata for table pg_event_trigger_evtname_index [id=000030af000030008000000000000d8b]
I0531 10:17:25.499401 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum [id=000030af000030008000000000000dad]
I0531 10:17:25.499433 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum_typid_label_index [id=000030af000030008000000000000daf]
I0531 10:17:25.499464 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum_typid_sortorder_index [id=000030af000030008000000000000dce]
I0531 10:17:25.499497 30051 catalog_loaders.cc:92] Loaded metadata for table pg_range [id=000030af000030008000000000000dd5]
I0531 10:17:25.499526 30051 catalog_loaders.cc:92] Loaded metadata for table pg_transform_type_lang_index [id=000030af000030008000000000000df7]
I0531 10:17:25.499557 30051 catalog_loaders.cc:92] Loaded metadata for table pg_transform [id=000030af000030008000000000000df8]
I0531 10:17:25.499583 30051 catalog_loaders.cc:92] Loaded metadata for table pg_seclabel [id=000030af000030008000000000000e0c]
I0531 10:17:25.499609 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_dict [id=000030af000030008000000000000e10]
I0531 10:17:25.499637 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_parser [id=000030af000030008000000000000e11]
I0531 10:17:25.499665 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config [id=000030af000030008000000000000e12]
I0531 10:17:25.499691 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config_map [id=000030af000030008000000000000e13]
I0531 10:17:25.499723 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_dict_dictname_index [id=000030af000030008000000000000e14]
I0531 10:17:25.499752 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_parser_prsname_index [id=000030af000030008000000000000e16]
I0531 10:17:25.499787 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config_cfgname_index [id=000030af000030008000000000000e18]
I0531 10:17:25.499817 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_template [id=000030af000030008000000000000eb4]
I0531 10:17:25.499845 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_template_tmplname_index [id=000030af000030008000000000000eb6]
I0531 10:17:25.499884 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext_name_index [id=000030af000030008000000000000f9d]
I0531 10:17:25.499913 30051 catalog_loaders.cc:92] Loaded metadata for table pg_subscription_rel [id=000030af0000300080000000000017d6]
I0531 10:17:25.499943 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication [id=000030af0000300080000000000017d8]
I0531 10:17:25.499969 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_rel [id=000030af0000300080000000000017da]
I0531 10:17:25.499996 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_pubname_index [id=000030af0000300080000000000017df]
I0531 10:17:25.500030 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_rel_prrelid_prpubid_index [id=000030af0000300080000000000017e1]
I0531 10:17:25.500059 30051 catalog_loaders.cc:92] Loaded metadata for table pg_tablegroup [id=000030af000030008000000000001f40]
I0531 10:17:25.500088 30051 catalog_loaders.cc:92] Loaded metadata for table sql_features [id=000030af000030008000000000003033]
I0531 10:17:25.500115 30051 catalog_loaders.cc:92] Loaded metadata for table sql_implementation_info [id=000030af000030008000000000003035]
I0531 10:17:25.500150 30051 catalog_loaders.cc:92] Loaded metadata for table sql_languages [id=000030af000030008000000000003037]
I0531 10:17:25.500183 30051 catalog_loaders.cc:92] Loaded metadata for table sql_packages [id=000030af000030008000000000003039]
I0531 10:17:25.500211 30051 catalog_loaders.cc:92] Loaded metadata for table sql_parts [id=000030af00003000800000000000303b]
I0531 10:17:25.500238 30051 catalog_loaders.cc:92] Loaded metadata for table sql_sizing [id=000030af00003000800000000000303d]
I0531 10:17:25.500265 30051 catalog_loaders.cc:92] Loaded metadata for table sql_sizing_profiles [id=000030af00003000800000000000303f]
I0531 10:17:25.500293 30051 catalog_loaders.cc:92] Loaded metadata for table pg_user_mapping_user_server_index [id=000030b00000300080000000000000af]
I0531 10:17:25.500322 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_data_wrapper_name_index [id=000030b0000030008000000000000224]
I0531 10:17:25.500355 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_server_name_index [id=000030b0000030008000000000000225]
I0531 10:17:25.500384 30051 catalog_loaders.cc:92] Loaded metadata for table pg_default_acl [id=000030b000003000800000000000033a]
I0531 10:17:25.500413 30051 catalog_loaders.cc:92] Loaded metadata for table pg_default_acl_role_nsp_obj_index [id=000030b000003000800000000000033b]
I0531 10:17:25.500449 30051 catalog_loaders.cc:92] Loaded metadata for table pg_type [id=000030b00000300080000000000004df]
I0531 10:17:25.500489 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attribute [id=000030b00000300080000000000004e1]
I0531 10:17:25.500530 30051 catalog_loaders.cc:92] Loaded metadata for table pg_proc [id=000030b00000300080000000000004e7]
I0531 10:17:25.500568 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class [id=000030b00000300080000000000004eb]
I0531 10:17:25.500597 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_server [id=000030b0000030008000000000000589]
I0531 10:17:25.500624 30051 catalog_loaders.cc:92] Loaded metadata for table pg_user_mapping [id=000030b000003000800000000000058a]
I0531 10:17:25.500694 30051 catalog_loaders.cc:92] Loaded metadata for table pg_inherits_parent_index [id=000030b000003000800000000000088b]
I0531 10:17:25.500728 30051 catalog_loaders.cc:92] Loaded metadata for table pg_sequence [id=000030b00000300080000000000008b0]
I0531 10:17:25.500757 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_data_wrapper [id=000030b0000030008000000000000918]
I0531 10:17:25.500830 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conparentid_index [id=000030b0000030008000000000000a13]
I0531 10:17:25.500881 30051 catalog_loaders.cc:92] Loaded metadata for table pg_aggregate [id=000030b0000030008000000000000a28]
I0531 10:17:25.500913 30051 catalog_loaders.cc:92] Loaded metadata for table pg_am [id=000030b0000030008000000000000a29]
I0531 10:17:25.500943 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop [id=000030b0000030008000000000000a2a]
I0531 10:17:25.500977 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amproc [id=000030b0000030008000000000000a2b]
I0531 10:17:25.501010 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attrdef [id=000030b0000030008000000000000a2c]
I0531 10:17:25.501039 30051 catalog_loaders.cc:92] Loaded metadata for table pg_cast [id=000030b0000030008000000000000a2d]
I0531 10:17:25.501072 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint [id=000030b0000030008000000000000a2e]
I0531 10:17:25.501101 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion [id=000030b0000030008000000000000a2f]
I0531 10:17:25.501128 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend [id=000030b0000030008000000000000a30]
I0531 10:17:25.501154 30051 catalog_loaders.cc:92] Loaded metadata for table pg_description [id=000030b0000030008000000000000a31]
I0531 10:17:25.501190 30051 catalog_loaders.cc:92] Loaded metadata for table pg_index [id=000030b0000030008000000000000a32]
I0531 10:17:25.501224 30051 catalog_loaders.cc:92] Loaded metadata for table pg_inherits [id=000030b0000030008000000000000a33]
I0531 10:17:25.501255 30051 catalog_loaders.cc:92] Loaded metadata for table pg_language [id=000030b0000030008000000000000a34]
I0531 10:17:25.501296 30051 catalog_loaders.cc:92] Loaded metadata for table pg_largeobject [id=000030b0000030008000000000000a35]
I0531 10:17:25.501327 30051 catalog_loaders.cc:92] Loaded metadata for table pg_namespace [id=000030b0000030008000000000000a37]
I0531 10:17:25.501354 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opclass [id=000030b0000030008000000000000a38]
I0531 10:17:25.501386 30051 catalog_loaders.cc:92] Loaded metadata for table pg_operator [id=000030b0000030008000000000000a39]
I0531 10:17:25.501415 30051 catalog_loaders.cc:92] Loaded metadata for table pg_rewrite [id=000030b0000030008000000000000a3a]
I0531 10:17:25.501447 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic [id=000030b0000030008000000000000a3b]
I0531 10:17:25.501484 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger [id=000030b0000030008000000000000a3c]
I0531 10:17:25.501514 30051 catalog_loaders.cc:92] Loaded metadata for table pg_am_name_index [id=000030b0000030008000000000000a5b]
I0531 10:17:25.501543 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop_fam_strat_index [id=000030b0000030008000000000000a5d]
I0531 10:17:25.501577 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amop_opr_fam_index [id=000030b0000030008000000000000a5e]
I0531 10:17:25.501607 30051 catalog_loaders.cc:92] Loaded metadata for table pg_amproc_fam_proc_index [id=000030b0000030008000000000000a5f]
I0531 10:17:25.501636 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attrdef_adrelid_adnum_index [id=000030b0000030008000000000000a60]
I0531 10:17:25.501665 30051 catalog_loaders.cc:92] Loaded metadata for table pg_attribute_relid_attnam_index [id=000030b0000030008000000000000a62]
I0531 10:17:25.501693 30051 catalog_loaders.cc:92] Loaded metadata for table pg_cast_source_target_index [id=000030b0000030008000000000000a65]
I0531 10:17:25.501721 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class_relname_nsp_index [id=000030b0000030008000000000000a67]
I0531 10:17:25.501756 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conname_nsp_index [id=000030b0000030008000000000000a68]
I0531 10:17:25.501787 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_conrelid_contypid_conname_index [id=000030b0000030008000000000000a69]
I0531 10:17:25.501816 30051 catalog_loaders.cc:92] Loaded metadata for table pg_constraint_contypid_index [id=000030b0000030008000000000000a6a]
I0531 10:17:25.501843 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion_default_index [id=000030b0000030008000000000000a6c]
I0531 10:17:25.501881 30051 catalog_loaders.cc:92] Loaded metadata for table pg_conversion_name_nsp_index [id=000030b0000030008000000000000a6d]
I0531 10:17:25.501912 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend_depender_index [id=000030b0000030008000000000000a71]
I0531 10:17:25.501941 30051 catalog_loaders.cc:92] Loaded metadata for table pg_depend_reference_index [id=000030b0000030008000000000000a72]
I0531 10:17:25.501969 30051 catalog_loaders.cc:92] Loaded metadata for table pg_index_indrelid_index [id=000030b0000030008000000000000a76]
I0531 10:17:25.501996 30051 catalog_loaders.cc:92] Loaded metadata for table pg_language_name_index [id=000030b0000030008000000000000a79]
I0531 10:17:25.502024 30051 catalog_loaders.cc:92] Loaded metadata for table pg_namespace_nspname_index [id=000030b0000030008000000000000a7c]
I0531 10:17:25.502053 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opclass_am_name_nsp_index [id=000030b0000030008000000000000a7e]
I0531 10:17:25.502086 30051 catalog_loaders.cc:92] Loaded metadata for table pg_operator_oprname_l_r_n_index [id=000030b0000030008000000000000a81]
I0531 10:17:25.502125 30051 catalog_loaders.cc:92] Loaded metadata for table pg_proc_proname_args_nsp_index [id=000030b0000030008000000000000a83]
I0531 10:17:25.502154 30051 catalog_loaders.cc:92] Loaded metadata for table pg_rewrite_rel_rulename_index [id=000030b0000030008000000000000a85]
I0531 10:17:25.502188 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger_tgconstraint_index [id=000030b0000030008000000000000a8b]
I0531 10:17:25.502218 30051 catalog_loaders.cc:92] Loaded metadata for table pg_trigger_tgrelid_tgname_index [id=000030b0000030008000000000000a8d]
I0531 10:17:25.502246 30051 catalog_loaders.cc:92] Loaded metadata for table pg_type_typname_nsp_index [id=000030b0000030008000000000000a90]
I0531 10:17:25.502274 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opfamily [id=000030b0000030008000000000000ac1]
I0531 10:17:25.502306 30051 catalog_loaders.cc:92] Loaded metadata for table pg_opfamily_am_name_nsp_index [id=000030b0000030008000000000000ac2]
I0531 10:17:25.502336 30051 catalog_loaders.cc:92] Loaded metadata for table pg_largeobject_metadata [id=000030b0000030008000000000000bb3]
I0531 10:17:25.502377 30051 catalog_loaders.cc:92] Loaded metadata for table pg_extension [id=000030b0000030008000000000000c07]
I0531 10:17:25.502408 30051 catalog_loaders.cc:92] Loaded metadata for table pg_extension_name_index [id=000030b0000030008000000000000c09]
I0531 10:17:25.502441 30051 catalog_loaders.cc:92] Loaded metadata for table pg_foreign_table [id=000030b0000030008000000000000c2e]
I0531 10:17:25.502472 30051 catalog_loaders.cc:92] Loaded metadata for table pg_collation_name_enc_nsp_index [id=000030b0000030008000000000000c5c]
I0531 10:17:25.502503 30051 catalog_loaders.cc:92] Loaded metadata for table pg_policy [id=000030b0000030008000000000000cb8]
I0531 10:17:25.502532 30051 catalog_loaders.cc:92] Loaded metadata for table pg_policy_polrelid_polname_index [id=000030b0000030008000000000000cba]
I0531 10:17:25.502560 30051 catalog_loaders.cc:92] Loaded metadata for table pg_partitioned_table [id=000030b0000030008000000000000d16]
I0531 10:17:25.502588 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext_relid_index [id=000030b0000030008000000000000d33]
I0531 10:17:25.502621 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext [id=000030b0000030008000000000000d35]
I0531 10:17:25.502650 30051 catalog_loaders.cc:92] Loaded metadata for table pg_init_privs [id=000030b0000030008000000000000d42]
I0531 10:17:25.502677 30051 catalog_loaders.cc:92] Loaded metadata for table pg_class_tblspc_relfilenode_index [id=000030b0000030008000000000000d7f]
I0531 10:17:25.502707 30051 catalog_loaders.cc:92] Loaded metadata for table pg_collation [id=000030b0000030008000000000000d80]
I0531 10:17:25.502733 30051 catalog_loaders.cc:92] Loaded metadata for table pg_event_trigger [id=000030b0000030008000000000000d8a]
I0531 10:17:25.502760 30051 catalog_loaders.cc:92] Loaded metadata for table pg_event_trigger_evtname_index [id=000030b0000030008000000000000d8b]
I0531 10:17:25.502789 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum [id=000030b0000030008000000000000dad]
I0531 10:17:25.502816 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum_typid_label_index [id=000030b0000030008000000000000daf]
I0531 10:17:25.502848 30051 catalog_loaders.cc:92] Loaded metadata for table pg_enum_typid_sortorder_index [id=000030b0000030008000000000000dce]
I0531 10:17:25.502940 30051 catalog_loaders.cc:92] Loaded metadata for table pg_range [id=000030b0000030008000000000000dd5]
I0531 10:17:25.502977 30051 catalog_loaders.cc:92] Loaded metadata for table pg_transform_type_lang_index [id=000030b0000030008000000000000df7]
I0531 10:17:25.503007 30051 catalog_loaders.cc:92] Loaded metadata for table pg_transform [id=000030b0000030008000000000000df8]
I0531 10:17:25.503036 30051 catalog_loaders.cc:92] Loaded metadata for table pg_seclabel [id=000030b0000030008000000000000e0c]
I0531 10:17:25.503072 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_dict [id=000030b0000030008000000000000e10]
I0531 10:17:25.503108 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_parser [id=000030b0000030008000000000000e11]
I0531 10:17:25.503137 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config [id=000030b0000030008000000000000e12]
I0531 10:17:25.503170 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config_map [id=000030b0000030008000000000000e13]
I0531 10:17:25.503203 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_dict_dictname_index [id=000030b0000030008000000000000e14]
I0531 10:17:25.503234 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_parser_prsname_index [id=000030b0000030008000000000000e16]
I0531 10:17:25.503265 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_config_cfgname_index [id=000030b0000030008000000000000e18]
I0531 10:17:25.503301 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_template [id=000030b0000030008000000000000eb4]
I0531 10:17:25.503345 30051 catalog_loaders.cc:92] Loaded metadata for table pg_ts_template_tmplname_index [id=000030b0000030008000000000000eb6]
I0531 10:17:25.503423 30051 catalog_loaders.cc:92] Loaded metadata for table pg_statistic_ext_name_index [id=000030b0000030008000000000000f9d]
I0531 10:17:25.503456 30051 catalog_loaders.cc:92] Loaded metadata for table pg_subscription_rel [id=000030b00000300080000000000017d6]
I0531 10:17:25.503485 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication [id=000030b00000300080000000000017d8]
I0531 10:17:25.503512 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_rel [id=000030b00000300080000000000017da]
I0531 10:17:25.503540 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_pubname_index [id=000030b00000300080000000000017df]
I0531 10:17:25.503569 30051 catalog_loaders.cc:92] Loaded metadata for table pg_publication_rel_prrelid_prpubid_index [id=000030b00000300080000000000017e1]
I0531 10:17:25.503602 30051 catalog_loaders.cc:92] Loaded metadata for table pg_tablegroup [id=000030b0000030008000000000001f40]
I0531 10:17:25.503633 30051 catalog_loaders.cc:92] Loaded metadata for table sql_features [id=000030b0000030008000000000003033]
I0531 10:17:25.503661 30051 catalog_loaders.cc:92] Loaded metadata for table sql_implementation_info [id=000030b0000030008000000000003035]
I0531 10:17:25.503696 30051 catalog_loaders.cc:92] Loaded metadata for table sql_languages [id=000030b0000030008000000000003037]
I0531 10:17:25.503733 30051 catalog_loaders.cc:92] Loaded metadata for table sql_packages [id=000030b0000030008000000000003039]
I0531 10:17:25.503762 30051 catalog_loaders.cc:92] Loaded metadata for table sql_parts [id=000030b000003000800000000000303b]
I0531 10:17:25.503790 30051 catalog_loaders.cc:92] Loaded metadata for table sql_sizing [id=000030b000003000800000000000303d]
I0531 10:17:25.503818 30051 catalog_loaders.cc:92] Loaded metadata for table sql_sizing_profiles [id=000030b000003000800000000000303f]
I0531 10:17:25.503902 30051 catalog_loaders.cc:92] Loaded metadata for table local [id=0d69fee8638f47e0b62d2c085835b07c]
I0531 10:17:25.503950 30051 catalog_loaders.cc:92] Loaded metadata for table role_permissions [id=1475c26c76c74278bff6c2477786480c]
I0531 10:17:25.503985 30051 catalog_loaders.cc:92] Loaded metadata for table peers [id=1cfe968aa07d424889a48922bcb153c4]
I0531 10:17:25.504014 30051 catalog_loaders.cc:92] Loaded metadata for table resource_role_permissions_index [id=2a9f5dab94b64d9d983fa395c0cb1e48]
I0531 10:17:25.504042 30051 catalog_loaders.cc:92] Loaded metadata for table triggers [id=34c096cfd2174f45ae7011170ec32765]
I0531 10:17:25.504070 30051 catalog_loaders.cc:92] Loaded metadata for table keyspaces [id=49e8b872a6d142eca630d901d89e65aa]
I0531 10:17:25.504101 30051 catalog_loaders.cc:92] Loaded metadata for table aggregates [id=5269b13dd1ac4c16b357a3fe326357bd]
I0531 10:17:25.504137 30051 catalog_loaders.cc:92] Loaded metadata for table types [id=599018608be84b53b25f83c28f1a6498]
I0531 10:17:25.504194 30051 catalog_loaders.cc:92] Loaded metadata for table tables [id=6e5c5c8869134527a176974232ad7989]
I0531 10:17:25.504232 30051 catalog_loaders.cc:92] Loaded metadata for table partitions [id=97dad0817ee5465089ff3f88460920a5]
I0531 10:17:25.504262 30051 catalog_loaders.cc:92] Loaded metadata for table columns [id=9a638a734e0940f898af898403598d6d]
I0531 10:17:25.504298 30051 catalog_loaders.cc:92] Loaded metadata for table size_estimates [id=b23faece77c24665b2f915ad502e7880]
I0531 10:17:25.504328 30051 catalog_loaders.cc:92] Loaded metadata for table roles [id=b86f2ac7f3244c1386bfd2d9bd0d09b8]
I0531 10:17:25.504369 30051 catalog_loaders.cc:92] Loaded metadata for table views [id=e277cbbfc3244758816715414ec3544b]
I0531 10:17:25.504407 30051 catalog_loaders.cc:92] Loaded metadata for table functions [id=f0eeb651b85f4d66bac1c7ef671d1457]
I0531 10:17:25.504438 30051 catalog_loaders.cc:92] Loaded metadata for table indexes [id=ff07d346d0004008945d083133e5a93a]
I0531 10:17:25.504467 30051 catalog_loaders.cc:92] Loaded metadata for table sys.catalog [id=sys.catalog.uuid]
I0531 10:17:25.504549 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading tablets into memory.
I0531 10:17:25.505396 30051 catalog_loaders.cc:229] Loaded metadata for tablet 00000000000000000000000000000000 (first table sys.catalog [id=sys.catalog.uuid])
I0531 10:17:25.505456 30051 catalog_loaders.cc:229] Loaded metadata for tablet 063619f36ae7469e9616b1c0b27d0280 (first table aggregates [id=5269b13dd1ac4c16b357a3fe326357bd])
I0531 10:17:25.505486 30051 catalog_loaders.cc:229] Loaded metadata for tablet 0a090d414e824fe88e4c5f54adefe150 (first table columns [id=9a638a734e0940f898af898403598d6d])
I0531 10:17:25.505520 30051 catalog_loaders.cc:229] Loaded metadata for tablet 4e02286861f142088a37581bf9339066 (first table resource_role_permissions_index [id=2a9f5dab94b64d9d983fa395c0cb1e48])
I0531 10:17:25.505549 30051 catalog_loaders.cc:229] Loaded metadata for tablet 4ecbe85d836745c9bbcbd6041fcb18cc (first table keyspaces [id=49e8b872a6d142eca630d901d89e65aa])
I0531 10:17:25.505578 30051 catalog_loaders.cc:229] Loaded metadata for tablet 5c3cdfc7a972416da3d17bc812b2a6e0 (first table views [id=e277cbbfc3244758816715414ec3544b])
I0531 10:17:25.505604 30051 catalog_loaders.cc:229] Loaded metadata for tablet 5c96deb4935e4c1fb62a1f3788ec188b (first table roles [id=b86f2ac7f3244c1386bfd2d9bd0d09b8])
I0531 10:17:25.505630 30051 catalog_loaders.cc:229] Loaded metadata for tablet 68dac5a341db4c0eb065609037ed5c95 (first table size_estimates [id=b23faece77c24665b2f915ad502e7880])
I0531 10:17:25.505654 30051 catalog_loaders.cc:229] Loaded metadata for tablet 722674d6ffb04c3199002d9610353086 (first table triggers [id=34c096cfd2174f45ae7011170ec32765])
I0531 10:17:25.505681 30051 catalog_loaders.cc:229] Loaded metadata for tablet 745f0a27f82d4aceb65ee22aa6ac336a (first table indexes [id=ff07d346d0004008945d083133e5a93a])
I0531 10:17:25.505708 30051 catalog_loaders.cc:229] Loaded metadata for tablet 7e9e40916f2b4704a8c311146bdc2a27 (first table partitions [id=97dad0817ee5465089ff3f88460920a5])
I0531 10:17:25.505734 30051 catalog_loaders.cc:229] Loaded metadata for tablet 8600c9ef029847ae938a5bbb62fba0d1 (first table role_permissions [id=1475c26c76c74278bff6c2477786480c])
I0531 10:17:25.505760 30051 catalog_loaders.cc:229] Loaded metadata for tablet a1bc0bfa6f5049eea1185f247b0cd857 (first table peers [id=1cfe968aa07d424889a48922bcb153c4])
I0531 10:17:25.505785 30051 catalog_loaders.cc:229] Loaded metadata for tablet a928654e48a64fd0b693583ef42889f6 (first table tables [id=6e5c5c8869134527a176974232ad7989])
I0531 10:17:25.505811 30051 catalog_loaders.cc:229] Loaded metadata for tablet d05309c567c44ec28eedacb0b7d5c5ea (first table functions [id=f0eeb651b85f4d66bac1c7ef671d1457])
I0531 10:17:25.505842 30051 catalog_loaders.cc:229] Loaded metadata for tablet de9b07ed4a864b309499a7df50c1d81b (first table types [id=599018608be84b53b25f83c28f1a6498])
I0531 10:17:25.505882 30051 catalog_loaders.cc:229] Loaded metadata for tablet eb7359c72930411babeaf0f70ca4d3b3 (first table local [id=0d69fee8638f47e0b62d2c085835b07c])
I0531 10:17:25.505915 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading namespaces into memory.
I0531 10:17:25.506181 30051 catalog_loaders.cc:277] Loaded metadata for namespace system [id=00000000000000000000000000000001]
I0531 10:17:25.506219 30051 catalog_loaders.cc:277] Loaded metadata for namespace system_schema [id=00000000000000000000000000000002]
I0531 10:17:25.506239 30051 catalog_loaders.cc:277] Loaded metadata for namespace system_auth [id=00000000000000000000000000000003]
I0531 10:17:25.506263 30051 catalog_loaders.cc:277] Loaded metadata for namespace template1 [id=00000001000030008000000000000000]
I0531 10:17:25.506286 30051 catalog_loaders.cc:277] Loaded metadata for namespace template0 [id=000030ac000030008000000000000000]
I0531 10:17:25.506309 30051 catalog_loaders.cc:277] Loaded metadata for namespace postgres [id=000030ad000030008000000000000000]
I0531 10:17:25.506330 30051 catalog_loaders.cc:277] Loaded metadata for namespace yugabyte [id=000030af000030008000000000000000]
I0531 10:17:25.506351 30051 catalog_loaders.cc:277] Loaded metadata for namespace system_platform [id=000030b0000030008000000000000000]
I0531 10:17:25.506376 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading user-defined types into memory.
I0531 10:17:25.506573 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading cluster configuration into memory.
I0531 10:17:25.506798 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading roles into memory.
I0531 10:17:25.507122 30051 catalog_loaders.cc:429] Loaded metadata for role cassandra
I0531 10:17:25.507155 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading Redis config into memory.
I0531 10:17:25.507344 30051 catalog_manager.cc:919] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Load: Loading sys config into memory.
W0531 10:17:25.507544 30051 permissions_manager.cc:1062] Multiple security configs found when loading sys catalog
I0531 10:17:25.507562 30051 catalog_loaders.cc:455] Loaded sys config type security-configuration
I0531 10:17:25.507592 30051 catalog_loaders.cc:455] Loaded sys config type ysql-catalog-configuration
I0531 10:17:25.507623 30051 catalog_manager_ent.cc:266] RunLoaders: Loading snapshots into memory.
I0531 10:17:25.507807 30051 catalog_manager_ent.cc:272] RunLoaders: Loading CDC streams into memory.
I0531 10:17:25.507995 30051 catalog_manager_ent.cc:278] RunLoaders: Loading universe replication info into memory.
I0531 10:17:25.508179 30051 catalog_manager.cc:1338] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Keyspace system [id=00000000000000000000000000000001] already created, skipping initialization
I0531 10:17:25.508191 30051 catalog_manager.cc:1338] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Keyspace system_schema [id=00000000000000000000000000000002] already created, skipping initialization
I0531 10:17:25.508198 30051 catalog_manager.cc:1338] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Keyspace system_auth [id=00000000000000000000000000000003] already created, skipping initialization
I0531 10:17:25.508278 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system.peers already created
I0531 10:17:25.508396 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system.local already created
I0531 10:17:25.508438 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system_schema.keyspaces already created
I0531 10:17:25.508499 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system_schema.tables already created
I0531 10:17:25.508559 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system_schema.columns already created
I0531 10:17:25.508617 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system.size_estimates already created
I0531 10:17:25.508671 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system_schema.aggregates already created
I0531 10:17:25.508714 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system_schema.functions already created
I0531 10:17:25.508759 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system_schema.indexes already created
I0531 10:17:25.508808 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system_schema.triggers already created
I0531 10:17:25.508875 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system_schema.views already created
I0531 10:17:25.508924 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system_schema.types already created
I0531 10:17:25.508991 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system.partitions already created
I0531 10:17:25.509032 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system_auth.roles already created
I0531 10:17:25.509064 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system_auth.role_permissions already created
I0531 10:17:25.509097 30051 catalog_manager.cc:1224] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Table system_auth.resource_role_permissions_index already created
I0531 10:17:25.509130 30051 permissions_manager.cc:85] Role cassandra already created, skipping initialization
I0531 10:17:25.509135 30051 catalog_manager.cc:982] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Cluster configuration has already been set up, skipping re-initialization.
I0531 10:17:25.509167 30051 catalog_manager.cc:882] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: YSQL is enabled, will create the transaction status table when 1 tablet servers are online
I0531 10:17:25.509177 30051 sys_catalog_initialization.cc:219] Table pg_proc exists, assuming initdb has already been run
I0531 10:17:25.510004 30051 sys_catalog_initialization.cc:314] Marking YSQL system catalog as transactional in YSQL catalog config
W0531 10:17:25.510495 30051 catalog_manager.cc:750] Time spent T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Loading metadata into memory: real 1.186s	user 0.040s	sys 0.004s
I0531 10:17:25.510521 30051 catalog_manager.cc:775] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Completed load of sys catalog in term 1
I0531 10:17:25.974288 30031 ts_manager.cc:142] Registered new tablet server { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" instance_seqno: 1622456245968049 } with Master, full list: [{bbbfb4951e4b4e3a82f1168995913c48, 0x000000000368f210 -> { permanent_uuid: bbbfb4951e4b4e3a82f1168995913c48 registration: common { private_rpc_addresses { host: "192.168.10.241" port: 9100 } http_addresses { host: "192.168.10.241" port: 9000 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } placement_uuid: "" broadcast_addresses { host: "192.168.10.241" port: 9100 } } capabilities: 2189743739 capabilities: 2980225056 placement_id: cloud1:datacenter1:rack1 }}]
I0531 10:17:25.974316 30031 catalog_manager.cc:886] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: 1 tablet servers registered, creating the transaction status table
I0531 10:17:25.974359 30031 catalog_manager.cc:3093] Creating the transaction status table
I0531 10:17:25.974404 30031 catalog_manager.cc:2404] CreateTable from internal request:
name: "transactions"
schema {
  columns {
    name: "key"
    type {
      main: BINARY
    }
    is_key: true
    is_hash_key: true
    is_nullable: false
    is_static: false
    is_counter: false
    sorting_type: 0
    order: 0
  }
}
table_type: TRANSACTION_STATUS_TABLE_TYPE
namespace {
  name: "system"
}
I0531 10:17:25.974509 30031 catalog_manager.cc:2569] Setting default tablets to 1 with 1 primary servers
I0531 10:17:25.974529 30031 partition.cc:511] Creating partitions with num_tablets: 1
I0531 10:17:25.974560 30031 catalog_manager.cc:2644] CreateTable with IndexInfo 
I0531 10:17:25.975781 30031 catalog_manager.cc:2887] Successfully created table transactions [id=2ab13c0ec7ab4737831446e3b417e08f] per request from internal request
I0531 10:17:25.975950 30031 catalog_manager.cc:2404] CreateTable from internal request:
name: "metrics"
schema {
  columns {
    name: "node"
    type {
      main: STRING
    }
    is_key: true
    is_hash_key: true
    is_nullable: false
    is_static: false
    is_counter: false
    sorting_type: 0
    order: 1635018093
  }
  columns {
    name: "entity_type"
    type {
      main: STRING
    }
    is_key: true
    is_nullable: false
    is_static: false
    is_counter: false
    sorting_type: 1
    order: 0
  }
  columns {
    name: "entity_id"
    type {
      main: STRING
    }
    is_key: true
    is_nullable: false
    is_static: false
    is_counter: false
    sorting_type: 1
    order: 0
  }
  columns {
    name: "metric"
    type {
      main: STRING
    }
    is_key: true
    is_nullable: false
    is_static: false
    is_counter: false
    sorting_type: 1
    order: 0
  }
  columns {
    name: "ts"
    type {
      main: TIMESTAMP
    }
    is_key: true
    is_nullable: false
    is_static: false
    is_counter: false
    sorting_type: 2
    order: 0
  }
  columns {
    name: "value"
    type {
      main: INT64
    }
    is_key: false
    is_nullable: true
    is_static: false
    is_counter: false
    sorting_type: 0
    order: 0
  }
  columns {
    name: "details"
    type {
      main: JSONB
    }
    is_key: false
    is_nullable: true
    is_static: false
    is_counter: false
    sorting_type: 0
    order: 0
  }
  table_properties {
    contain_counters: false
    is_transactional: false
    consistency_level: STRONG
    use_mangled_column_name: false
    is_ysql_catalog_table: false
    retain_delete_markers: false
  }
  colocated_table_id {
  }
}
table_type: YQL_TABLE_TYPE
namespace {
  name: "system"
}
I0531 10:17:25.975980 30031 catalog_manager.cc:2569] Setting default tablets to 1 with 1 primary servers
I0531 10:17:25.975986 30031 partition.cc:511] Creating partitions with num_tablets: 1
I0531 10:17:25.975992 30031 catalog_manager.cc:2644] CreateTable with IndexInfo 
I0531 10:17:25.977062 30031 catalog_manager.cc:2887] Successfully created table metrics [id=6ff07227360d4f8084468c356eb403a7] per request from internal request
I0531 10:17:25.977114 30031 catalog_manager.cc:903] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Finished creating transaction status table asynchronously
W0531 10:17:25.977149 30031 catalog_manager.cc:5068] Invalid tablet report from bbbfb4951e4b4e3a82f1168995913c48: Received an incremental tablet report when a full one was needed
I0531 10:17:25.994930 30046 catalog_manager.cc:5527] bbbfb4951e4b4e3a82f1168995913c48 sent full tablet report with 0 tablets.
I0531 10:17:26.041014 30046 catalog_manager.cc:5393] Peer bbbfb4951e4b4e3a82f1168995913c48 sent incremental report for 2758e273282d40cbafc738a424802f87, prev state op id: -1, prev state term: 0, prev state has_leader_uuid: 0. Consensus state: current_term: 0 config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }
I0531 10:17:26.041146 30046 catalog_manager.cc:8070] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Starting election at 2758e273282d40cbafc738a424802f87 in favor of bbbfb4951e4b4e3a82f1168995913c48
I0531 10:17:26.041184 30046 async_rpc_tasks.cc:567] RunLeaderElection RPC for tablet 2758e273282d40cbafc738a424802f87 on TS bbbfb4951e4b4e3a82f1168995913c48 (task=0x35d0eb0, state=kRunning): Hinted Leader start election at bbbfb4951e4b4e3a82f1168995913c48 for tablet 2758e273282d40cbafc738a424802f87, attempt 1
I0531 10:17:26.072288 30031 catalog_entity_info.cc:100] T 2758e273282d40cbafc738a424802f87: Leader changed from  to 0x000000000368f210 -> { permanent_uuid: bbbfb4951e4b4e3a82f1168995913c48 registration: common { private_rpc_addresses { host: "192.168.10.241" port: 9100 } http_addresses { host: "192.168.10.241" port: 9000 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } placement_uuid: "" broadcast_addresses { host: "192.168.10.241" port: 9100 } } capabilities: 2189743739 capabilities: 2980225056 placement_id: cloud1:datacenter1:rack1 }
I0531 10:17:26.072316 30031 catalog_manager.cc:5382] Tablet: 2758e273282d40cbafc738a424802f87 reported consensus state change. New consensus state: current_term: 1 leader_uuid: "bbbfb4951e4b4e3a82f1168995913c48" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } } from bbbfb4951e4b4e3a82f1168995913c48
I0531 10:17:26.074476 30031 catalog_manager.cc:5393] Peer bbbfb4951e4b4e3a82f1168995913c48 sent incremental report for 3f5467ab4801483ca1ae24b99504ada3, prev state op id: -1, prev state term: 0, prev state has_leader_uuid: 0. Consensus state: current_term: 0 config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }
I0531 10:17:26.074575 30031 catalog_manager.cc:8070] T 00000000000000000000000000000000 P 4def1fb8aab846efafe961628c995dda: Starting election at 3f5467ab4801483ca1ae24b99504ada3 in favor of bbbfb4951e4b4e3a82f1168995913c48
I0531 10:17:26.074595 30031 async_rpc_tasks.cc:567] RunLeaderElection RPC for tablet 3f5467ab4801483ca1ae24b99504ada3 on TS bbbfb4951e4b4e3a82f1168995913c48 (task=0x44de010, state=kRunning): Hinted Leader start election at bbbfb4951e4b4e3a82f1168995913c48 for tablet 3f5467ab4801483ca1ae24b99504ada3, attempt 1
I0531 10:17:26.082828 30046 catalog_entity_info.cc:100] T 3f5467ab4801483ca1ae24b99504ada3: Leader changed from  to 0x000000000368f210 -> { permanent_uuid: bbbfb4951e4b4e3a82f1168995913c48 registration: common { private_rpc_addresses { host: "192.168.10.241" port: 9100 } http_addresses { host: "192.168.10.241" port: 9000 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } placement_uuid: "" broadcast_addresses { host: "192.168.10.241" port: 9100 } } capabilities: 2189743739 capabilities: 2980225056 placement_id: cloud1:datacenter1:rack1 }
I0531 10:17:26.082851 30046 catalog_manager.cc:5382] Tablet: 3f5467ab4801483ca1ae24b99504ada3 reported consensus state change. New consensus state: current_term: 1 leader_uuid: "bbbfb4951e4b4e3a82f1168995913c48" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } } from bbbfb4951e4b4e3a82f1168995913c48
I0531 10:17:31.245121 30036 server_base.cc:222] Running on host: localhost.yunk
I0531 10:17:31.245292 30036 server_base.cc:234] Logged in user: root
I0531 10:17:31.245330 30036 call_home.cc:399] Done with collector BasicCollector
I0531 10:17:31.245644 30036 call_home.cc:399] Done with collector MasterInfoCollector
I0531 10:17:31.245667 30036 call_home.cc:399] Done with collector TServersInfoCollector
I0531 10:17:31.245910 30036 call_home.cc:399] Done with collector TablesCollector
I0531 10:17:31.245918 30036 call_home.cc:399] Done with collector TabletsCollector
I0531 10:17:31.245923 30036 call_home.cc:111] Skipping collector MetricsCollector because it has a higher collection level than the requested one
I0531 10:17:31.245926 30036 call_home.cc:111] Skipping collector RpcsCollector because it has a higher collection level than the requested one
I0531 10:17:31.247607 30036 call_home.cc:399] Done with collector GFlagsCollector
I0531 10:18:36.222651 30023 reactor.cc:450] Master_R001: DEBUG: Closing idle connection: Connection (0x0000000004ae4250) server 192.168.10.241:53954 => 192.168.10.241:7100 - it has been idle for 65s
I0531 10:18:36.322962 30022 reactor.cc:450] Master_R000: DEBUG: Closing idle connection: Connection (0x00000000030ebe70) server 192.168.10.241:56231 => 192.168.10.241:7100 - it has been idle for 65.1s
I0531 10:18:39.463973 30337 webserver.cc:333] Webserver: error reading: Resource temporarily unavailable
I0531 10:19:02.922621 30022 reactor.cc:450] Master_R000: DEBUG: Closing idle connection: Connection (0x00000000030eb7b0) server 192.168.10.241:46452 => 192.168.10.241:7100 - it has been idle for 65s
I0531 10:19:02.922621 30023 reactor.cc:450] Master_R001: DEBUG: Closing idle connection: Connection (0x00000000030ea5b0) server 192.168.10.241:35980 => 192.168.10.241:7100 - it has been idle for 65s
I0531 10:19:06.422540 30023 reactor.cc:450] Master_R001: DEBUG: Closing idle connection: Connection (0x00000000030eb0f0) server 192.168.10.241:58114 => 192.168.10.241:7100 - it has been idle for 65s
I0531 10:19:06.422619 30022 reactor.cc:450] Master_R000: DEBUG: Closing idle connection: Connection (0x0000000002d93450) server 192.168.10.241:55058 => 192.168.10.241:7100 - it has been idle for 65s
I0531 10:19:11.423043 30022 reactor.cc:450] Master_R000: DEBUG: Closing idle connection: Connection (0x00000000030ebb10) server 192.168.10.241:38122 => 192.168.10.241:7100 - it has been idle for 65.001s
I0531 10:19:11.423167 30022 reactor.cc:450] Master_R000: DEBUG: Closing idle connection: Connection (0x00000000030ebc30) server 192.168.10.241:35142 => 192.168.10.241:7100 - it has been idle for 65.001s
I0531 10:21:38.027002 30023 reactor.cc:450] Master_R001: DEBUG: Closing idle connection: Connection (0x0000000002d93570) server 192.168.10.241:39367 => 192.168.10.241:7100 - it has been idle for 65.004s
I0531 10:21:38.027081 30023 reactor.cc:450] Master_R001: DEBUG: Closing idle connection: Connection (0x000000000496f8d0) server 192.168.10.241:36220 => 192.168.10.241:7100 - it has been idle for 65.004s
I0531 10:21:38.122987 30023 reactor.cc:450] Master_R001: DEBUG: Closing idle connection: Connection (0x000000000496f690) server 192.168.10.241:35741 => 192.168.10.241:7100 - it has been idle for 65.001s
I0531 10:21:38.123067 30022 reactor.cc:450] Master_R000: DEBUG: Closing idle connection: Connection (0x000000000496f570) server 192.168.10.241:40444 => 192.168.10.241:7100 - it has been idle for 65.001s
```

```log 192.168.10.241:9000  /home/ykdl/db/disk/data/yb-data/tserver/logs/yb-tserver.INFO
Log file created at: 2021/05/31 10:17:25
Running on machine: localhost.yunk
Application fingerprint: version 2.5.3.1 build 10 revision 1d86b4cd1ee9cb675feee7df8fadd8d811ea0e45 build_type RELEASE built at 16 Mar 2021 17:59:44 UTC
Running duration (h:mm:ss): 0:00:00
Log line format: [IWEF]mmdd hh:mm:ss.uuuuuu threadid file:line] msg
I0531 10:17:25.956037 30063 tablet_server_main.cc:176] NumCPUs determined to be: 2
I0531 10:17:25.956336 30063 tablet_server_main.cc:186] Setting tcmalloc max thread cache bytes to: 268435456
I0531 10:17:25.956367 30063 tablet_server_main.cc:140] Using parsed rpc = 192.168.10.241:9100
I0531 10:17:25.956450 30063 tablet_server_main.cc:133] Reset YEDIS bind address to 192.168.10.241:6379
I0531 10:17:25.956548 30063 server_base_options.cc:137] Updating master addrs to {192.168.10.241:7100}
I0531 10:17:25.956593 30063 server_base_options.cc:137] Updating master addrs to {192.168.10.241:7100}
I0531 10:17:25.956720 30063 mem_tracker.cc:249] MemTracker: hard memory limit is 4.583803 GB
I0531 10:17:25.956732 30063 mem_tracker.cc:251] MemTracker: soft memory limit is 3.896232 GB
I0531 10:17:25.956909 30063 server_base_options.cc:137] Updating master addrs to {192.168.10.241:7100}
I0531 10:17:25.957937 30063 server_base_options.cc:137] Updating master addrs to {192.168.10.241:7100}
I0531 10:17:25.959183 30063 shared_mem.cc:152] Using directory /dev/shm to store shared memory objects
I0531 10:17:25.959421 30063 rpc_server.cc:86] yb::server::RpcServer created at 0x21e80b0
I0531 10:17:25.959439 30063 tablet_server.cc:151] yb::tserver::TabletServer created at 0x23f0000
I0531 10:17:25.959457 30063 tablet_server.cc:152] yb::tserver::TSTabletManager created at 0x254b180
I0531 10:17:25.959475 30063 encrypted_file_factory.cc:66] Created encrypted file factory
I0531 10:17:25.959496 30063 tablet_server_main.cc:208] Initializing tablet server...
I0531 10:17:25.961225 30063 server_base.cc:468] Could not load existing FS layout: Not found (yb/util/env_posix.cc:1514): /home/ykdl/db/disk/data/yb-data/tserver/instance: No such file or directory (system error 2)
I0531 10:17:25.961237 30063 server_base.cc:469] Creating new FS layout
I0531 10:17:25.963001 30063 fs_manager.cc:463] Generated new instance metadata in path /home/ykdl/db/disk/data/yb-data/tserver/instance:
uuid: "bbbfb4951e4b4e3a82f1168995913c48"
format_stamp: "Formatted at 2021-05-31 10:17:25 on localhost.yunk"
I0531 10:17:25.963515 30063 fs_manager.cc:251] Opened local filesystem: /home/ykdl/db/disk/data
uuid: "bbbfb4951e4b4e3a82f1168995913c48"
format_stamp: "Formatted at 2021-05-31 10:17:25 on localhost.yunk"
I0531 10:17:25.963755 30063 server_base.cc:251] Auto setting FLAGS_num_reactor_threads to 2
I0531 10:17:25.964429 30063 thread_pool.cc:171] Starting thread pool { name: TabletServer queue_limit: 10000 max_workers: 1024 }
I0531 10:17:25.965328 30063 server_base_options.cc:137] Updating master addrs to {192.168.10.241:7100}
I0531 10:17:25.965534 30063 ts_tablet_manager.cc:573] P bbbfb4951e4b4e3a82f1168995913c48: max_bootstrap_threads=2
I0531 10:17:25.965641 30063 server_base.cc:517] Using private rpc address 192.168.10.241
I0531 10:17:25.965677 30063 ts_tablet_manager.cc:623] Loaded metadata for 0 tablet in 0 ms
I0531 10:17:25.965847 30063 tablet_server_main.cc:210] Starting tablet server...
I0531 10:17:25.965893 30063 ulimit_util.cc:214] Configured soft limit for cpu time is already larger than specified min value (unlimited vs. unlimited). Skipping.
I0531 10:17:25.965899 30063 ulimit_util.cc:214] Configured soft limit for file size is already larger than specified min value (unlimited vs. unlimited). Skipping.
I0531 10:17:25.965903 30063 ulimit_util.cc:214] Configured soft limit for data seg size is already larger than specified min value (unlimited vs. unlimited). Skipping.
I0531 10:17:25.965909 30063 ulimit_util.cc:214] Configured soft limit for stack size is already larger than specified min value (8388608 vs. 8388608). Skipping.
I0531 10:17:25.965914 30063 ulimit_util.cc:214] Configured soft limit for max user processes is already larger than specified min value (31167 vs. 12000). Skipping.
I0531 10:17:25.965929 30063 env_posix.cc:1445] Modifying limit for open files from 1024 to 4096
I0531 10:17:25.965942 30063 ulimit_util.cc:214] Configured soft limit for max locked memory is already larger than specified min value (65536 vs. 65536). Skipping.
I0531 10:17:25.965947 30063 ulimit_util.cc:214] Configured soft limit for max memory size is already larger than specified min value (unlimited vs. unlimited). Skipping.
I0531 10:17:25.965967 30063 tablet_server_main.cc:212] ulimit cur(max)...
ulimit: core file size 0(unlimited) blks
ulimit: data seg size unlimited(unlimited) kb
ulimit: open files 4096(4096)
ulimit: file size unlimited(unlimited) blks
ulimit: pending signals 31167(31167)
ulimit: file locks unlimited(unlimited)
ulimit: max locked memory 64(64) kb
ulimit: max memory size unlimited(unlimited) kb
ulimit: stack size 8192(unlimited) kb
ulimit: cpu time unlimited(unlimited) secs
ulimit: max user processes 31167(31167)
I0531 10:17:25.965974 30063 tablet_server.cc:279] Auto setting FLAGS_tablet_server_svc_num_threads to 64
I0531 10:17:25.965978 30063 tablet_server.cc:288] Auto setting FLAGS_ts_consensus_svc_num_threads to 64
I0531 10:17:25.966127 30063 service_pool.cc:148] yb.tserver.TabletServerBackupService: yb::rpc::ServicePoolImpl created at 0x21ecb40
I0531 10:17:25.966380 30086 async_initializer.cc:82] Starting to init ybclient
I0531 10:17:25.966413 30063 service_pool.cc:148] yb.cdc.CDCService: yb::rpc::ServicePoolImpl created at 0x21ecd80
I0531 10:17:25.966500 30086 client-internal.cc:2252] New master addresses: [192.168.10.241:7100]
I0531 10:17:25.966643 30063 tablet_server.cc:295] yb::tserver::TabletServiceImpl created at 0x2271180
I0531 10:17:25.966668 30063 service_pool.cc:148] yb.tserver.TabletServerService: yb::rpc::ServicePoolImpl created at 0x21ecfc0
I0531 10:17:25.966804 30063 tablet_server.cc:301] yb::tserver::TabletServiceAdminImpl created at 0x257f5f0
I0531 10:17:25.966825 30063 service_pool.cc:148] yb.tserver.TabletServerAdminService: yb::rpc::ServicePoolImpl created at 0x21ed200
I0531 10:17:25.966951 30063 tablet_server.cc:307] yb::tserver::ConsensusServiceImpl created at 0x2279440
I0531 10:17:25.966975 30063 thread_pool.cc:171] Starting thread pool { name: TabletServer-high-pri queue_limit: 10000 max_workers: 1024 }
I0531 10:17:25.966984 30063 service_pool.cc:148] yb.consensus.ConsensusService: yb::rpc::ServicePoolImpl created at 0x21ed680
I0531 10:17:25.967988 30063 tablet_server.cc:315] yb::tserver::RemoteBootstrapServiceImpl created at 0x21fd200
I0531 10:17:25.968024 30063 service_pool.cc:148] yb.tserver.RemoteBootstrapService: yb::rpc::ServicePoolImpl created at 0x21edb00
I0531 10:17:25.968132 30063 webserver.cc:158] Starting webserver on 192.168.10.241:9000
I0531 10:17:25.968140 30063 webserver.cc:163] Document root: /home/ykdl/yugabyte-2.5.3.1/www
I0531 10:17:25.968273 30063 webserver.cc:153] Webserver listen spec is 192.168.10.241:9000
I0531 10:17:25.968608 30063 webserver.cc:252] Webserver started. Bound to: http://192.168.10.241:9000/
I0531 10:17:25.968720 30063 service_pool.cc:148] yb.server.GenericService: yb::rpc::ServicePoolImpl created at 0x21edd40
I0531 10:17:25.968875 30063 rpc_server.cc:169] RPC server started. Bound to: 192.168.10.241:9100
I0531 10:17:25.970176 30063 server_base.cc:330] Dumped server information to /home/ykdl/db/disk/data/tserver-info
I0531 10:17:25.970286 30091 async_initializer.cc:82] Starting to init ybclient
I0531 10:17:25.970301 30063 ts_tablet_manager.cc:687] Split tablets cleanup monitor started...
I0531 10:17:25.970324 30091 client-internal.cc:2252] New master addresses: [192.168.10.241:7100]
I0531 10:17:25.970764 30093 async_initializer.cc:82] Starting to init ybclient
I0531 10:17:25.970800 30093 client-internal.cc:2252] New master addresses: [192.168.10.241:7100]
I0531 10:17:25.971146 30063 tablet_server_main.cc:214] Tablet server successfully started.
I0531 10:17:25.971628 30063 pg_wrapper.cc:399] Launching initdb: [/home/ykdl/yugabyte-2.5.3.1/postgres/bin/initdb, -D, /home/ykdl/db/disk/data/pg_data, -U, postgres]
I0531 10:17:25.973331 30092 heartbeater.cc:302] P bbbfb4951e4b4e3a82f1168995913c48: Connected to a leader master server at 192.168.10.241:7100
I0531 10:17:25.973460 30092 heartbeater.cc:350] P bbbfb4951e4b4e3a82f1168995913c48: Registering TS with master...
I0531 10:17:25.973496 30092 server_base.cc:517] Using private rpc address 192.168.10.241
I0531 10:17:25.973523 30092 server_base.cc:539] Using http address 192.168.10.241
I0531 10:17:25.983952 30092 heartbeater.cc:359] P bbbfb4951e4b4e3a82f1168995913c48: Sending a full tablet report to master...
I0531 10:17:25.997699 30100 tablet_service.cc:1136] Processing CreateTablet for tablet 3f5467ab4801483ca1ae24b99504ada3 (table=transactions [id=2ab13c0ec7ab4737831446e3b417e08f]), partition=hash_split: [0x0000, 0xFFFF)
I0531 10:17:25.997799 30100 ts_tablet_manager.cc:2152] Get and update data/wal directory assignment map for table: 2ab13c0ec7ab4737831446e3b417e08f and tablet 3f5467ab4801483ca1ae24b99504ada3
I0531 10:17:25.999316 30100 ts_tablet_manager.cc:806] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Created tablet metadata for table: 2ab13c0ec7ab4737831446e3b417e08f
I0531 10:17:25.999423 30100 consensus_meta.cc:282] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from UNKNOWN_ROLE to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.000043 30101 tablet_service.cc:1136] Processing CreateTablet for tablet 2758e273282d40cbafc738a424802f87 (table=metrics [id=6ff07227360d4f8084468c356eb403a7]), partition=hash_split: [0x0000, 0xFFFF)
I0531 10:17:26.000067 30101 ts_tablet_manager.cc:2152] Get and update data/wal directory assignment map for table: 6ff07227360d4f8084468c356eb403a7 and tablet 2758e273282d40cbafc738a424802f87
I0531 10:17:26.000160 30100 ts_tablet_manager.cc:1716] P bbbfb4951e4b4e3a82f1168995913c48: Registered tablet 3f5467ab4801483ca1ae24b99504ada3
I0531 10:17:26.000475 30102 ts_tablet_manager.cc:1452] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Bootstrapping tablet
I0531 10:17:26.000526 30102 tablet_peer.cc:1212] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [state=BOOTSTRAPPING]: Changed state from NOT_STARTED to BOOTSTRAPPING
I0531 10:17:26.000797 30102 consensus_meta.cc:282] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from UNKNOWN_ROLE to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.000824 30102 tablet_bootstrap_if.cc:79] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Bootstrap starting.
I0531 10:17:26.000969 30102 tablet.cc:451] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Schema version for transactions is 0
I0531 10:17:26.001199 30102 tablet_bootstrap.cc:608] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Time spent opening tablet: real 0.000s	user 0.000s	sys 0.000s
I0531 10:17:26.001325 30102 tablet_bootstrap.cc:533] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: No blocks or log segments found. Creating new log.
I0531 10:17:26.001426 30102 log.cc:1040] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Setting log wal retention time to 0 seconds
I0531 10:17:26.001557 30102 log.cc:567] interval_durable_wal_write_ms is turned on to sync every 1000 ms.
I0531 10:17:26.002022 30102 tablet_bootstrap_if.cc:79] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: No bootstrap required, opened a new log
I0531 10:17:26.002055 30102 log.cc:1040] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Setting log wal retention time to 0 seconds
I0531 10:17:26.002086 30102 ts_tablet_manager.cc:1459] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Time spent bootstrapping tablet: real 0.002s	user 0.001s	sys 0.000s
I0531 10:17:26.002282 30102 consensus_meta.cc:282] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from UNKNOWN_ROLE to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.005309 30101 ts_tablet_manager.cc:806] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Created tablet metadata for table: 6ff07227360d4f8084468c356eb403a7
I0531 10:17:26.005350 30101 consensus_meta.cc:282] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from UNKNOWN_ROLE to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.010018 30101 ts_tablet_manager.cc:1716] P bbbfb4951e4b4e3a82f1168995913c48: Registered tablet 2758e273282d40cbafc738a424802f87
I0531 10:17:26.012889 30103 ts_tablet_manager.cc:1452] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Bootstrapping tablet
I0531 10:17:26.012914 30103 tablet_peer.cc:1212] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [state=BOOTSTRAPPING]: Changed state from NOT_STARTED to BOOTSTRAPPING
I0531 10:17:26.013147 30103 consensus_meta.cc:282] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from UNKNOWN_ROLE to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.013166 30103 tablet_bootstrap_if.cc:79] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Bootstrap starting.
I0531 10:17:26.013201 30103 tablet.cc:451] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Schema version for metrics is 0
I0531 10:17:26.013403 30103 docdb_rocksdb_util.cc:277] Auto setting FLAGS_rocksdb_max_background_flushes to 1
I0531 10:17:26.013427 30103 docdb_rocksdb_util.cc:300] Auto setting FLAGS_rocksdb_max_background_compactions to 1
I0531 10:17:26.013430 30103 docdb_rocksdb_util.cc:311] Auto setting FLAGS_rocksdb_base_background_compactions to 1
I0531 10:17:26.013434 30103 docdb_rocksdb_util.cc:334] Auto setting FLAGS_priority_thread_pool_size to 1
I0531 10:17:26.013612 30103 tablet.cc:577] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Creating RocksDB database in dir /home/ykdl/db/disk/data/yb-data/tserver/data/rocksdb/table-6ff07227360d4f8084468c356eb403a7/tablet-2758e273282d40cbafc738a424802f87
I0531 10:17:26.014206 30103 tablet.cc:735] Opening RocksDB at: /home/ykdl/db/disk/data/yb-data/tserver/data/rocksdb/table-6ff07227360d4f8084468c356eb403a7/tablet-2758e273282d40cbafc738a424802f87
I0531 10:17:26.014601 30103 db_impl.cc:770] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]: Creating manifest 1 
I0531 10:17:26.015818 30103 version_set.cc:2839] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]: Recovered from manifest file:/home/ykdl/db/disk/data/yb-data/tserver/data/rocksdb/table-6ff07227360d4f8084468c356eb403a7/tablet-2758e273282d40cbafc738a424802f87/MANIFEST-000001 succeeded,manifest_file_number is 1, next_file_number is 3, last_sequence is 1125899906842624, log_number is 0,prev_log_number is 0,max_column_family is 0, flushed_values is 
I0531 10:17:26.015831 30103 version_set.cc:2847] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]: Column family [default] (ID 0), log number is 0
I0531 10:17:26.016999 30103 tablet.cc:793] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Successfully opened a RocksDB database at /home/ykdl/db/disk/data/yb-data/tserver/data/rocksdb/table-6ff07227360d4f8084468c356eb403a7/tablet-2758e273282d40cbafc738a424802f87, obj: 0x2be2000
I0531 10:17:26.017027 30103 tablet_bootstrap.cc:608] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Time spent opening tablet: real 0.004s	user 0.002s	sys 0.002s
I0531 10:17:26.017123 30103 tablet_bootstrap.cc:533] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: No blocks or log segments found. Creating new log.
I0531 10:17:26.017159 30103 log.cc:1040] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Setting log wal retention time to 0 seconds
I0531 10:17:26.017488 30103 tablet_bootstrap_if.cc:79] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: No bootstrap required, opened a new log
I0531 10:17:26.017504 30103 log.cc:1040] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Setting log wal retention time to 0 seconds
I0531 10:17:26.017518 30103 ts_tablet_manager.cc:1459] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Time spent bootstrapping tablet: real 0.005s	user 0.002s	sys 0.002s
I0531 10:17:26.017695 30103 consensus_meta.cc:282] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from UNKNOWN_ROLE to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.017793 30103 tablet_peer.cc:922] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [state=BOOTSTRAPPING]: Setting cdc min replicated index to 9223372036854775807
I0531 10:17:26.018481 30103 consensus_meta.cc:282] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from FOLLOWER to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.018517 30103 raft_consensus.cc:425] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Replica starting. Triggering 0 pending operations. Active config: opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } }
I0531 10:17:26.018573 30103 raft_consensus.cc:455] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Consensus starting up: Expiring fail detector timer to make a prompt election more likely
I0531 10:17:26.018654 30103 raft_consensus.cc:1045] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Becoming Follower/Learner. State: Replica: bbbfb4951e4b4e3a82f1168995913c48, State: 1, Role: FOLLOWER, Watermarks: {Received: 0.0 Committed: 0.0} Leader: 0.0, new leader: , initial_fd_wait: 
I0531 10:17:26.018680 30103 consensus_meta.cc:282] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from FOLLOWER to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.018743 30103 consensus_queue.cc:274] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [NON_LEADER]: Queue going to NON_LEADER mode. State: All replicated op: 0.0, Majority replicated op: 0.0, Committed index: 0.0, Last applied: 0.0, Last appended: 0.0, Current term: 0, Majority size: -1, State: QUEUE_OPEN, Mode: NON_LEADER
I0531 10:17:26.018759 30103 raft_consensus.cc:3076] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Calling mark dirty synchronously for reason code CONSENSUS_STARTED
I0531 10:17:26.027940 30103 tablet_peer.cc:1212] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [state=RUNNING]: Changed state from BOOTSTRAPPING to RUNNING
I0531 10:17:26.039330 30103 db_impl.cc:2469] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]: SetOptions() on column family [default], inputs:
I0531 10:17:26.039341 30103 db_impl.cc:2472] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]: level0_stop_writes_trigger: 2147483647
I0531 10:17:26.039346 30103 db_impl.cc:2472] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]: level0_slowdown_writes_trigger: 2147483647
I0531 10:17:26.039350 30103 db_impl.cc:2477] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]: [default] SetOptions succeeded
I0531 10:17:26.039359 30103 mutable_cf_options.cc:83] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                         write_buffer_size: 134217728
I0531 10:17:26.039364 30103 mutable_cf_options.cc:85] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                   max_write_buffer_number: 2
I0531 10:17:26.039367 30103 mutable_cf_options.cc:87] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                          arena_block_size: 131072
I0531 10:17:26.039371 30103 mutable_cf_options.cc:89] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                memtable_prefix_bloom_bits: 0
I0531 10:17:26.039376 30103 mutable_cf_options.cc:91] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:              memtable_prefix_bloom_probes: 6
I0531 10:17:26.039379 30103 mutable_cf_options.cc:93] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:  memtable_prefix_bloom_huge_page_tlb_size: 0
I0531 10:17:26.039382 30103 mutable_cf_options.cc:95] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                     max_successive_merges: 0
I0531 10:17:26.039386 30103 mutable_cf_options.cc:97] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                            filter_deletes: 0
I0531 10:17:26.039391 30103 mutable_cf_options.cc:99] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                  disable_auto_compactions: 1
I0531 10:17:26.039394 30103 mutable_cf_options.cc:101] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:       soft_pending_compaction_bytes_limit: 0
I0531 10:17:26.039402 30103 mutable_cf_options.cc:103] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:       hard_pending_compaction_bytes_limit: 0
I0531 10:17:26.039407 30103 mutable_cf_options.cc:105] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:        level0_file_num_compaction_trigger: 5
I0531 10:17:26.039410 30103 mutable_cf_options.cc:107] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:            level0_slowdown_writes_trigger: 2147483647
I0531 10:17:26.039414 30103 mutable_cf_options.cc:109] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                level0_stop_writes_trigger: 2147483647
I0531 10:17:26.039418 30103 mutable_cf_options.cc:111] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:            max_grandparent_overlap_factor: 10
I0531 10:17:26.039422 30103 mutable_cf_options.cc:113] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                expanded_compaction_factor: 25
I0531 10:17:26.039425 30103 mutable_cf_options.cc:115] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                  source_compaction_factor: 1
I0531 10:17:26.039429 30103 mutable_cf_options.cc:117] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                     target_file_size_base: 2097152
I0531 10:17:26.039433 30103 mutable_cf_options.cc:119] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:               target_file_size_multiplier: 1
I0531 10:17:26.039436 30103 mutable_cf_options.cc:121] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                  max_bytes_for_level_base: 10485760
I0531 10:17:26.039440 30103 mutable_cf_options.cc:123] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:            max_bytes_for_level_multiplier: 10
I0531 10:17:26.039446 30103 mutable_cf_options.cc:131] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]: max_bytes_for_level_multiplier_additional: 1, 1, 1, 1, 1, 1, 1
I0531 10:17:26.039449 30103 mutable_cf_options.cc:133] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:            verify_checksums_in_compaction: 1
I0531 10:17:26.039453 30103 mutable_cf_options.cc:135] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:         max_sequential_skip_in_iterations: 8
I0531 10:17:26.039842 30103 db_impl.cc:2469] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]: SetOptions() on column family [default], inputs:
I0531 10:17:26.039853 30103 db_impl.cc:2472] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]: disable_auto_compactions: false
I0531 10:17:26.039857 30103 db_impl.cc:2477] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]: [default] SetOptions succeeded
I0531 10:17:26.039872 30103 mutable_cf_options.cc:83] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                         write_buffer_size: 134217728
I0531 10:17:26.039876 30103 mutable_cf_options.cc:85] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                   max_write_buffer_number: 2
I0531 10:17:26.039880 30103 mutable_cf_options.cc:87] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                          arena_block_size: 131072
I0531 10:17:26.039885 30103 mutable_cf_options.cc:89] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                memtable_prefix_bloom_bits: 0
I0531 10:17:26.039887 30103 mutable_cf_options.cc:91] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:              memtable_prefix_bloom_probes: 6
I0531 10:17:26.039891 30103 mutable_cf_options.cc:93] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:  memtable_prefix_bloom_huge_page_tlb_size: 0
I0531 10:17:26.039901 30103 mutable_cf_options.cc:95] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                     max_successive_merges: 0
I0531 10:17:26.039904 30103 mutable_cf_options.cc:97] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                            filter_deletes: 0
I0531 10:17:26.039907 30103 mutable_cf_options.cc:99] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                  disable_auto_compactions: 0
I0531 10:17:26.039911 30103 mutable_cf_options.cc:101] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:       soft_pending_compaction_bytes_limit: 0
I0531 10:17:26.039916 30103 mutable_cf_options.cc:103] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:       hard_pending_compaction_bytes_limit: 0
I0531 10:17:26.039919 30103 mutable_cf_options.cc:105] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:        level0_file_num_compaction_trigger: 5
I0531 10:17:26.039923 30103 mutable_cf_options.cc:107] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:            level0_slowdown_writes_trigger: 2147483647
I0531 10:17:26.039927 30103 mutable_cf_options.cc:109] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                level0_stop_writes_trigger: 2147483647
I0531 10:17:26.039930 30103 mutable_cf_options.cc:111] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:            max_grandparent_overlap_factor: 10
I0531 10:17:26.039934 30103 mutable_cf_options.cc:113] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                expanded_compaction_factor: 25
I0531 10:17:26.039938 30103 mutable_cf_options.cc:115] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                  source_compaction_factor: 1
I0531 10:17:26.039942 30103 mutable_cf_options.cc:117] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                     target_file_size_base: 2097152
I0531 10:17:26.039945 30103 mutable_cf_options.cc:119] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:               target_file_size_multiplier: 1
I0531 10:17:26.039949 30103 mutable_cf_options.cc:121] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:                  max_bytes_for_level_base: 10485760
I0531 10:17:26.039953 30103 mutable_cf_options.cc:123] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:            max_bytes_for_level_multiplier: 10
I0531 10:17:26.039958 30103 mutable_cf_options.cc:131] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]: max_bytes_for_level_multiplier_additional: 1, 1, 1, 1, 1, 1, 1
I0531 10:17:26.039963 30103 mutable_cf_options.cc:133] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:            verify_checksums_in_compaction: 1
I0531 10:17:26.039965 30103 mutable_cf_options.cc:135] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [R]:         max_sequential_skip_in_iterations: 8
I0531 10:17:26.040024 30103 tablet_peer.cc:1109] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [state=RUNNING]: Registered log gc
I0531 10:17:26.040035 30103 ts_tablet_manager.cc:1512] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Time spent starting tablet: real 0.023s	user 0.002s	sys 0.002s
I0531 10:17:26.040057 30103 ts_tablet_manager.cc:2551] Deleted transition in progress creating tablet for tablet 2758e273282d40cbafc738a424802f87
I0531 10:17:26.056978 30106 raft_consensus.cc:573] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Triggering leader pre-election, mode=ELECT_EVEN_IF_LEADER_IS_ALIVE
I0531 10:17:26.057027 30106 raft_consensus.cc:3140] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Snoozing failure detection for 3.064s
I0531 10:17:26.057065 30106 raft_consensus.cc:612] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Starting pre-election with config: opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } }
I0531 10:17:26.057132 30106 leader_election.cc:241] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [CANDIDATE]: Term 1 pre-election: Election decided. Result: candidate won.
I0531 10:17:26.057186 30074 raft_consensus.cc:3140] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Snoozing failure detection for 3.185s
I0531 10:17:26.057207 30074 raft_consensus.cc:3013] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Leader pre-election won for term 1
I0531 10:17:26.057225 30074 raft_consensus.cc:573] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Triggering leader election, mode=ELECT_EVEN_IF_LEADER_IS_ALIVE
I0531 10:17:26.057232 30074 raft_consensus.cc:3140] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Snoozing failure detection for 3.053s
I0531 10:17:26.057242 30074 raft_consensus.cc:3201] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Advancing to term 1
I0531 10:17:26.058107 30074 consensus_meta.cc:282] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from FOLLOWER to FOLLOWER. Consensus state: current_term: 1 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.058142 30074 raft_consensus.cc:612] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 FOLLOWER]: Starting election with config: opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } }
I0531 10:17:26.058696 30074 leader_election.cc:241] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [CANDIDATE]: Term 1 election: Election decided. Result: candidate won.
I0531 10:17:26.067572 30074 raft_consensus.cc:3140] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 FOLLOWER]: Snoozing failure detection for 3.256s
I0531 10:17:26.067589 30074 raft_consensus.cc:3027] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 FOLLOWER]: Leader election won for term 1
I0531 10:17:26.067597 30074 replica_state.cc:1170] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 FOLLOWER]: Reset our lease: 2711407.058s
I0531 10:17:26.067610 30074 replica_state.cc:1406] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 FOLLOWER]: SetLeaderNoOpCommittedUnlocked(0), committed: { term: 0 index: 0 }, received: { term: 0 index: 0 }
I0531 10:17:26.067643 30074 consensus_meta.cc:282] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from FOLLOWER to LEADER. Consensus state: current_term: 1 leader_uuid: "bbbfb4951e4b4e3a82f1168995913c48" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.067659 30074 raft_consensus.cc:3076] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 LEADER]: Calling mark dirty synchronously for reason code NEW_LEADER_ELECTED
I0531 10:17:26.067679 30074 raft_consensus.cc:997] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 LEADER]: Becoming Leader. State: Replica: bbbfb4951e4b4e3a82f1168995913c48, State: 1, Role: LEADER, Watermarks: {Received: 0.0 Committed: 0.0} Leader: 0.0
I0531 10:17:26.067726 30074 consensus_queue.cc:256] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [LEADER]: Queue going to LEADER mode. State: All replicated op: 0.0, Majority replicated op: 0.0, Committed index: 0.0, Last applied: 0.0, Last appended: 0.0, Current term: 1, Majority size: 1, State: QUEUE_OPEN, Mode: LEADER, active raft config: opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } }
I0531 10:17:26.067749 30074 raft_consensus.cc:1015] Sending NO_OP at op { term: 0 index: 0 }
I0531 10:17:26.069525 30074 replica_state.cc:1406] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 LEADER]: SetLeaderNoOpCommittedUnlocked(1), committed: { term: 0 index: 0 }, received: { term: 1 index: 1 }
I0531 10:17:26.069552 30074 replica_state.cc:795] T 2758e273282d40cbafc738a424802f87 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 LEADER]: Advanced the committed_op_id across terms. Last committed operation was: { term: 0 index: 0 } New committed index is: { term: 1 index: 1 }
W0531 10:17:26.070199 30091 client-internal.cc:1140] Failed to get hostname: Network error (yb/util/net/net_util.cc:426): Unable to lookup FQDN (localhost.yunk), getaddrinfo returned -2 (EAI_NONAME): Success (system error 0)
I0531 10:17:26.070438 30091 async_initializer.cc:86] Successfully built ybclient
I0531 10:17:26.070650 30102 tablet_peer.cc:922] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [state=BOOTSTRAPPING]: Setting cdc min replicated index to 9223372036854775807
I0531 10:17:26.071393 30102 consensus_meta.cc:282] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from FOLLOWER to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.071417 30102 raft_consensus.cc:425] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Replica starting. Triggering 0 pending operations. Active config: opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } }
I0531 10:17:26.071429 30102 raft_consensus.cc:455] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Consensus starting up: Expiring fail detector timer to make a prompt election more likely
I0531 10:17:26.071437 30102 raft_consensus.cc:1045] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Becoming Follower/Learner. State: Replica: bbbfb4951e4b4e3a82f1168995913c48, State: 1, Role: FOLLOWER, Watermarks: {Received: 0.0 Committed: 0.0} Leader: 0.0, new leader: , initial_fd_wait: 
I0531 10:17:26.071457 30102 consensus_meta.cc:282] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from FOLLOWER to FOLLOWER. Consensus state: current_term: 0 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.071475 30102 consensus_queue.cc:274] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [NON_LEADER]: Queue going to NON_LEADER mode. State: All replicated op: 0.0, Majority replicated op: 0.0, Committed index: 0.0, Last applied: 0.0, Last appended: 0.0, Current term: 0, Majority size: -1, State: QUEUE_OPEN, Mode: NON_LEADER
I0531 10:17:26.071483 30102 raft_consensus.cc:3076] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Calling mark dirty synchronously for reason code CONSENSUS_STARTED
I0531 10:17:26.071493 30102 tablet_peer.cc:1212] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [state=RUNNING]: Changed state from BOOTSTRAPPING to RUNNING
I0531 10:17:26.071516 30102 tablet_peer.cc:1109] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [state=RUNNING]: Registered log gc
I0531 10:17:26.071527 30102 ts_tablet_manager.cc:1512] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Time spent starting tablet: real 0.069s	user 0.002s	sys 0.000s
I0531 10:17:26.071537 30102 ts_tablet_manager.cc:2551] Deleted transition in progress creating tablet for tablet 3f5467ab4801483ca1ae24b99504ada3
I0531 10:17:26.079916 30106 raft_consensus.cc:573] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Triggering leader pre-election, mode=ELECT_EVEN_IF_LEADER_IS_ALIVE
I0531 10:17:26.079939 30106 raft_consensus.cc:3140] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Snoozing failure detection for 3.078s
I0531 10:17:26.079962 30106 raft_consensus.cc:612] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Starting pre-election with config: opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } }
I0531 10:17:26.079975 30106 leader_election.cc:241] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [CANDIDATE]: Term 1 pre-election: Election decided. Result: candidate won.
I0531 10:17:26.080889 30074 raft_consensus.cc:3140] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Snoozing failure detection for 3.168s
I0531 10:17:26.080909 30074 raft_consensus.cc:3013] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Leader pre-election won for term 1
I0531 10:17:26.080914 30074 raft_consensus.cc:573] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Triggering leader election, mode=ELECT_EVEN_IF_LEADER_IS_ALIVE
I0531 10:17:26.080921 30074 raft_consensus.cc:3140] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Snoozing failure detection for 3.150s
I0531 10:17:26.080926 30074 raft_consensus.cc:3201] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 0 FOLLOWER]: Advancing to term 1
I0531 10:17:26.081691 30074 consensus_meta.cc:282] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from FOLLOWER to FOLLOWER. Consensus state: current_term: 1 leader_uuid: "" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.081723 30074 raft_consensus.cc:612] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 FOLLOWER]: Starting election with config: opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } }
I0531 10:17:26.082284 30074 leader_election.cc:241] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [CANDIDATE]: Term 1 election: Election decided. Result: candidate won.
I0531 10:17:26.082312 30074 raft_consensus.cc:3140] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 FOLLOWER]: Snoozing failure detection for 3.276s
I0531 10:17:26.082321 30074 raft_consensus.cc:3027] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 FOLLOWER]: Leader election won for term 1
I0531 10:17:26.082325 30074 replica_state.cc:1170] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 FOLLOWER]: Reset our lease: 2711407.073s
I0531 10:17:26.082332 30074 replica_state.cc:1406] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 FOLLOWER]: SetLeaderNoOpCommittedUnlocked(0), committed: { term: 0 index: 0 }, received: { term: 0 index: 0 }
I0531 10:17:26.082355 30074 consensus_meta.cc:282] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48: Updating active role from FOLLOWER to LEADER. Consensus state: current_term: 1 leader_uuid: "bbbfb4951e4b4e3a82f1168995913c48" config { opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } } }, has_pending_config = 0
I0531 10:17:26.082365 30074 raft_consensus.cc:3076] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 LEADER]: Calling mark dirty synchronously for reason code NEW_LEADER_ELECTED
I0531 10:17:26.082377 30074 raft_consensus.cc:997] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 LEADER]: Becoming Leader. State: Replica: bbbfb4951e4b4e3a82f1168995913c48, State: 1, Role: LEADER, Watermarks: {Received: 0.0 Committed: 0.0} Leader: 0.0
I0531 10:17:26.082399 30074 consensus_queue.cc:256] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [LEADER]: Queue going to LEADER mode. State: All replicated op: 0.0, Majority replicated op: 0.0, Committed index: 0.0, Last applied: 0.0, Last appended: 0.0, Current term: 1, Majority size: 1, State: QUEUE_OPEN, Mode: LEADER, active raft config: opid_index: -1 peers { permanent_uuid: "bbbfb4951e4b4e3a82f1168995913c48" member_type: VOTER last_known_private_addr { host: "192.168.10.241" port: 9100 } last_known_broadcast_addr { host: "192.168.10.241" port: 9100 } cloud_info { placement_cloud: "cloud1" placement_region: "datacenter1" placement_zone: "rack1" } }
I0531 10:17:26.082408 30074 raft_consensus.cc:1015] Sending NO_OP at op { term: 0 index: 0 }
I0531 10:17:26.084228 30074 replica_state.cc:1406] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 LEADER]: SetLeaderNoOpCommittedUnlocked(1), committed: { term: 0 index: 0 }, received: { term: 1 index: 1 }
I0531 10:17:26.084244 30074 replica_state.cc:795] T 3f5467ab4801483ca1ae24b99504ada3 P bbbfb4951e4b4e3a82f1168995913c48 [term 1 LEADER]: Advanced the committed_op_id across terms. Last committed operation was: { term: 0 index: 0 } New committed index is: { term: 1 index: 1 }
W0531 10:17:26.105926 30093 client-internal.cc:1140] Failed to get hostname: Network error (yb/util/net/net_util.cc:426): Unable to lookup FQDN (localhost.yunk), getaddrinfo returned -2 (EAI_NONAME): Success (system error 0)
I0531 10:17:26.105983 30093 async_initializer.cc:86] Successfully built ybclient
W0531 10:17:26.106060 30086 client-internal.cc:1140] Failed to get hostname: Network error (yb/util/net/net_util.cc:426): Unable to lookup FQDN (localhost.yunk), getaddrinfo returned -2 (EAI_NONAME): Success (system error 0)
I0531 10:17:26.106091 30086 async_initializer.cc:86] Successfully built ybclient
I0531 10:17:26.642804 30063 pg_wrapper.cc:412] initdb completed successfully. Database initialized at /home/ykdl/db/disk/data/pg_data
I0531 10:17:26.642879 30063 tablet_server_main.cc:252] Starting PostgreSQL server listening on 192.168.10.241, port 5433
I0531 10:17:26.642930 30063 pg_wrapper.cc:548] Starting PostgreSQL server
W0531 10:17:26.644433 30063 pg_wrapper.cc:248] No hba configuration lines found, defaulting to trust all configuration.
I0531 10:17:26.648268 30063 pg_wrapper.cc:383] PostgreSQL server running as pid 30199
I0531 10:17:26.656394 30063 server_base_options.cc:137] Updating master addrs to {192.168.10.241:7100}
I0531 10:17:26.656476 30063 server_base_options.cc:137] Updating master addrs to {192.168.10.241:7100}
I0531 10:17:26.656545 30063 server_base_options.cc:137] Updating master addrs to {192.168.10.241:7100}
I0531 10:17:26.656617 30063 rpc_server.cc:86] yb::server::RpcServer created at 0x21e8e70
I0531 10:17:26.656625 30063 tablet_server_main.cc:293] Starting CQL server...
I0531 10:17:26.656735 30063 fs_manager.cc:251] Opened local filesystem: /home/ykdl/db/disk/data
uuid: "bbbfb4951e4b4e3a82f1168995913c48"
format_stamp: "Formatted at 2021-05-31 10:17:25 on localhost.yunk"
I0531 10:17:26.675985 30063 thread_pool.cc:171] Starting thread pool { name: CQLServer queue_limit: 10000 max_workers: 1024 }
I0531 10:17:26.722491 30063 cql_service.cc:133] CQL processors limit: 18335
I0531 10:17:26.722641 30063 service_pool.cc:148] yb.cqlserver.CQLServerService: yb::rpc::ServicePoolImpl created at 0x2ac0fc0
I0531 10:17:26.722705 30063 webserver.cc:158] Starting webserver on 192.168.10.241:12000
I0531 10:17:26.722712 30063 webserver.cc:163] Document root: /home/ykdl/yugabyte-2.5.3.1/www
I0531 10:17:26.722736 30063 webserver.cc:153] Webserver listen spec is 192.168.10.241:12000
I0531 10:17:26.722836 30063 webserver.cc:252] Webserver started. Bound to: http://192.168.10.241:12000/
I0531 10:17:26.722927 30063 service_pool.cc:148] yb.server.GenericService: yb::rpc::ServicePoolImpl created at 0x2ac1440
I0531 10:17:26.725975 30063 rpc_server.cc:169] RPC server started. Bound to: 192.168.10.241:9042
I0531 10:17:26.726171 30063 server_base.cc:330] Dumped server information to /home/ykdl/db/disk/data/tserver-info-cql
I0531 10:17:26.726219 30063 tablet_server_main.cc:295] CQL server successfully started.
I0531 10:17:35.971627 30096 server_base.cc:222] Running on host: localhost.yunk
I0531 10:17:35.971824 30096 server_base.cc:234] Logged in user: root
I0531 10:17:35.971894 30096 call_home.cc:399] Done with collector BasicCollector
I0531 10:17:35.971902 30096 call_home.cc:115] Skipping collector MasterInfoCollector because of server type
I0531 10:17:35.971906 30096 call_home.cc:115] Skipping collector TServersInfoCollector because of server type
I0531 10:17:35.971910 30096 call_home.cc:115] Skipping collector TablesCollector because of server type
I0531 10:17:35.971932 30096 call_home.cc:399] Done with collector TabletsCollector
I0531 10:17:35.971937 30096 call_home.cc:111] Skipping collector MetricsCollector because it has a higher collection level than the requested one
I0531 10:17:35.971943 30096 call_home.cc:111] Skipping collector RpcsCollector because it has a higher collection level than the requested one
I0531 10:17:35.973980 30096 call_home.cc:399] Done with collector GFlagsCollector
I0531 10:18:30.965657 30083 reactor.cc:450] TabletServer_R000: DEBUG: Closing idle connection: Connection (0x000000000281e6d0) server 192.168.10.241:49930 => 192.168.10.241:9100 - it has been idle for 65.001s
I0531 10:18:30.965799 30083 reactor.cc:450] TabletServer_R000: DEBUG: Closing idle connection: Connection (0x000000000281e7f0) server 192.168.10.241:42274 => 192.168.10.241:9100 - it has been idle for 65.001s
I0531 10:18:30.965842 30083 reactor.cc:450] TabletServer_R000: DEBUG: Closing idle connection: Connection (0x000000000281e910) server 192.168.10.241:40305 => 192.168.10.241:9100 - it has been idle for 65.001s
I0531 10:18:31.065161 30083 reactor.cc:450] TabletServer_R000: DEBUG: Closing idle connection: Connection (0x0000000002b9ed90) server 192.168.10.241:43250 => 192.168.10.241:9100 - it has been idle for 65.001s
I0531 10:18:31.665184 30084 reactor.cc:450] TabletServer_R001: DEBUG: Closing idle connection: Connection (0x0000000002b9eeb0) server 192.168.10.241:39200 => 192.168.10.241:9100 - it has been idle for 65.098s
I0531 10:18:42.565197 30083 reactor.cc:450] TabletServer_R000: DEBUG: Closing idle connection: Connection (0x0000000002b9efd0) server 192.168.10.241:56706 => 192.168.10.241:9100 - it has been idle for 65s
I0531 10:18:47.661084 30358 server_base.cc:517] Using private rpc address 192.168.10.241
I0531 10:18:47.661172 30358 server_base.cc:539] Using http address 192.168.10.241


I0531 10:18:53.565140 30084 reactor.cc:450] TabletServer_R001: DEBUG: Closing idle connection: Connection (0x0000000002b9fb10) server 192.168.10.241:56429 => 192.168.10.241:9100 - it has been idle for 65s
I0531 10:19:04.565253 30083 reactor.cc:450] TabletServer_R000: DEBUG: Closing idle connection: Connection (0x0000000002b9fc30) server 192.168.10.241:51440 => 192.168.10.241:9100 - it has been idle for 65s
I0531 10:19:15.665045 30084 reactor.cc:450] TabletServer_R001: DEBUG: Closing idle connection: Connection (0x0000000002b9e010) server 192.168.10.241:43491 => 192.168.10.241:9100 - it has been idle for 65.1s
I0531 10:19:26.565253 30084 reactor.cc:450] TabletServer_R001: DEBUG: Closing idle connection: Connection (0x0000000002b9e5b0) server 192.168.10.241:44386 => 192.168.10.241:9100 - it has been idle for 65s
I0531 10:19:32.357899 30373 server_base.cc:517] Using private rpc address 192.168.10.241
I0531 10:19:32.357961 30373 server_base.cc:539] Using http address 192.168.10.241
I0531 10:19:37.665174 30084 reactor.cc:450] TabletServer_R001: DEBUG: Closing idle connection: Connection (0x0000000002b9e370) server 192.168.10.241:49164 => 192.168.10.241:9100 - it has been idle for 65s
I0531 10:19:48.665354 30084 reactor.cc:450] TabletServer_R001: DEBUG: Closing idle connection: Connection (0x0000000002b9f7b0) server 192.168.10.241:55681 => 192.168.10.241:9100 - it has been idle for 65s
I0531 10:19:59.164341 30401 server_base.cc:517] Using private rpc address 192.168.10.241
I0531 10:19:59.164392 30401 server_base.cc:539] Using http address 192.168.10.241
I0531 10:19:59.665599 30084 reactor.cc:450] TabletServer_R001: DEBUG: Closing idle connection: Connection (0x0000000002b9f570) server 192.168.10.241:34176 => 192.168.10.241:9100 - it has been idle for 65.001s
I0531 10:20:03.761162 30402 server_base.cc:517] Using private rpc address 192.168.10.241
I0531 10:20:03.761232 30402 server_base.cc:539] Using http address 192.168.10.241
I0531 10:20:09.805505 30423 server_base.cc:517] Using private rpc address 192.168.10.241
I0531 10:20:09.805578 30423 server_base.cc:539] Using http address 192.168.10.241
I0531 10:20:10.665397 30084 reactor.cc:450] TabletServer_R001: DEBUG: Closing idle connection: Connection (0x0000000002b9fe70) server 192.168.10.241:36948 => 192.168.10.241:9100 - it has been idle for 65s
I0531 10:20:12.934052 30423 server_base.cc:517] Using private rpc address 192.168.10.241
I0531 10:20:12.934123 30423 server_base.cc:539] Using http address 192.168.10.241
I0531 10:20:21.665693 30083 reactor.cc:450] TabletServer_R000: DEBUG: Closing idle connection: Connection (0x0000000002b9fd50) server 192.168.10.241:42046 => 192.168.10.241:9100 - it has been idle for 65s
I0531 10:20:32.765569 30083 reactor.cc:450] TabletServer_R000: DEBUG: Closing idle connection: Connection (0x0000000003572130) server 192.168.10.241:43969 => 192.168.10.241:9100 - it has been idle for 65.1s
I0531 10:20:43.667086 30083 reactor.cc:450] TabletServer_R000: DEBUG: Closing idle connection: Connection (0x0000000003572250) server 192.168.10.241:35077 => 192.168.10.241:9100 - it has been idle for 65.002s
I0531 10:20:54.765717 30084 reactor.cc:450] TabletServer_R001: DEBUG: Closing idle connection: Connection (0x0000000003572370) server 192.168.10.241:36138 => 192.168.10.241:9100 - it has been idle for 65.1s
I0531 10:21:05.765033 30084 reactor.cc:450] TabletServer_R001: DEBUG: Closing idle connection: Connection (0x0000000003572010) server 192.168.10.241:56887 => 192.168.10.241:9100 - it has been idle for 65.1s
I0531 10:21:16.664999 30084 reactor.cc:450] TabletServer_R001: DEBUG: Closing idle connection: Connection (0x00000000035727f0) server 192.168.10.241:56070 => 192.168.10.241:9100 - it has been idle for 65s
I0531 10:21:27.664961 30083 reactor.cc:450] TabletServer_R000: DEBUG: Closing idle connection: Connection (0x0000000003572910) server 192.168.10.241:60862 => 192.168.10.241:9100 - it has been idle for 65s
```


3. 管理命令

./bin/yugabyted destroy --base_dir=/home/ykdl/db/disk  # 销毁集群节点

./bin/yugabyted stop --base_dir=/home/ykdl/db/disk     # 停止服务


### 7. 集群配置 (使用 yb-master ，yb-tserver 命令)

> 该集群配置测试结果，matser 和 tserver 服务，设置最少复制数据为3，可容忍单机数目 1，超过此数服务异常

> 四台机器, 192.168.10.240,192.168.10.241,192.168.10.242,192.168.10.243

> 1. yb-master 配置

./bin/yb-master \
  --master_addresses 192.168.10.240:7100 \
  --rpc_bind_addresses 192.168.10.240:7100 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-1a \
  --redis_proxy_bind_address 6378 \
  --replication_factor 1 \
  --master_replication_factor 1 \
  --tserver_master_replication_factor 1 \
  >& /home/ykdl/db/disk/yb-master.out &

./bin/yb-tserver \
  --tserver_master_addrs 192.168.10.240:7100 \
  --rpc_bind_addresses 192.168.10.240:9100 \
  --pgsql_proxy_bind_address 192.168.10.240:5433 \
  --cql_proxy_bind_address 192.168.10.240:9042 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --start_pgsql_proxy \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --redis_proxy_bind_address 6378 \
  --replication_factor 1 \
  --master_replication_factor 1 \
  --tserver_master_replication_factor 1 \
  >& /home/ykdl/db/disk/yb-tserver.out &

>

./bin/yb-master \
  --master_addresses 192.168.10.241:7100 \
  --rpc_bind_addresses 192.168.10.241:7100 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  --master_replication_factor 3 \
  --tserver_master_replication_factor 3 \
  >& /home/ykdl/db/disk/yb-master.out &

./bin/yb-tserver \
  --tserver_master_addrs 192.168.10.241:7100,192.168.10.242:7100,192.168.10.243:7100 \
  --rpc_bind_addresses 192.168.10.241:9100 \
  --pgsql_proxy_bind_address 192.168.10.241:5433 \
  --cql_proxy_bind_address 192.168.10.241:9042 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --start_pgsql_proxy \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  >& /home/ykdl/db/disk/yb-tserver.out &


>

./bin/yb-master \
  --master_addresses 192.168.10.242:7100\
  --rpc_bind_addresses 192.168.10.242:7100 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  --master_replication_factor 3 \
  --tserver_master_replication_factor 3 \
  >& /home/ykdl/db/disk/yb-master.out &

./bin/yb-master \
  --master_addresses 192.168.10.241:7100,192.168.10.242:7100,192.168.10.243:7100 \
  --rpc_bind_addresses 192.168.10.243:7100 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  --master_replication_factor 3 \
  --tserver_master_replication_factor 3 \
  >& /home/ykdl/db/disk/yb-master.out &

> 2. yb-tserver 配置


./bin/yb-tserver \
  --tserver_master_addrs 192.168.10.241:7100,192.168.10.242:7100,192.168.10.243:7100 \
  --rpc_bind_addresses 192.168.10.242:9100 \
  --pgsql_proxy_bind_address 192.168.10.242:5433 \
  --cql_proxy_bind_address 192.168.10.242:9042 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --start_pgsql_proxy \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  >& /home/ykdl/db/disk/yb-tserver.out &

./bin/yb-tserver \
  --tserver_master_addrs 192.168.10.241:7100,192.168.10.242:7100,192.168.10.243:7100 \
  --rpc_bind_addresses 192.168.10.243:9100 \
  --pgsql_proxy_bind_address 192.168.10.243:5433 \
  --cql_proxy_bind_address 192.168.10.243:9042 \
  --fs_data_dirs "/home/ykdl/db/disk" \
  --start_pgsql_proxy \
  --placement_cloud cloud \
  --placement_region region-west \
  --placement_zone region-west-zone \
  --replication_factor 3 \
  >& /home/ykdl/db/disk/yb-tserver.out &