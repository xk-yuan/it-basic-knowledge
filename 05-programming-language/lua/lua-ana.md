# LUA 源码分析

> lua-5.4.3

> 分析过程
> 1. 源码文件功能分析
> 2. 自顶向下, 为各个文件 英文注释翻译
> 3. 疏通业务流程

## 项目结构

```c
lua-5.4.3
│
├ doc
│
├ complie.bat           // windows编译命令脚本
├ Makefile              // linux编译命令脚本
├ .gitignore
├ README
│
└ src                   // 源码目录, 共63个文件, 头文件28个, c文件34个
    │
    ├  lapi.c
    ├  lapi.h
    ├  lauxlib.c
    ├  lauxlib.h
    ├  lbaselib.c
    ├  lcode.c
    ├  lcode.h
    ├  lcorolib.c        //
    ├  lctype.c          //
    ├  lctype.h
    ├  ldblib.c
    ├  ldebug.c
    ├  ldebug.h
    ├  ldo.c
    ├  ldo.h
    ├  ldump.c
    ├  lfunc.c
    ├  lfunc.h
    ├  lgc.c
    ├  lgc.h
    ├  linit.c
    ├  liolib.c
    ├  ljumptab.h
    ├  llex.c
    ├  llex.h
    ├  llimits.h
    ├  lmathlib.c
    ├  lmem.c
    ├  lmem.h
    ├  loadlib.c
    ├  lobject.c
    ├  lobject.h
    ├  lopcodes.c
    ├  lopcodes.h
    ├  lopnames.h
    ├  loslib.c
    ├  lparser.c
    ├  lparser.h
    ├  lprefix.h
    ├  lstate.c
    ├  lstate.h
    ├  lstring.c
    ├  lstring.h
    ├  lstrlib.c
    ├  ltable.c
    ├  ltable.h
    ├  ltablib.c
    ├  ltm.c
    ├  ltm.h
    ├  lua.c
    ├  lua.h
    ├  lua.hpp
    ├  luac.c            //
    ├  luaconf.h
    ├  lualib.h
    ├  lundump.c
    ├  lundump.h
    ├  lutf8lib.c        // 
    ├  lvm.c
    ├  lvm.h
    ├  lzio.c
    ├  lzio.h
    └ Makefile
```

## 项目架构分析

![项目架构图](https://img-blog.csdnimg.cn/20200409172211534.jpg)

### 整体架构分析

> 1. 虚拟机核心功能部分 (15个文件)

- lua.c      lua的可执行入口 main函数
- lapi.c	 C语言接口
- ldebug.c   Debug 接口 
- ldo.c      函数调用以及栈管理 
- lfunc.c    函数原型及闭包管理
- lgc.c      垃圾回收机制
- lmem.c     内存管理接口
- lobject.c  对象操作函数
- lopcodes.c 虚拟机字节码定义
- lstate.c   全局状态机， 管理全局信息
- lstring.c  字符串池
- ltable.c   表类型的相关操作 
- ltm.c      元方法
- lvm.c      虚拟机
- lzio.c     输入流接口

> 2. 源代码解析和预编译 (5个文件)

- lcode.c    代码生成器
- ldump.c    序列化预编译的Lua 字节码
- llex.c     词法分析器
- lparser.c  解析器
- lundump.c  还原预编译的字节码

> 3. 内嵌库 (10个文件)

- lauxlib.c  库编写用到的辅助函数库
- lbaselib.c 基础库
- ldblib.c   Debug 库
- linit.c    内嵌库的初始化
- liolib.c   IO 库
- lmathlib.c 数学库
- loadlib.c  动态扩展库管理
- loslib.c   OS 库
- lstrlib.c  字符串库
- ltablib.c  表处理库

### 文件分析

- lapi.h / lapi.c
- lcode.h / lcode.c
- lctype.h / lctype.c
- ldebug.h / ldebug.c
- ldo.h / ldo.c
- lfunc.h / lfunc.c
- lgc.h / lgc.c
- llex.h / llex.c
- lmem.h / lmem.c
- lobject.h / lobject.c
- lopcodes.h / lopcodes.c
- lparser.h / lparser.c
- lstate.h / lstate.c
- lstring.h / lstring.c
- ltable.h / ltable.c
- ltm.h / ltm.c
- lua.h / lua.hpp / lua.c
- lundump.h / lundump.c
- lvm.h / lvm.c
- lzio.h / lzio.c
- ldump.c
- linit.c
- ljumptab.h
- llimits.h
- lopnames.h
- lprefix.h
- luac.c
- luaconf.h

> 功能库

- lauxlib.h / lauxlib.c
- lbaselib.c
- lcorolib.c
- ldblib.c
- liolib.c
- lmathlib.c
- loadlib.c
- loslib.c
- lstrlib.c
- ltablib.c
- lualib.h
- lutf8lib.c

