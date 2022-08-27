# gRPC

> gRPC, 基于 HTTP/2 实现的开源高性能 RPC 框架

> protobuf, Protocol Buffer Language

## 资源

> [官网](https://www.grpc.io/)
>
>  - [文档](https://www.grpc.io/docs/)
>
>  - [github](https://github.com/grpc/grpc)

> [gRPC 官方文档中文版](http://doc.oschina.net/grpc)


> [从实践到原理，带你参透 gRPC](https://segmentfault.com/a/1190000019608421)
>
> [思考gRPC ：为什么是HTTP/2](https://hengyun.tech/thinking-about-grpc-http2/)
>
> [一个恋爱小故事告诉你什么是gRPC？！](https://blog.csdn.net/qq_36310758/article/details/113767333)
>
> [gRPC](https://blog.csdn.net/xuduorui/article/details/78278808)
>
> [怎么看待谷歌的开源 RPC 框架 gRPC？](https://www.zhihu.com/question/30027669/answer/1838025494)
>
> [gRPC系列(一) 什么是RPC？](https://zhuanlan.zhihu.com/p/148139089)
>
> [gRPC 基础概念详解](https://zhuanlan.zhihu.com/p/389328756)
>
> [gRPC详解](https://www.jianshu.com/p/9c947d98e192)


> [Google Protobuf简明教程](https://www.jianshu.com/p/b723053a86a6)


> [前端从懵逼到入门 gRPC 框架](https://www.cnblogs.com/zhangchaojie/p/15172929.html)
>
> [走进前端 BFF 之 可以看但没必要的 grpc-node 拦截器操作指南](https://zhuanlan.zhihu.com/p/96045260)


> [go学习笔记 grpc-gateway和swagger](https://blog.csdn.net/ma_jiang/article/details/112041096)
>
> [grpc-swagger 使用手册](https://blog.csdn.net/aitcax/article/details/105206636)
>
> [GRPC 调试工具 -GRPCUI](https://www.freesion.com/article/53061225795)



## 简介

A high performance, open source universal RPC framework. 一个高性能、开源的通用 RPC 框架。

gRPC 是一个现代开源的高性能远程过程调用 (RPC) 框架，可以在任何环境中运行。它可以通过对负载平衡、跟踪、健康检查和身份验证的可插拔支持有效地连接数据中心内和跨数据中心的服务。它也适用于分布式计算的最后一英里，将设备、移动应用程序和浏览器连接到后端服务。

gRPC是google开源的高性能跨语言的RPC方案。gRPC的设计目标是在任何环境下运行，支持可插拔的负载均衡，跟踪，运行状况检查和身份验证。它不仅支持数据中心内部和跨数据中心的服务调用，它也适用于分布式计算的最后一公里，将设备，移动应用程序和浏览器连接到后端服务。

gRPC 最初由谷歌创建，十多年来，谷歌一直使用一个名为Stubby的通用 RPC 基础设施来连接在其数据中心内和跨数据中心运行的大量微服务。2015 年 3 月，Google 决定构建下一个版本的 Stubby 并使其开源。结果就是 gRPC，它现在在 Google 以外的许多组织中用于支持从微服务到计算“最后一英里”（移动、Web 和物联网）的用例。

目前提供 C、Java 和 Go 语言版本，分别是：grpc, grpc-java, grpc-go. 其中 C 版本支持 C, C++, Node.js, Python, Ruby, Objective-C, PHP 和 C# 支持。

gRPC 基于 HTTP/2 标准设计，带来诸如双向流、流控、头部压缩、单 TCP 连接上的多复用请求等特性。这些特性使得其在移动设备上表现更好，更省电和节省空间占用。

gRPC 在很大程度上遵循 HTTP/2 之上的 HTTP 语义，但我们明确允许全双工流式传输。我们与典型的 REST 约定不同，因为我们在调用调度期间出于性能原因使用静态路径，因为从路径、查询参数和有效负载正文中解析调用参数会增加延迟和复杂性。我们还形式化了一组错误，我们认为这些错误比 HTTP 状态代码更直接适用于 API 用例。

![](http://www.grpc.io/img/grpc_concept_diagram_00.png)

主要使用场景

- 在微服务风格架构中有效连接多语言服务
- 将移动设备、浏览器客户端连接到后端服务
- 生成高效的客户端库

- 11 种语言的客户端库
- 在线高效且具有简单的服务定义框架
- 基于 http/2 传输的双向流式传输
- 可插入的身份验证、跟踪、负载平衡和健康检查

