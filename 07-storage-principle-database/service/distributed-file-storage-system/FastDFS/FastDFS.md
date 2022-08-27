# FastDFS

> C语言开发的，开源的，轻量级，分布式文件系统，它对文件进行管理，功能包括：文件存储、文件同步、文件访问（文件上传、文件下载）等，解决了大容量存储和负载均衡的问题。

> 其充分考虑了冗余备份、负载均衡、线性扩容等机制，并注重高可用、高性能等指标，使用FastDFS很容易搭建一套高性能的文件服务器集群提供文件上传、下载等服务。

> 其，适合以文件为载体的在线服务，如图片网站，视频网站等，主要适合小文件存储的场景。

## 资源

> [GITHUB](https://github.com/happyfish100/fastdfs)

> [fastdfs-client-java](https://github.com/happyfish100/fastdfs-client-java)


## 简介

分为客户端和服务端，服务有两个角色：跟踪器（tracker）和 存储节点（storage）。跟踪器主要做调度工作，在访问上起负载均衡的作用。存储节点存储文件，完成文件管理的所有功能。

同时，对文件的metadata进行管理。所谓文件的meta data就是文件的相关属性，以键值对（key value）方式表示，如：width=1024，其中的key为width，value为1024。文件metadata是文件属性列表，可以包含多个键值对。

跟踪器和存储节点都可以由一台或多台服务器构成。跟踪器和存储节点中的服务器均可以随时增加或下线而不会影响线上服务。其中跟踪器中的所有服务器都是对等的，可以根据服务器的压力情况随时增加或减少。

为了支持大容量，存储节点（服务器）采用了分卷（或分组）的组织方式。存储系统由一个或多个卷组成，卷与卷之间的文件是相互独立的，所有卷的文件容量累加就是整个存储系统中的文件容量。一个卷可以由一台或多台存储服务器组成，一个卷下的存储服务器中的文件都是相同的，卷中的多台存储服务器起到了冗余备份和负载均衡的作用。

FastDFS中的文件标识分为两个部分：卷名和文件名，二者缺一不可。

## JAVA 客户端


> [](https://www.cnblogs.com/chiangchou/p/fastdfs.html)
>
> [](https://segmentfault.com/a/1190000018251300)



## 安装

### [安装包安装](https://github.com/happyfish100/fastdfs/blob/master/INSTALL)

> 1. 源码下载编译

> yum install gcc g++ make -y # 安装依赖包

> wget https://github.com/happyfish100/libfastcommon/archive/V1.0.47.tar.gz

> tar -zxvf V1.0.47.tar.gz && cd libfastcommon-1.0.47

> ./make.sh clean && ./make.sh && ./make.sh install

> wget https://github.com/happyfish100/fastdfs/archive/V6.07.tar.gz

> tar -zxvf V6.07.tar.gz && cd fastdfs-6.07

> ./make.sh clean && ./make.sh && ./make.sh install

```执行文件
fdfs_trackerd
  tracker.conf
  storage_ids.conf

fdfs_storaged
  storage.conf

cp -f fdfs_monitor fdfs_test fdfs_test1 fdfs_crc32 fdfs_upload_file fdfs_download_file fdfs_delete_file fdfs_file_info fdfs_appender_test fdfs_appender_test1 fdfs_append_file fdfs_upload_appender fdfs_regenerate_filename

  libfdfsclient.a
  libfdfsclient.so

cp -f ../common/fdfs_define.h ../common/fdfs_global.h ../common/mime_file_parser.h ../common/fdfs_http_shared.h ../tracker/tracker_types.h ../tracker/tracker_proto.h ../tracker/fdfs_shared_func.h ../tracker/fdfs_server_id_func.h ../storage/trunk_mgr/trunk_shared.h tracker_client.h storage_client.h storage_client1.h client_func.h client_global.h fdfs_client.h /usr/include/fastdfs

  client.conf
```

> 2. 配置 Tracker

> mkdir –p /home/data/fastdfs/tracker

> cp /etc/fdfs/tracker.conf.sample /etc/fdfs/tracker.conf

> vim /etc/fdfs/tracker.conf

```tracker.conf
base_path=/home/data/fastdfs/tracker
```

> 3. 配置 Storage

> mkdir –p /home/data/fastdfs/storage

> cp /etc/fdfs/storage.conf.sample /etc/fdfs/storage.conf

> vim /etc/fdfs/storage.conf

```storage.conf
base_path=/home/data/fastdfs/storage
store_path0=/home/data/fastdfs/storage
tracker_server=${tracker_ip}:22122
```

> 4. 启动服务

> trackerd /etc/fastdfs/tracker.conf start

> storaged /etc/fastdfs/storage.conf start

> 5. 测试

> cp /etc/fdfs/client.conf.sample /etc/fdfs/client.conf

> vim /etc/fdfs/client.conf

```client.conf
base_path=/home/data/fastdfs/tracker
tracker_server=${tracker_ip}:22122
```

> fdfs_upload_file /etc/fdfs/client.conf filename # 上传文件

> 6. 配置 Nginx

> nginx 添加 fastdfs-nginx-module 模块

``` bash
sudo ./configure --prefix=/usr/local/nginx/ --add-module=${fastdfs-nginx-module解压后目录下src的绝对路径}
sudo ./make
sudo ./make install
sudo cp ${fastdfs-nginx-module解压后目录下src的绝对路径}/mod_fastdfs.conf  /etc/fdfs/mod_fastdfs.conf
```

> vim /etc/fdfs/mod_fastdfs.conf

```mod_fastdfs.conf
connect_timeout=10
tracker_server=tracker所在机器的ip:22122
url_have_group_name=true //返回file_id中包含组号
store_path0=/home/data/fastdfs/storage
```
> cp ${fastdfs-nginx-module解压后目录下}/http.conf  /etc/fdfs/http.conf

> cp ${fastdfs-nginx-module解压后目录下}/mime.types /etc/fdfs/mime.types

> vim /usr/local/nginx/conf/nginx.conf

```nginx.conf
server {
    listen       8888;
    server_name  localhost;
    location ~/group[0-9]/ { // 地址有组号的，就到下面的位置里找
        ngx_fastdfs_module;
    }
    error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
```


dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

https://docs.microsoft.com/en-us/windows/wsl/install-win10

base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  mkdir -p "$HOME/bin" &&
  curl -L $base/docker-machine-Windows-x86_64.exe > "$HOME/bin/docker-machine.exe" &&
  chmod +x "$HOME/bin/docker-machine.exe"



### [容器安装](https://github.com/happyfish100/fastdfs/tree/master/docker)

> docker run -d -e FASTDFS_IPADDR=${宿主机_IP} -p 8888:8888 -p 22122:22122 -p 23000:23000 -p 8011:80 --name test-fast ${image_id}

> docker run --network=host -it --rm fastdfs:v1 /bin/sh

> docker run -e FASTDFS_IPADDR=192.168.0.103 -p 8888:8888 -p 22122:22122 -p 23000:23000 -p 8011:80 -it --rm fastdfs:v1 /bin/sh

> docker run -it --rm  fastdfs:v1 /bin/sh

 > docker build . -t fastdfs:v2

```bash
[+] Building 268.7s (16/16) FINISHED
 => [internal] load build definition from Dockerfile                                                               0.1s
 => => transferring dockerfile: 1.46kB                                                                             0.0s
 => [internal] load .dockerignore                                                                                  0.0s
 => => transferring context: 2B                                                                                    0.0s
 => [internal] load metadata for docker.io/library/centos:7                                                        0.0s
 => [1/11] FROM docker.io/library/centos:7                                                                         0.0s
 => [internal] load build context                                                                                  0.0s
 => => transferring context: 1.02kB                                                                                0.0s
 => CACHED [2/11] ADD conf/client.conf /etc/fdfs/                                                                  0.0s
 => CACHED [3/11] ADD conf/http.conf /etc/fdfs/                                                                    0.0s
 => CACHED [4/11] ADD conf/mime.types /etc/fdfs/                                                                   0.0s
 => CACHED [5/11] ADD conf/storage.conf /etc/fdfs/                                                                 0.0s
 => CACHED [6/11] ADD conf/tracker.conf /etc/fdfs/                                                                 0.0s
 => [7/11] ADD fastdfs.sh /home                                                                                    0.1s
 => [8/11] ADD conf/nginx.conf /etc/fdfs/                                                                          0.0s
 => [9/11] ADD conf/mod_fastdfs.conf /etc/fdfs                                                                     0.0s
 => [10/11] RUN yum install git gcc gcc-c++ make automake autoconf libtool pcre pcre-devel zlib zlib-devel open  264.3s
 => [11/11] RUN yum install dos2unix -y   &&    dos2unix /home/fastdfs.sh                                          1.7s
 => exporting to image                                                                                             2.5s
 => => exporting layers                                                                                            2.4s
 => => writing image sha256:0c8cb9e913db67f6cead5f68ded75dd65ad857805b68dc11873fd3ebde30471b                       0.0s
 => => naming to docker.io/library/fastdfs:v2                                                                      0.0s
```

```Dockerfile
# centos 7
FROM centos:7
# add configuation files
ADD conf/client.conf /etc/fdfs/
ADD conf/http.conf /etc/fdfs/
ADD conf/mime.types /etc/fdfs/
ADD conf/storage.conf /etc/fdfs/
ADD conf/tracker.conf /etc/fdfs/
ADD fastdfs.sh /home
ADD conf/nginx.conf /etc/fdfs/
ADD conf/mod_fastdfs.conf /etc/fdfs

# run
RUN yum install git gcc gcc-c++ make automake autoconf libtool pcre pcre-devel zlib zlib-devel openssl-devel wget vim -y \
  &&    cd /usr/local/src  \
  &&    git clone https://github.com/happyfish100/libfastcommon.git --depth 1        \
  &&    git clone https://github.com/happyfish100/fastdfs.git --depth 1    \
  &&    git clone https://github.com/happyfish100/fastdfs-nginx-module.git --depth 1   \
  &&    wget http://nginx.org/download/nginx-1.15.4.tar.gz    \
  &&    tar -zxvf nginx-1.15.4.tar.gz    \
  &&    mkdir /home/dfs   \
  &&    cd /usr/local/src/  \
  &&    cd libfastcommon/   \
  &&    ./make.sh && ./make.sh install  \
  &&    cd ../  \
  &&    cd fastdfs/   \
  &&    ./make.sh && ./make.sh install  \
  &&    cd ../  \
  &&    cd nginx-1.15.4/  \
  &&    ./configure --add-module=/usr/local/src/fastdfs-nginx-module/src/   \
  &&    make && make install  \
  &&    chmod +x /home/fastdfs.sh

# Q: standard_init_linux.go:211: exec user process caused "no such file or directory"
RUN yum install dos2unix -y \
  &&    dos2unix /home/fastdfs.sh


# export config
VOLUME /etc/fdfs

EXPOSE 22122 23000 8888 80
ENTRYPOINT ["/home/fastdfs.sh"]
```

```bash fasstdfs.sh
#!/bin/bash

new_val=$FASTDFS_IPADDR
old="com.ikingtech.ch116221"

sed -i "s/$old/$new_val/g" /etc/fdfs/client.conf
sed -i "s/$old/$new_val/g" /etc/fdfs/storage.conf
sed -i "s/$old/$new_val/g" /etc/fdfs/mod_fastdfs.conf

cat  /etc/fdfs/client.conf > /etc/fdfs/client.txt
cat  /etc/fdfs/storage.conf >  /etc/fdfs/storage.txt
cat  /etc/fdfs/mod_fastdfs.conf > /etc/fdfs/mod_fastdfs.txt

mv /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf.t
cp /etc/fdfs/nginx.conf /usr/local/nginx/conf

echo "start trackerd"
/usr/bin/fdfs_trackerd /etc/fdfs/tracker.conf start

echo "start storage"
/usr/bin/fdfs_storaged /etc/fdfs/storage.conf start

echo "start nginx"
/usr/local/nginx/sbin/nginx 

tail -f  /dev/null
```