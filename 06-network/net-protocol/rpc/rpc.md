# RPC

> RPC (remote procedure call, 远程过程调用)

> gRPC

## 资源

> [远程过程调用 - 百度百科](https://baike.baidu.com/item/远程过程调用/7854346)
>
> [RPC协议](https://baike.baidu.com/item/RPC协议/5019569)
>
> [初识RPC](https://blog.csdn.net/wangguohe/article/details/81536550)
>
> [什么是RPC？](https://www.jianshu.com/p/7d6853140e13)
>
> [RPC基本原理](https://www.cnblogs.com/sumuncle/p/11554904.html)
>
> [谁能用通俗的语言解释一下什么是 RPC 框架？](https://www.zhihu.com/question/25536695)
>
> [RPC原理解析](https://zhuanlan.zhihu.com/p/29857744)
>
> [如何实现一个简单的RPC](https://www.jianshu.com/p/5b90a4e70783)
>
> [浅谈 RPC](https://zhuanlan.zhihu.com/p/98423247)
>
> [远程过程调用协议RPC（Remote Procedure Call Protocol) 既然有 HTTP 请求，为什么还要用 RPC 调用？](https://www.zhihu.com/question/41609070)


## 简介

RPC协议是一种通过网络从远程计算机程序上请求服务，而不需要了解底层网络技术的协议。

进程间通信（IPC）是在多任务操作系统或联网的计算机之间运行的程序和进程所用的通信技术。本地过程调用(LPC)用在多任务操作系统中，使得同时运行的任务能互相会话。这些任务共享内存空间使任务同步和互相发送信息。远程过程调用(RPC) 类似于LPC，只是在网上工作。RPC开始是出现在Sun微系统公司和HP公司的运行Unix操作系统的计算机中。

RPC的概念与技术早在1981年由Nelson提出。1984年，Birrell和Nelson把其用于支持异构型分布式系统间的通讯。Birrell的RPC 模型引入存 根进程(stub) 作为远程的本地代理，调用RPC运行时库来传输网络中的调用。Stub 和 RPC runtime 屏蔽了网络调用所涉及的许多细节，特别是，参数的编码/译码及网络通讯是由stub和RPC runtime完成的，因此这一模式被各类RPC所采用。

RPC 本质上是一种 Inter-process communication（IPC）—— 进程间通信的形式。常见的进程间通信方式如管道、共享内存是同一台物理机上的两个进程间的通信，而RPC就是两个在不同物理机上的进程之间的通信。

RPC, 远程过程调用（Remote Procedure Call，RPC）是一个计算机通信协议，该协议允许运行于一台计算机的程序程调用另一台计算机的上的程序。通俗讲，RPC通过把网络通讯抽象为远程的过程调用，调用远程的过程就像调用本地的子程序一样方便，从而屏蔽了通讯复杂性，使开发人员可以无需关注网络编程的细节，将更多的时间和精力放在业务逻辑本身的实现上，提高工作效率




由于分布式系统的异构性及分布式计算模式与计算任务的多样性，RPC作为网络通讯与委托计算的实现机制，在方法、协议、语义、实现上不断发展，种类繁多，其中SUN公司和开放软件基金会在其分布式产品中所建立和实用的RPC较为典型。

在SUN公司的网络文件系统NFS及开放网络计算环境ONC中，RPC是基本实现技术。OSF酝酿和发展的另一个重要的分布式计算软件环境DCE也是基于RPC的。在这两个系统中，RPC既是其自身的实现机制，又是提供给用户设计分布式应用程序的高级工具。由于对分布式计算的广泛需求，ONC和DCE成为Client/Server模式分布式计算环境的主流产品，而RPC也成为实现分布式计算的事实标准之一。

unSoft的开放网络计算（ONC）的远过程调用/外部数据表示（RPC/XDR）协议被广泛采用。在三百一十万个运行网络文件系统(NFS）的系统中，有二百八十万个使用ONCRPC库，并在分布式应用中作为客户机或服务器。ONCRPC被IBM的所有操作系统所支持（除了OS/400）。UNⅨ系统实验室把RPC/XDR当作是UNⅨ System V Release 4的一个标准部分。Novell支持下一代ONC+传输自立远程过程调用（TI-RPC）技术．TI-RPC 使用运输层接口（TLI）实现传输自立。TLI提供了一种访问面向连接或非连接传输服务的通用方法（这在“STERAMS环境”中有所叙述）。




