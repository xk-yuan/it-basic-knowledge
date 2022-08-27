# GO

> GO 语言

## 资源

> [官网](https://go.dev/)
>
>   - [文档](https://go.dev/doc/)
>
>   - [download](https://go.dev/doc/install) | [other](https://go.dev/dl/)
>
>   - [package](https://pkg.go.dev/search)
>
>   - [模块版本号管理](https://go.dev/doc/modules/version-numbers)


> [Go 编程语言](https://go-zh.org/)
>
>
> [GO语言中文站](https://studygolang.com/)
>
>   - [Golang标准库文档](https://studygolang.com/pkgdoc)
>
>   - [中文文档](http://docscn.studygolang.com/)


> [GO语言-百度百科](https://baike.baidu.com/item/go/953521)

> [Go 语言教程](https://www.runoob.com/go/go-structures.html)
>
> [Go 教程](https://www.w3cschool.cn/go/)
>
> [Go语言简介](http://c.biancheng.net/view/1.html)
>
> [Go 语言设计与实现](https://draveness.me/golang/docs)


> [为什么要使用 Go 语言？Go 语言的优势在哪里？](https://www.zhihu.com/question/21409296)
>
> [go语言如何入门，如何提高?](https://www.zhihu.com/question/35657641)
>
> [Go语言101](https://gfw.go101.org/article/101.html)

> [eggos](https://eggos.icexin.com/)
>
> [github](https://github.com/icexin/eggos)
>
> [使用Go语言编写操作系统-前言](https://zhuanlan.zhihu.com/p/387299116)
>
> [将Go程序跑在裸机上之LibOS](https://zhuanlan.zhihu.com/p/397473228)

### 

> [手把手带你从0搭建一个Golang ORM框架（全）！](https://mp.weixin.qq.com/s?__biz=MzAwMDU1MTE1OQ==&mid=2653558589&idx=1&sn=7baa3f0c2768c836d400db244a44e6e5)

> [Golang主流orm数据库框架介绍](http://www.golang.ren/article/427.html)


## 简介

The Go programming language is an open source project to make programmers more productive.

Go 编程语言是一个开源项目，旨在提高程序员的工作效率。

Go is expressive, concise, clean, and efficient. Its concurrency mechanisms make it easy to write programs that get the most out of multicore and networked machines, while its novel type system enables flexible and modular program construction. Go compiles quickly to machine code yet has the convenience of garbage collection and the power of run-time reflection. It's a fast, statically typed, compiled language that feels like a dynamically typed, interpreted language.

Go 具有表现力、简洁、干净和高效。它的并发机制使编写充分利用多核和联网机器的程序变得容易，而其新颖的类型系统支持灵活和模块化的程序构建。Go 可以快速编译为机器码，但具有垃圾收集的便利性和运行时反射的强大功能。它是一种快速、静态类型的编译语言，感觉就像是一种动态类型的解释语言。

GO, 又称为GOLANG, 是 Google 的 Robert Griesemer，Rob Pike 及 Ken Thompson 开发的一种静态强类型、编译型语言。其语法与 C 相近，但功能上有：内存安全，GC（垃圾回收），结构形态及 CSP-style 并发计算。

罗伯特·格瑞史莫（Robert Griesemer），罗勃·派克（Rob Pike）及肯·汤普逊（Ken Thompson）于2007年9月开始设计Go，稍后Ian Lance Taylor、Russ Cox加入项目。Go是基于Inferno操作系统所开发的。Go于2009年11月正式宣布推出，成为开放源代码项目，并在Linux及Mac OS X平台上进行了实现，后来追加了Windows系统下的实现。


Go的语法接近C语言，但对于变量的声明有所不同。Go支持垃圾回收功能。Go的并行模型是以东尼·霍尔的通信顺序进程（CSP）为基础，采取类似模型的其他语言包括Occam和Limbo，但它也具有Pi运算的特征，比如通道传输。在1.8版本中开放插件（Plugin）的支持，这意味着现在能从Go中动态加载部分函数。与C++相比，Go并不包括如枚举、异常处理、继承、泛型、断言、虚函数等功能，但增加了 切片(Slice) 型、并发、管道、垃圾回收、接口（Interface）等特性的语言级支持。Go 2.0版本将支持泛型，对于断言的存在，则持负面态度，同时也为自己不提供类型继承来辩护。不同于Java，Go内嵌了关联数组（也称为哈希表（Hashes）或字典（Dictionaries）），就像字符串类型一样。

当前有两个Go编译器分支，分别为官方编译器gc和gccgo。官方编译器在初期使用C写成，后用Go重写从而实现自举。Gccgo是一个使用标准GCC作为后端的Go编译器。官方编译器支持跨平台编译（但不支持CGO），允许将源代码编译为可在目标系统、架构上执行的二进制文件。

### 概念

- 模块
介绍函数、错误处理、数组、映射、单元测试和编译的简短主题教程。
- 泛型
- 

### 基本命令

> go env -w GOBIN=/path/to/your/bin  # 设置BIN安装目录 go install 安装目录

### 安装

1. 下载

2. 配置环境变量

$> export GOROOT=/usr/local/go     # GO安装目录
$> export PATH=$PATH:$GOROOT/bin
$> export GOPATH=/home/go          # 设置工作目录

3. 验证

$> go version


### 案例

1. 初始化

$> mkdir helloworld && cd helloworld && go mod init example/hello

2. vim main.go

```go main.go
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
```

2. 运行

$> go run .

