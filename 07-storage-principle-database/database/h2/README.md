# H2

> 嵌入式数据库引擎

## 资源

> [官网](https://www.h2database.com/)
>
>  - [version-2.1.210](https://github.com/h2database/h2database/releases/download/version-2.1.210/h2-2022-01-17.zip)
>
>  - [文档](http://www.h2database.com/html/tutorial.html)
>
>  - [github](https://github.com/h2database/h2database/)

### 

> [百度百科-H2数据库](https://baike.baidu.com/item/H2数据库/23316077)

> [深入理解h2和r2dbc-h2](https://my.oschina.net/flydean/blog/4741379)
>
> [H2数据库](https://my.oschina.net/u/4327970/blog/3337277)
>
> [H2数据库入门，看这篇就对了](https://blog.csdn.net/qq_34845394/article/details/107190256)
>
> [H2数据库介绍](https://www.jianshu.com/p/1e0fb830cbe4)
>
> [H2 Database 简介](https://zhuanlan.zhihu.com/p/142758091)
>
> [H2数据库教程](https://blog.csdn.net/daqiang012/article/details/81069894)
>
> [测试一下H2数据库的性能](https://blog.51cto.com/boytnt/932237)
>
> [浅析h2数据库存储引擎-mvStore](http://www.longhuashen.com/2020/05/10/h2-mvstore/)

> [H2 数据库入门和基本使用](https://blog.csdn.net/qq262593421/article/details/108651119)

> [H2数据库教程](http://www.vue5.com/h2_database/h2_database.html)


## 简介

H2是一个Java编写的开源轻量级关系型数据库，它可以被嵌入Java应用程序中使用，或者作为一个单独的数据库服务器运行。

H2流行的原因是它既可以当做一个独立的服务器，也可以以一个嵌套的服务运行，并且支持纯内存形式运行。H2的jar包非常小，只有2M大小，所以非常适合做嵌套式数据库。

H2数据库的前身是 HypersonicSQL，它的名字的含义是 Hypersonic2，但是它的代码是从头开始编写的，没有使用HypersonicSQL或者HSQLDB的代码。


> 特性

- 非常快，开源，JDBC API
- 嵌入式和服务器模式；基于磁盘或内存中的数据库; 嵌入式的数据库服务器，支持集群
- 事务支持，多版本并发
- 基于浏览器的控制台应用程序
- 加密数据库
- 全文搜索
- 占用空间小的纯 Java：大约 2.5 MB 的 jar 文件大小
- ODBC 驱动程序; 提供JDBC、ODBC访问接口，提供基于浏览器的控制台管理程序
- 纯Java编写，不受平台的限制；
- 功能完整，支持标准SQL和JDBC。
- 支持内嵌模式、服务器模式和集群

其，第一个用途，也是最常使用的用途就在于可以同应用程序打包在一起发布，这样可以非常方便地存储少量结构化数据。第二个用途是用于单元测试。启动速度快，而且可以关闭持久化功能，每一个用例执行完随即还原到初始状态。第三个用途是作为缓存，即当做内存数据库，作为NoSQL的一个补充。

```log
h2
　|---bin
　|    |---h2-1.1.116.jar　　// H2数据库的jar包（驱动也在里面）
　|    |---h2.bat　　        // Windows控制台启动脚本
　|    |---h2.sh　　         // Linux控制台启动脚本
　|    |---h2w.bat　　       // Windows控制台启动脚本（不带黑屏窗口）
　|---docs　　               // H2数据库的帮助文档（内有H2数据库的使用手册）
　|---service　　            // 通过wrapper包装成服务。
　|---src　　                // H2数据库的源代码
　|---build.bat　　          // windows构建脚本
　|---build.sh　　           // linux构建脚本
```

> 启动模式, 作为应用嵌入式启动, 作为独立服务端启动

$> java -jar h2*.jar  &&  http://localhost:8082  # 独立启动并访问管理界面

- org.h2.tools.Server -tcpAllowOthers -webAllowOthers -webPort 8082
- org.h2.tools.Server 以服务器模式启动
- tcpAllowOthers      允许远程机器通过TCP方式访问
- webAllowOthers      允许远程机器通过浏览器访问
- webPort 8082        默认的访问端口

```xml
<dependency>
    <groupId>com.h2database</groupId>
    <artifactId>h2</artifactId>
    <version>1.4.197</version>
</dependency>
```

> 连接模式

- 1）嵌入式模式（使用 JDBC 的本地连接）
- 2）服务器模式（使用 JDBC 或 ODBC 在 TCP/IP 上的远程连接）
- 3）混合模式（本地和远程连接同时进行）

嵌入式模式下，应用程序使用JDBC从同一JVM中打开数据库。这是最快也是最容易的连接方式。缺点是数据库可能只在任何时候在一个虚拟机（和类加载器）中打开。与所有模式一样，支持持久性和内存数据库。对并发打开数据库的数量或打开连接的数量没有限制。

服务器模式（有时称为远程模式或客户机/服务器模式）时，应用程序使用 JDBC 或 ODBC API 远程打开数据库。服务器需要在同一台或另一台虚拟机上启动，或者在另一台计算机上启动。许多应用程序可以通过连接到这个服务器同时连接到同一个数据库。在内部，服务器进程在嵌入式模式下打开数据库。服务器模式比嵌入式模式慢，因为所有数据都通过TCP/IP传输。与所有模式一样，支持持久性和内存数据库。对每个服务器并发打开的数据库数量或打开连接的数量没有限制。

混合模式是嵌入式和服务器模式的结合。连接到数据库的第一个应用程序在嵌入式模式下运行，但也启动服务器，以便其他应用程序（在不同进程或虚拟机中运行）可以同时访问相同的数据。

服务器可以从应用程序内（使用服务器API）启动或停止，或自动（自动混合模式）。

