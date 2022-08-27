# openjdk

> openjdk17

## 资源


## 简介


## 架构

> openjdk 17 目录架构分析

1. 整体架构分析

```log    整体架构
openjdk17
    │
    ├── .github\workflows
    ├── .jcheck
    ├── .gitattributes
    ├── .gitignore
    ├── .hgtags
    ├── .src-rev
    ├── ADDITIONAL_LICENSE_INFO            # 附加许可证信息
    ├── ASSEMBLY_EXCEPTION
    ├── LICENSE                            # 许可证
    ├── configure                          # 配置脚本
    ├── CONTRIBUTING.md                    # 配置说明文档
    ├── Makefile                           # 编译Makefile脚本
    ├── README.md
    │
    ├── bin
    ├── build                              # 编译结果生成目录
    │   └── linux-x86_64-server-release
    ├── doc                                # 文档
    │   ├── building.html
    │   ├── building.md
    │   ├── hotspot-style.html
    │   ├── hotspot-style.md
    │   ├── hotspot-unit-tests.html
    │   ├── hotspot-unit-tests.md
    │   ├── ide.html
    │   ├── ide.md
    │   ├── testing.html
    │   └── testing.md
    ├── make                             # 编译Makefile脚本目录
    ├── test                             # 单元测试
    └── src                              # 源码目录
```

2. 源码目录架构分析

```log 源码目录架构分析

openjdk17
    │
    └── src
        ├── demo
        ├── hotspot                     # hotspot vm 目录
        ├── java.base
        │   ├── aix
        │   ├── linux
        │   ├── macosx
        │   ├── share
        │   │   ├── classes
        │   │   │   ├── com
        │   │   │   ├── java            # JAVA CLASSES 源码
        │   │   │   │   ├── io
        │   │   │   │   ├── lang
        │   │   │   │   ├── math
        │   │   │   │   ├── net
        │   │   │   │   ├── nio
        │   │   │   │   ├── security
        │   │   │   │   ├── text
        │   │   │   │   ├── time
        │   │   │   │   └── util
        │   │   │   │       ├── concurrent
        │   │   │   │       │   ├── atomic
        │   │   │   │       │   └── locks
        │   │   │   │       ├── function
        │   │   │   │       ├── jar
        │   │   │   │       ├── random
        │   │   │   │       ├── regex
        │   │   │   │       ├── spi
        │   │   │   │       ├── stream
        │   │   │   │       └── zip
        │   │   │   ├── javax
        │   │   │   ├── jdk
        │   │   │   ├── META-INF
        │   │   │   └── sun
        │   │   ├── conf
        │   │   ├── legal
        │   │   ├── lib
        │   │   ├── man
        │   │   └── native
        │   ├── unix
        │   └── windows
        ├── java.compiler
        ├── java.datatransfer
        ├── java.desktop
        ├── java.instrument
        ├── java.logging
        ├── java.management
        ├── java.management.rmi
        ├── java.naming
        ├── java.net.http
        ├── java.prefs
        ├── java.rmi
        ├── java.scripting
        ├── java.se
        ├── java.security.jgss
        ├── java.security.sasl
        ├── java.smartcardio
        ├── java.sql
        ├── java.sql.rowset
        ├── java.transaction.xa
        ├── java.xml
        ├── java.xml.crypto
        ├── jdk.accessibility
        ├── jdk.attach
        ├── jdk.charsets
        ├── jdk.compiler
        ├── jdk.crypto.cryptoki
        ├── jdk.crypto.ec
        ├── jdk.crypto.mscapi
        ├── jdk.dynalink
        ├── jdk.editpad
        ├── jdk.hotspot.agent
        ├── jdk.httpserver
        ├── jdk.incubator.foreign
        ├── jdk.incubator.vector
        ├── jdk.internal.ed
        ├── jdk.internal.jvmstat
        ├── jdk.internal.le
        ├── jdk.internal.opt
        ├── jdk.internal.vm.ci
        ├── jdk.internal.vm.compiler
        ├── jdk.internal.vm.compiler.management
        ├── jdk.jartool
        ├── jdk.javadoc
        ├── jdk.jcmd
        ├── jdk.jconsole
        ├── jdk.jdeps
        ├── jdk.jdi
        ├── jdk.jdwp.agent
        ├── jdk.jfr
        ├── jdk.jlink
        ├── jdk.jpackage
        ├── jdk.jshell
        ├── jdk.jsobject
        ├── jdk.jstatd
        ├── jdk.localedata
        ├── jdk.management
        ├── jdk.management.agent
        ├── jdk.management.jfr
        ├── jdk.naming.dns
        ├── jdk.naming.rmi
        ├── jdk.net
        ├── jdk.nio.mapmode
        ├── jdk.random
        ├── jdk.sctp
        ├── jdk.security.auth
        ├── jdk.security.jgss
        ├── jdk.unsupported
        ├── jdk.unsupported.desktop
        ├── jdk.xml.dom
        ├── jdk.zipfs
        ├── sample
        └── utils

```

3. hotspot 源码目录架构分析

```log

openjdk17
    │
    └── src
        └── hotspot                     # hotspot vm 目录
            ├── cpu                     # 各平台 CPU 相关源码 (汇编器、模板解释器、AD文件、部分runtime函数)
            │   ├── aarch64
            │   ├── arm
            │   ├── ppc
            │   ├── s390
            │   ├── x86
            │   └── zero
            ├── os                      # 各平台操作系统相关源码
            │   ├── aix
            │   ├── bsd
            │   ├── linux
            │   ├── posix
            │   └── windows
            ├── os_cpu                  # 各平台 操作系统与CPU 组合相关源码
            │   ├── aix_ppc
            │   ├── bsd_aarch64
            │   ├── bsd_x86
            │   ├── bsd_zero
            │   ├── linux_aarch64
            │   ├── linux_arm
            │   ├── linux_ppc
            │   ├── linux_s390
            │   ├── linux_x86
            │   ├── linux_zero
            │   ├── windows_aarch64
            │   └── windows_x86
            └── share                   # 平台无关通用源码
                ├── adlc                # 平台描述文件 (CPU或OS_CPU里面二点*ad文件)的编译器
                │   └── main.cpp # 程序启动入口
                ├── asm                 # 汇编器接口
                ├── c1                  # client编译器 (C1)
                ├── cds
                ├── ci                  # 动态编译器的公共服务/从动态编译器到VM的几口
                ├── classfile           # 类文件的处理 (类加载和系统符号表等)
                ├── code                # 动态生成代码管理
                ├── compiler            # VM 动态编译器接口
                ├── gc                  # GC 实现
                ├── include
                │   ├── cds.h
                │   ├── jmm.h
                │   ├── jvm_constants.h
                │   ├── jvm.h
                │   └── jvm_io.h
                ├── interpreter         # 解释器, 包括 模板解释器和C++解释器
                ├── jfr
                ├── jvmci
                ├── libadt              # ADT 一些抽象数据结构
                ├── logging
                ├── memory              # 内存管理相关 (包含老的GC框架)
                ├── metaprogramming
                ├── oops                # HotSpot VM的对象系统的实现
                ├── opto                # server编译器 (C2)
                ├── precompiled
                ├── prims               # HotSpot VM 的对外接口, 包括部分标准库的native和JVMTI实现
                ├── runtime             # 运行时支持库 (包括线程管理、编译器调度、锁、反射等)
                ├── services            # 支持 JMX等的管理功能接口
                └── utilities           # 基本工具类
```


