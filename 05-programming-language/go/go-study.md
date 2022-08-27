# GO 语言学习

> go1.18.3.windows-386

## 学习思路架构


## 笔记

### 第一部分、编程语言概述

#### 语言安装及命令使用

> 环境变量

GOROOT 配置GO安装路径, 指示工具链和标准库存放位置
GOPATH
工作空间 workspace, 项目目录

GOBIN  强制替代工作空间BIN目录

> 基础命令

```
go1.18.3
├─api
├─bin
│  ├─go.exe
│  └─gofmt.exe
├─doc
├─lib
│  └─time
├─misc
├─pkg
│  └─tool/windows_386
│        ├─addr2line.exe
│        ├─asm.exe
│        ├─buildid.exe
│        ├─cgo.exe
│        ├─compile.exe
│        ├─cover.exe
│        ├─dist.exe
│        ├─doc.exe
│        ├─fix.exe
│        ├─go_bootstrap.exe
│        ├─link.exe
│        ├─nm.exe
│        ├─objdump.exe
│        ├─pack.exe
│        ├─pprof.exe
│        ├─test2json.exe
│        ├─trace.exe
│        └─vet.exe
├─src
└─test

- src GO标准库,源码目录
```

go list net/... # 搜索包


### 第二部分、编程语言基础架构

#### 高级语言特性

> 包模块管理/依赖管理

包(package)由一个或多个保存在同一目录下(不含子目录)的源码文件组成。包用途类似命名空间(namespace), 是成员作用域和访问权限的边界。

导入包，使用标准库或第三方包时，需要使用import导入，搜索是以src为起始的绝对路径。编译器从标准库开始搜索，然后一次搜索GOPATH列表中的各个工作空间。除了使用默认包名，可以使用别名解决同名冲突问题。

包名和目录名，不是强制必须保持一致。import 导入参数是路径，而非包名。代码中引用成员时，使用包名而非目录名。不能直接或间接导入自身，不支持任何形式的循环导入。同一目录下所有源码文件必须使用相同包名称。

包权限，所有成员包内可以直接访问，无论是否同一源码文件中。首字母大写为导出成员，包外可以访问 (指针转换可以绕过限制)。内部包机制(internal), 仅能被其父目录下的包(含所有层次子目录)访问。








