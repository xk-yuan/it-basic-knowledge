# DNS

>

## 资源

> [容器部署内网的DNS](https://blog.csdn.net/qq_36270681/article/details/103983695)
>
> [搭建企业内部DNS服务器，docker 部署内部 dnsmasq](https://www.cnblogs.com/freefei/p/7561657.html)
>
> [公司内部自建DNS的办法 使用私有域名的方法](https://www.cnblogs.com/jinanxiaolaohu/p/13209189.html)
>
> [企业内部部署一套完整的DNS详细流程](https://blog.csdn.net/weixin_33896069/article/details/93023219)


> [](https://www.cnblogs.com/jiftle/p/12936368.html)
>
> [](https://hub.docker.com/r/sameersbn/bind)
>
> [](https://www.cnblogs.com/kaishirenshi/p/13995439.html)
>
> [](https://zhuanlan.zhihu.com/p/385097198)


## 简介


## 容器搭建DNS服务

> 1. 拉取镜像

$ docker pull sameersbn/bind:9.16.1-20200524

> 2. 启动容器

$ docker run --name dns-bind --restart=always \
  -p 53:53/tcp -p 53:53/udp -p 10000:10000/tcp \
  --volume /srv/docker/bind:/data \
  -d sameersbn/bind:9.16.1-20200524

> 3. WEB配置

$ 访问 https://127.0.0.1:10000/

root password

