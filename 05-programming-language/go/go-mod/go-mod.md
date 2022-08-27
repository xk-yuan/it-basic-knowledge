# go mod

> 模块机制

> 版本 : go version go1.17.6 windows/amd64 (>go1.11)

> 配置 : GO111MODULE = on, GOPROXY = https://goproxy.cn,https://mirrors.aliyun.com/goproxy/,https://athens.azurefd.net,direct

## 资源

> [gomod](https://go.dev/doc/modules/gomod-ref)


> [项目迁往go mod](https://blog.csdn.net/zxxshaycormac/article/details/115228192)
>
> [Go 坑记之 引用自己另外工程的包的做法(go mod 伪深度体验)](https://blog.csdn.net/Uman/article/details/122063092)
>
> [go mod模式下引用本地包/模块(module)的方法](https://blog.csdn.net/huzhenwei/article/details/113049514)
>
> [go mod位置和自定义包引入问题](https://www.jianshu.com/p/dd58da3100d7)
>
> [golang如何引用自己写的项目？](https://segmentfault.com/q/1010000019616121)
>
> [golang学习笔记-go mod的使用](https://www.cnblogs.com/lizhewei/p/13974105.html)


> [Golang 项目架构中的一点思考](https://www.jianshu.com/p/fced6e751ada)
>
> [浅谈Facade层,Service层,DAO层设计原则](https://blog.csdn.net/jasph77/article/details/2566274)
>
> [该如何组织 Go 项目结构？](https://zhuanlan.zhihu.com/p/346573562)
>
> [分享一个Go项目的整洁架构模板](https://blog.csdn.net/kevin_tech/article/details/120591001)

> [如何将含有多个main子项目的大项目mod化](https://studygolang.com/articles/30487)


## 简介

Go 代码被分组到包中，包被分组到模块中。您的模块指定了运行代码所需的依赖项，包括 Go 版本和它所需的一组其他模块。当您在模块中添加或改进功能时，您会发布模块的新版本。编写调用模块中函数的代码的开发人员可以导入模块的更新包并使用新版本进行测试，然后再将其投入生产使用。


### go mod 命令

> go mod help

```log
$>go mod
Go mod provides access to operations on modules.

Note that support for modules is built into all the go commands,
not just 'go mod'. For example, day-to-day adding, removing, upgrading,
and downgrading of dependencies should be done using 'go get'.
See 'go help modules' for an overview of module functionality.

Usage:

        go mod <command> [arguments]

The commands are:

        download    download modules to local cache
        edit        edit go.mod from tools or scripts
        graph       print module requirement graph
        init        initialize new module in current directory
        tidy        add missing and remove unused modules
        vendor      make vendored copy of dependencies
        verify      verify dependencies have expected content
        why         explain why packages or modules are needed

Use "go help mod <command>" for more information about a command.
```

> go mod init   # 在项目中生成go.mod文件; 自动生成一个空的go.mod文件，说他是空的是因为此时该文件中不会标记任何包依赖
> go mod tidy   # 检索项目中使用的依赖并加入到go.mod文件中; 自动检索项目中使用的依赖，自动下载能够下载的那些依赖包，并记录在go.mod以及go.sum中, 部份依赖是本地别的项目，则执行该指令时会报错，会给我们指出是哪些依赖找不到
> go get -u     # 更新现有的依赖
>  - go get example.com/xx@latest
> go mod download # 下载go.mod文件中指明的所有依赖
> go mod edit     # 修改go.mod文件，直接vim应该也一样
>  - go mod edit -replace example.com/xx=../xx  # 该命令指定example.com/xx替换为../xx以定位依赖项。
> go mod vendor   # 导出现有的所有依赖
> go mod graph    # 查看现有的依赖结构
> go mod verify   # 校验一个模块是否被篡改过

> go list -m -u all # 列出当前模块的所有依赖项，以及每个模块可用的最新版本
> go list -m -u example.com/theirmodule # 显示可用于特定模块的最新版本


### go.mod 文件

require 表示引入的依赖模块
replace 表示本地项目引入依赖, 在引入本地项目的过程中，需要被依赖的本地项目也有go.mod文件，即也需要mod化

```go go.mod
module xx

go 1.17

require (
)


replace (
    xx => ../xx
)
```


### 旧项目改造成 go mod 项目

> 1. go mod init module_name
> 2. go mod tidy
> 3. go build

### 配置

> 项目自引用时各目录之间使用项目目录造成不便; 现在配置 mod 自引用来配置本地引用

> 1. 第一种配置

require github.com/xx v0.0.0-20190727134117-607096f6195c
replace github.com/xx => ./                                         # 这里是重点，即项目中"github.com/xx"相关引用路径会替换成项目根路径

使用时, 通过 github.com/xx 引入

> 2. 第二种配置

replace module_name => ../module_name  或 replace module_name => ./ # 这里是重点，即项目中"module_name"相关引用路径会替换成项目根路径

使用时, 通过 module_name/ 引入, 使用模块

