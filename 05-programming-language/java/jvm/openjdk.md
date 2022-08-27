# openjdk

> openjdk, 源码分析及编译


## 资源

> [openjdk](http://hg.openjdk.java.net/)
>
>   - [github](https://github.com/openjdk/jdk)
>
> **DOWNLAOD**
>
>  - jdk17-JSR 392
>    - [Oracle Linux 8.3 x64 Java 开发工具包](https://download.java.net/openjdk/jdk17/ri/openjdk-17+35_linux-x64_bin.tar.gz)
>    - [Windows 10 x64 Java 开发工具包](https://download.java.net/openjdk/jdk17/ri/openjdk-17+35_windows-x64_bin.zip)
>    - [openjdk-17](https://download.java.net/openjdk/jdk17/ri/openjdk-17+35_src.zip)
>  - jdk16-JSR 391
>    - [Oracle Linux 7.8 x64 Java 开发工具包](https://download.java.net/openjdk/jdk16/ri/openjdk-16+36_linux-x64_bin.tar.gz)
>    - [Windows 10 x64 Java 开发工具包](https://download.java.net/openjdk/jdk16/ri/openjdk-16+36_windows-x64_bin.zip)
>    - [openjdk-16](https://download.java.net/openjdk/jdk16/ri/openjdk-16+36_src.zip)
>  - jdk15-JSR 390
>    - [Oracle Linux 7.5 x64 Java 开发工具包](https://download.java.net/openjdk/jdk15/ri/openjdk-15+36_linux-x64_bin.tar.gz)
>    - [Windows 10 x64 Java 开发工具包](https://download.java.net/openjdk/jdk15/ri/openjdk-15+36_windows-x64_bin.zip)
>    - [openjdk-15](https://download.java.net/openjdk/jdk15/ri/openjdk-15+36_src.zip)
>  - jdk14-JSR 389
>    - [Oracle Linux 7.6 x64 Java 开发工具包](https://download.java.net/openjdk/jdk14/ri/openjdk-14+36_linux-x64_bin.tar.gz)
>    - [Windows 10 x64 Java 开发工具包](https://download.java.net/openjdk/jdk14/ri/openjdk-14+36_windows-x64_bin.zip)
>    - [openjdk-14](https://download.java.net/openjdk/jdk14/ri/openjdk-14+36_src.zip)
>  - jdk13-JSR 388
>    - [Oracle Linux 7.3 x64 Java 开发工具](https://download.java.net/openjdk/jdk13/ri/openjdk-13+33_linux-x64_bin.tar.gz)
>    - [Windows 10 x64 Java 开发工具包](https://download.java.net/openjdk/jdk13/ri/openjdk-13+33_windows-x64_bin.zip)
>    - [openjdk-13](https://download.java.net/openjdk/jdk13/ri/openjdk-13+33_src.zip)
>  - jdk12-JSR 386
>    - [Oracle Linux 7.3 x64 Java 开发工具包](https://download.java.net/openjdk/jdk12/ri/openjdk-12+32_linux-x64_bin.tar.gz)
>    - [Windows 10 x64 Java 开发工具包](https://download.java.net/openjdk/jdk12/ri/openjdk-12+32_windows-x64_bin.zip)
>    - [openjdk-12](https://download.java.net/openjdk/jdk12/ri/openjdk-12+32_src.zip)
>  - jdk11-JSR 384
>    - [Linux/x64 Java 开发工具包](https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz)
>    - [Windows 10 x64 Java 开发工具包](https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_windows-x64_bin.zip)
>    - [openjdk-11](https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_src.zip)
>  - jdk10-JSR 383
>    - [Linux x64 Java 开发工具包](https://download.java.net/openjdk/jdk10/ri/openjdk-10+44_linux-x64_bin_ri.tar.gz)
>    - [Linux x64 Java 开发工具包](https://download.java.net/openjdk/jdk10/ri/jdk-10_linux-x64_bin_ri.tar.gz)
>    - [Windows 10 x64 Java 开发工具包](https://download.java.net/openjdk/jdk10/ri/jdk-10+44_windows-x64_bin_ri.tar.gz)
>    - [openjdk-10](https://download.java.net/openjdk/jdk10/ri/openjdk-10_src.zip)
>  - jdk9-JSR 379
>    - [Linux x64 Java 开发工具包](https://download.java.net/openjdk/jdk9/ri/openjdk-9+181_linux-x64_ri.zip)
>    - [Linux x64 Java 开发工具包](https://download.java.net/openjdk/jdk9/ri/jdk-9+181_linux-x64_ri.zip)
>    - [Windows 10 x64 Java 开发工具包](https://download.java.net/openjdk/jdk9/ri/jdk-9+181_windows-x64_ri.zip)
>    - [openjdk-9](https://download.java.net/openjdk/jdk9/ri/openjdk-9_src.zip)
>  - jdk8-JSR 337
>    - [Oracle Linux 7.6 x64 Java 开发工具包](https://download.java.net/openjdk/jdk8u41/ri/openjdk-8u41-b04-linux-x64-14_jan_2020.tar.gz)
>    - [Windows 10 i586 Java 开发工具包](https://download.java.net/openjdk/jdk8u41/ri/openjdk-8u41-b04-windows-i586-14_jan_2020.zip)
>    - [openjdk-8](https://download.java.net/openjdk/jdk8u41/ri/openjdk-8u41-src-b04-14_jan_2020.zip)
>  - jdk7-JSR 336
>    - [Linux x64 二进制文件](https://download.java.net/openjdk/jdk7u75/ri/openjdk-7u75-b13-linux-x64-18_dec_2014.tar.gz)
>    - [Linux x64 二进制文件](https://download.java.net/openjdk/jdk7u75/ri/jdk_ri-7u75-b13-linux-x64-18_dec_2014.tar.gz)
>    - [Windows i586 二进制文](https://download.java.net/openjdk/jdk7u75/ri/jdk_ri-7u75-b13-windows-i586-18_dec_2014.zip)
>    - [openjdk-7](https://download.java.net/openjdk/jdk7u75/ri/openjdk-7u75-src-b13-18_dec_2014.zip)

> - jdk6
>    - [](http://openjdk.java.net/projects/jdk6/)
>    - [](http://download.java.net/openjdk/jdk6/promoted/b27/openjdk-6-src-b27-26_oct_2012.tar.gz)

### 

> [Ubuntu编译OpenJdk8 - 指定 make , gcc , g++ 版本](https://blog.csdn.net/dghgfhk/article/details/103356051)

> [Ubuntu20.04.1系统下使用Clion搭建openjdk15源码环境](https://blog.csdn.net/qq_41813208/article/details/110674500) // 直接import, 导入成功后 创建Create CMakeList.txt
>
> [Clion导入OpenJDK8源码阅读](https://www.yht7.com/news/94710)

```sh linux 编译
sudo apt install m4 ant gawk
sudo apt install libxrender-dev xutils-dev libmotif-dev
sudo apt install libmotif3 x11proto-print-dev xorg-dev       # 未安装

sudo apt install ccache && apt-cache depends build-essential
```


## 简介

> Q: OpenJDK 与 OracleJDK的区别 ？

Oracle JDK由Oracle公司开发，该公司是Sun许可证，基于Java标准版规范实现。它以二进制产品的形式发布。该许可证宣布将根据GPL（通用公共许可证）许可证发布。Oracle JDK包含许多组件作为库形式的编程工具集合。

OpenJDK是Java SE平台版的开源和免费实现，它是Sun Corporation（现在的Oracle Corporation）于2006年开始的开发结果。它是根据GNU GPL许可证授权的。它是使用C ++和Java编程语言编写的。是Java SE Platform Edition的官方参考实现。

Oracle JDK的构建过程基于OpenJDK，因此OpenJDK与Oracle JDK之间没有技术差异。

Oracle JDK将更多地关注稳定性，它重视更多的企业级用户，而OpenJDK经常发布以支持其他性能，这可能会导致不稳定。

Oracle JDK具有Flight Recorder，Java Mission Control和Application Class-Data Sharing功能，Open JDK具有Font Renderer功能，这是OpenJDK与Oracle JDK之间的显着差异。

Oracle JDK具有良好的GC选项和更好的渲染器，而OpenJDK具有更少的GC选项，并且由于其包含自己的渲染器的分布，因此具有较慢的图形渲染器选项。


## 编译安装

### 1. 下载解压

### 2. 环境安装配置

#### a. 编译环境 ubuntu-20.04.3 + openjdk

> uname -a
Linux ubuntu 5.11.0-37-generic #41~20.04.2-Ubuntu SMP Fri Sep 24 09:06:38 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux

> 针对 ubuntu 环境的 openjdk 各版本编译测试

> ubuntu-20.04.3 (gcc-9 + g++-9 + make-4)

$ export LANG=C && unset JAVA_HOME && unset CLASSPATH

#### b. 阅读编译说明文档, 分析编译步骤, 从 openjdk17 到 openjdk7

- openjdk/README-builds.html
- openjdk/doc/building.html
- openjdk/doc/building.md


### 3. 编译

> 从openjdk17到openjdk7, 开始测试编译

#### openjdk17

> 1. sudo chmod a+x configure && ./configure --with-boot-jdk=/home/xknower/Desktop/openjdk/jdk16/jdk-16

> 2. 安装依赖

$ sudo apt-get install autoconf

$ sudo apt install binutils build-essential # Q: Cannot find GNU make 3.81 or newer! Please put it in the path, or add e.g. MAKE=/opt/gmake3.81/make as argument to configure.

- gcc-9.3.0 、g++-9.3.0 、make-4.2.1

$ sudo apt install libx11-dev # Q: Could not find X11 libraries.

$ sudo apt install libxt-dev libxtst-dev libxrender-dev libxext-dev libxrandr-dev libxi-dev # Q: Could not find all X11 headers (shape.h Xrender.h Xrandr.h XTest.h Intrinsic.h).

$ sudo apt install libcups2-dev # Q: Could not find cups!

$ sudo apt install libfontconfig1-dev # Q: Could not find fontconfig!

- sudo apt install libfreetype6-dev   # 未测试是否有效

$ sudo apt install libasound2-dev # Q: Could not find alsa!

> 3. 配置

> 4. make

#### openjdk16

> 1. sudo chmod a+x configure && ./configure --with-boot-jdk=/home/xknower/Desktop/openjdk/jdk15/jdk-15

> 2. 其他 - [同jdk17](#openjdk17)

#### openjdk15

> 1. sudo chmod a+x configure && ./configure --with-boot-jdk=/home/xknower/Desktop/openjdk/jdk14/jdk-14

> 2. 其他 - [同jdk17](#openjdk17)

#### openjdk14

> 1. sudo chmod a+x configure && ./configure --with-boot-jdk=/home/xknower/Desktop/openjdk/jdk13/jdk-13

> 2. 其他 - [同jdk17](#openjdk17)

> 3. 配置

- Q: src/jdk.incubator.jpackage/unix/native/libapplauncher/PosixPlatform.cpp:36 /usr/include/x86_64-linux-gnu/sys/sysctl.h:21:2: error: #warning "The <sys/sysctl.h> header is deprecated and will be removed." [-Werror=cpp]

解决: 注释文件 /usr/include/x86_64-linux-gnu/sys/sysctl.h 中 #warning "The <sys/sysctl.h> header is deprecated and will be removed."

> 4. make


#### openjdk13

> 1. sudo chmod a+x configure && ./configure --with-boot-jdk=/home/xknower/Desktop/openjdk/jdk12/jdk-12

> 2. 其他 - [同jdk17](#openjdk17)

> 3. 配置

- Q: src/hotspot/share/utilities/debug.hpp:100:20: error: ‘%s’ directive argument is null [-Werror=format-overflow=]

> 4. make **(编译不通过)**

#### openjdk12

> 1. sudo chmod a+x configure && ./configure --with-boot-jdk=/home/xknower/Desktop/openjdk/jdk11/jdk-11

> 2. 其他 - [同jdk17](#openjdk17)

> 3. 配置

- Q: /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:34: error: ‘char* __builtin_strncpy(char*, const char*, long unsigned int)’ output truncated before terminating nul copying as many bytes from a string as its length [-Werror=stringop-truncation]

> 4. make **(编译不通过)**

#### openjdk11

> 1. sudo chmod a+x configure && ./configure --with-boot-jdk=/home/xknower/Desktop/openjdk/jdk10/jdk-10

> 2. 其他 - [同jdk17](#openjdk17)

> 3. 配置

- Q: src/hotspot/share/adlc/dfa.cpp:724:14: error: ‘char* strncat(char*, const char*, size_t)’ specified bound 2048 equals destination size [-Werror=stringop-overflow=]

> 4. make **(编译不通过)**

#### openjdk10

> 1. sudo chmod a+x configure && ./configure --with-boot-jdk=/home/xknower/Desktop/openjdk/jdk9/java-se-9-ri/jdk-9/

> 2. 其他 - [同jdk17](#openjdk17)

> 3. 配置

- Q: src/hotspot/cpu/x86/assembler_x86.cpp:199:12: error: ‘*((void*)& rspec +32)’ may be used uninitialized in this function [-Werror=maybe-uninitialized]

> 4. make **(编译不通过)**

#### openjdk9

> 1. sudo chmod a+x configure && ./configure --with-boot-jdk=/home/xknower/Desktop/openjdk/jdk8/java-se-8u41-ri

> 2. 安装依赖 - [同jdk17](#openjdk17)

$ # Q: configure: WARNING: libelf not found, cannot build AOT. You might be able to fix this by running 'sudo apt-get install libelf-dev'.

> 3. 配置

- Q: hotspot/src/os/linux/vm/os_linux.inline.hpp:109:18: error: ‘int readdir_r(DIR*, dirent*, dirent**)’ is deprecated [-Werror=deprecated-declarations]

> 4. make **(编译不通过)**

#### openjdk8

> 1. sudo chmod a+x configure && ./configure --with-boot-jdk=/home/xknower/Desktop/openjdk/jdk7/java-se-7u75-ri

> 2. 安装依赖 - [同jdk17](#openjdk17)

$ # Q: Build performance tip: ccache gives a tremendous speedup for C++ recompilations. fix this by running 'sudo apt-get install ccache'.

> 3. 配置

- Q: This OS is not supported: Linux ubuntu 5.11.0-37-generic #41~20.04.2-Ubuntu SMP Fri Sep 24 09:06:38 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux

解决: 在文件 hotpot/make/linux/Makefile 中 查找 SUPPORTED_OS_VERSION 新增 4% 5%, 其 限制了只能某些版本的kernel 可使用

- Q: error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]

解决: 宏与字符串之间连接, 必须加空格分割

```log
hotspot/src/share/vm/memory/generation.hpp:425:17:/425:42 error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]
hotspot/src/share/vm/memory/threadLocalAllocBuffer.inline.hpp:97:25:/98:25:/99:25:/100:25: error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]
hotspot/src/share/vm/memory/cardTableModRefBS.hpp:161:20:/162:20:/162:69:/439:20:/440:20:/440:69:/448:20:/449:20:/449:69: error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]
hotspot/src/share/vm/trace/traceStream.hpp:43:15:/47:15:/51:15:/55:15:/59:15:/63:15:/67:15: error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]
hotspot/src/share/vm/gc_implementation/g1/g1Allocator.hpp:81:21:/81:66: error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]
hotspot/src/share/vm/gc_implementation/g1/heapRegion.hpp:55:19:/55:39:/55:52:/115:15:/115:32:/115:46: error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]
hotspot/src/share/vm/gc_implementation/g1/collectionSetChooser.hpp:95:20:/95:46: error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]
hotspot/src/share/vm/gc_implementation/g1/heapRegionManager.inline.hpp:34:17:/34:35:/36:17:/36:35: error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]
hotspot/src/share/vm/gc_implementation/g1/g1CollectedHeap.inline.hpp:49:18:/49:72:/49:114:/62:15:/62:35:、62:85: error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]
hotspot/src/share/vm/gc_implementation/g1/g1BlockOffsetTable.inline.hpp:52:18:/52:43:/55:18:/5:37: error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]
```

- Q: error: ‘int readdir_r(DIR*, dirent*, dirent**)’ is deprecated [-Werror=deprecated-declarations]

hotspot/src/os/linux/vm/os_linux.inline.hpp:127:18:/127:42:/127:42: error: ‘int readdir_r(DIR*, dirent*, dirent**)’ is deprecated [-Werror=deprecated-declarations]

- Q: error: left operand of shift expression ‘(-1 << 28)’ is negative [-fpermissive]

hotspot/src/share/vm/oops/cpCache.hpp:194:42: error: left operand of shift expression ‘(-1 << 28)’ is negative [-fpermissive]
openjdk/hotspot/src/share/vm/code/dependencies.hpp:169:59: error: left operand of shift expression ‘(-1 << 1)’ is negative [-fpermissive]

[](https://blog.csdn.net/desiyonan/article/details/80801899)
[](https://blog.csdn.net/yelang0/article/details/98441701)

- Q: error: enumerator value for ‘option_bits_mask’ is not an integer constantPool

hotspot/src/share/vm/oops/cpCache.hpp:194:104: error: enumerator value for ‘option_bits_mask’ is not an integer constantPool
hotspot/src/share/vm/code/dependencies.hpp:169:72: error: enumerator value for ‘all_types’ is not an integer constant

> 4. make **(编译不通过)**




### 4. 扩展文档

> [安装指定版本 gcc g++, 并选择版本](https://blog.csdn.net/EternallyAccompany/article/details/108865331)

```sh
$ sudo gedit /etc/apt/sources.list

deb http://ubuntu.mirror.cambrium.nl/ubuntu/ lucid main universe

deb http://dk.archive.ubuntu.com/ubuntu xenial main
deb http://dk.archive.ubuntu.com/ubuntu xenial universe

deb http://mirrors.aliyun.com/ubuntu/ xenial main
deb-src http://mirrors.aliyun.com/ubuntu/ xenial main

deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main

deb http://mirrors.aliyun.com/ubuntu/ xenial universe
deb-src http://mirrors.aliyun.com/ubuntu/ xenial universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates universe

deb http://mirrors.aliyun.com/ubuntu/ xenial-security main
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main
deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security universe

$ sudo apt-get update  # 更新源

$ apt-cache policy gcc-4.9  # 查看可安装版本, sudo apt-get install gcc-5=5.4.0-6ubuntu1~16.04.12 # 选择指定版本进行安装

$ sudo apt-get install gcc-5 g++-5  # 安装指定版本gcc g++
$ sudo apt-get install gcc-4.9 g++-4.9

$ ls /usr/bin/gcc*  # 查看已经安装的gcc版本

$ sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100  # 设置优先级
$ sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100
$ sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 100
$ sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 100

$ sudo update-alternatives --config gcc  # 选择版本号
$ sudo update-alternatives --config g++

$ sudo update-alternatives --remove /usr/bin/gcc-4.9 # 删除设置优先级
```

> 安装 gcc4.3 [下载](http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-4.3/)

```
> 下载
wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-4.3/gcc-4.3_4.3.4-10ubuntu1_amd64.deb
wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-4.3/g++-4.3_4.3.4-10ubuntu1_amd64.deb

wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-4.3/g++-4.3-multilib_4.3.4-5ubuntu1_amd64.deb
wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-4.3/gcc-4.3-base_4.3.4-10ubuntu1_amd64.deb
wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-4.3/gcc-4.3-multilib_4.3.4-10ubuntu1_amd64.deb
wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-4.3/libstdc++6-4.3-dbg_4.3.4-10ubuntu1_amd64.deb

> 安装

sudo dpkg --force-depends -i gcc-4.3_4.3.4-10ubuntu1_amd64.deb
sudo dpkg --force-depends -i g++-4.3_4.3.4-10ubuntu1_amd64.deb

sudo dpkg --force-depends -i  gcc-4.3-base_4.3.4-10ubuntu1_amd64.deb

sudo dpkg -r g++-4.3
sudo dpkg -r gcc-4.3
sudo dpkg -r gcc-4.3-base
```


### 5. 问题解决

Q: hotspot/src/os/linux/vm/os_linux.inline.hpp:127:18: warning: 'int readdir_r(DIR*, dirent*, dirent**)' is deprecated [-Wdeprecated-declarations]

解决: 在文件 hotspot/make/linux/makefiles/gcc.make 将 WARNINGS_ARE_ERRORS = -Werror 改成 WARNINGS_ARE_ERRORS = -Wno-all [参考](https://www.cnblogs.com/iou123lg/p/9696039.html)

Q: hotspot/src/share/vm/oops/cpCache.hpp:194:42: error: left operand of shift expression '(-1 << 28)' is negative [-fpermissive]
Q: hotspot/src/share/vm/oops/cpCache.hpp:194:104: error: enumerator value for 'option_bits_mask' is not an integer constant

https://blog.csdn.net/wobushixiaobailian/article/details/83794764
<!-- 
Q: configure: error: Could not find all X11 headers (shape.h Xrender.h Xrandr.h XTest.h Intrinsic.h).

解决: sudo apt-get install libx11-dev libxext-dev libxrender-dev libxtst-dev libxt-dev
 -->



