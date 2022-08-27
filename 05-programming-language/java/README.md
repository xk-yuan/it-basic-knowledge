# java

> 编程语言 java

## 资源 & 书籍

> <Java 核心技术 卷I 基础知识 第十版 @ 周立新 201609>
>
>  - [java-core-technology-volume-1-basic-knowledge-10th-edition](https://github.com/xknower/java-core-technology-volume-1-basic-knowledge-10th-edition)

> <Java 核心技术 卷II 高级特性 第十版 @ 陈昊鹏 201709>

> <Java 8 函数式编程 @ 王群锋 201504>

> <Java 面向对象编程 第二版 @ 孙卫琴 201701>

> <Java 语言程序设计教程 @ 朱晓龙 201512>

> <Java 工程师修炼之道 @ 杭建 201803>

> <Java 线程与并发编程实践 @ Jeff 焉倩 201702>

> <Java 并发编程实战 @ 童云兰 201202>

> <Java 并发编程实践 @ 韩锴 200706>

> JAVA 源码
>
> - [source-code-openjdk-8u41-src-b04-14_jan_2020](https://github.com/xknower/source-code-openjdk-8u41-src-b04-14_jan_2020)
>
> - [source-code-jdk-8u211](https://github.com/xknower/source-code-jdk-8u211)


> [服务端高并发分布式架构演进之路](https://segmentfault.com/a/1190000018626163)


## 语言技术架构

```
> 01. 语言基础 (language-foundation)

> 02. 面向对象基础 (object-oriented-foundation)

> 03. 异常处理框架 (exception-handling-framework)

> 04. 反射框架 (reflection-framework)

> 05. 泛型框架 (generic-paradigm-framework)

> 06. 注解框架 (annotation-framework)

> 07. 集合框架 (collection-framework)

> 08. 事件框架 (event-framework)

> 09. 多线程框架 (进程、线程和协程) (multi-thread-framework)

> 10. Lambda & Stream API (lambda-stream-framework)

> 11. 日志框架 (log-framework)

> 12. 数据库框架 (database-framework)

> 13. 工具功能类 (utils-framework)

> 14. JVM (runtime-environment)

> 15. IO & NIO & Net & 文件系统

> 16. UI框架

```

### 源码包结构分析

```
com
    com.sun   // sun的hotspot虚拟机中java.* 和javax.*的实现类。因为包含在rt中，所以我们也可以调用。
              // 不是sun对外公开承诺的接口，在不同版本的hotspot中可能是不同的。
java          // java SE的标准库, 是java标准的一部分, 是对外承诺的java开发接口, 通常要保持向后兼容, 一般不会轻易修改
              // 包括其他厂家的在内，所有jdk的实现，在java.*上都是一样的
javax         // java标准的一部分，但是没有包含在标准库中，一般属于标准库的扩展。通常属于某个特定领域，不是一般性的api。
org           // 是由企业或者组织提供的java类库。其中比较常用的是w3c提供的对XML、网页、服务器的类和接口。
launcher
```

```
applet    // 不独立运行, 而嵌入到另一个程序中运行的的小程序
awt       // Abstract Window ToolKit (抽象窗口工具包), 提供图形化界面, 比如按钮、图片、颜色控制、样式等工具包
beans     // 核心在于封装了java 的反射, 提供JavaBean的各种操作, 基于JavaBean组件架构。
io        // 提供对数据流的输出、输出、读写。通过数据流、序列化和文件系统提供系统的输入和输出。
lang      // 语言基础包, 基本数据类型、包装类、运算、异常类等，以及根类Object, 提供常用的方法。
math      // 提供执行任意精度整数算术 和任意精度十进制算术的类。
net       // 网络通信, 比如http、cookie、socket等的实现。
nio       // 简称java new io 定义了缓冲区, 这是数据的容器, 并提供其他NIO包的概述。
rmi       // Java Remote Method Invocation 远程方法调用
security  // 安全框架提供类和接口
sql       // 数据库相关, 提供的API来访问和处理的数据存储在数据源
text      // 提供用于处理独立于自然语言的方式处理文本、日期、数字和消息的类和接口
time      // 日期、时间、时刻主要的API, 和持续时间
util      // 集合框架、遗留的集合类、并发包、事件模型、日期和时间的设施、国际化和各种实用工具类
```

## 笔记
