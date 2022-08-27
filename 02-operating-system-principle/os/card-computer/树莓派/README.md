# 树莓派

> Raspberry Pi, RasPi / RPI, 树莓派

## 资源

> [官网](http://www.raspberrypi.org) [](http://raspberrypi.com)
>
>   - [文档](https://www.raspberrypi.com/documentation/)
>
>   - [树莓派实验室](https://shumeipai.nxez.com/)

> [dfrobot](https://www.dfrobot.com.cn/)


> [百度百科-树莓派](https://baike.baidu.com/item/树莓派/80427)


> [低成本如何玩转树莓派?](https://www.zhihu.com/question/273507065)

> [树莓派能用来干什么?](https://www.zhihu.com/question/22741805)

> [树莓派新手入门教程](http://www.ruanyifeng.com/blog/2017/06/raspberry-pi-tutorial.html)


## 简介

树莓派，其是只有信用卡大小的微型电脑，基于Linux系统

![](https://bkimg.cdn.bcebos.com/pic/d62a6059252dd42a3fb0053b093b5bb5c8eab8e0?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxNTA=,g_7,xp_5,yp_5/format,f_auto)
![](https://bkimg.cdn.bcebos.com/pic/9358d109b3de9c8287cc8b016681800a18d84396?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U5Mg==,g_7,xp_5,yp_5/format,f_auto)

树莓派由注册于英国的 “Raspberry Pi 慈善基金会”开发，Eben·Upton/埃本·阿普顿 为项目带头人。

2012年3月，英国剑桥大学的埃本·阿普顿（Eben Upton）正式发售世界上最小的台式机，又称卡片式电脑，外形只有信用卡大小，却具有电脑的所有基本功能，这就是Raspberry Pi电脑板，中文译名"树莓派"。

在2006年树莓派早期概念是基于Atmel的 ATmega644单片机，首批上市的10000“台”树莓派的“板子”，由中国台湾和大陆厂家制造。

其是一款基于ARM的微型电脑主板，以SD/MicroSD卡为内存硬盘，卡片主板周围有1/2/4个USB接口和一个10/100 以太网接口（A型没有网口），可连接键盘、鼠标和网线，同时拥有视频模拟信号的电视输出接口和HDMI高清视频输出接口，以上部件全部整合在一张仅比信用卡稍大的主板上，具备所有PC的基本功能只需接通电视机和键盘，就能执行如电子表格、文字处理、玩游戏、播放高清视频等诸多功能。 Raspberry Pi B款只提供电脑板，无内存、电源、键盘、机箱或连线。

树莓派的生产是通过有生产许可的三家公司Element 14/Premier Farnell、RS Components及Egoman。这三家公司都在网上出售树莓派。

树莓派基金会提供了基于ARM的Debian和Arch Linux的发行版供大众下载。还计划提供支持Python作为主要编程语言，支持Java、BBC BASIC (通过 RISC OS 映像或者Linux的"Brandy Basic"克隆)、C 和Perl等编程语言。

> 型号：A型、A+型、B型、B+型、2代B型、3代B型、3代B+型、CM3 (Compute Module)、4代B型

树莓派早期有A和B两个型号，主要区别：A型：1个USB、无有线网络接口、功率2.5W, 500mA、256MB RAM；B型：2个USB、支持有线网络、功率3.5W，700mA、512MB RAM。

2014年7月和11月树莓派分别推出B+和A+两个型号，主要区别：Model A没有网络接口，将4个USB端口缩小到1个。另外，相对于Model B来讲，Model A内存容量有所缩小，并具备了更小的尺寸设计。Model A可以说是Model B廉价版本。虽说是廉价版本，但新型号Model A也支持同Model B一样的MicroSD卡读卡器、40-pin的GPI连接端口、博通BCM2385 ARM11处理器、256MB的内存和HDMI输出端口

从配置上来说，model B+使用了和model B相同的BCM2835芯片和512MB内存，但和前代产品相比较，B+版本的功耗更低，接口也更丰富。model B+将通用输入输出引脚增加到了40个，USB接口也从B版本的2个增加到了4个，除此之外，model B+的功耗降低了约0.5W到1W，旧款的SD卡插槽被换成了更美观的推入式microSD卡槽，音频部分则采用了低噪供电。从外形上来看，USB接口被移到了主板的一边，复合视频移到了3.5mm音频口的位置，此外还增加了四个独立的安装孔

- 树莓派A型与B型的区别

![树莓派model B+](https://bkimg.cdn.bcebos.com/pic/c83d70cf3bc79f3d137b0262b9a1cd11738b29ce?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U5Mg==,g_7,xp_5,yp_5/format,f_auto)

![树莓派电脑 B型Rev1](https://bkimg.cdn.bcebos.com/pic/b2de9c82d158ccbf84e3406418d8bc3eb1354115?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U5Mg==,g_7,xp_5,yp_5/format,f_auto)

树莓派A型内置256MB内存，带一个USB端口，不带有线网接口。

树莓派B型内置512MB内存，带两个USB端口，带100M有线网接口。

注：在2012年10月15日前发售的B型机器内存为256MB。

- 树莓派B型与B+型的区别

2014年7月，“树莓派B+”版本发布，依然采用 BCM2835 处理器以及和上一代树莓派相同的系统软件。内存也依然是512MB; 但是在几处关键部件做了改进。

● 更多的 GPIO 针脚，共有40针。(老版本是26针)
● 更多的USB接口，比老版本多2个，共有4个。并且对热插拔和过流保护做了改良。
● 用Micro SD插口替换了老的SD插口。
● 更低的功耗，降低了功耗0.5～1W。
● 音频优化，音频电路采用了专用的低噪音电源。
● 更简洁的外形，B+版本将USB接口和电路板边沿对齐了、移除AV接口，并在主板上做了4个固定孔，方便固定。

- 树莓派2 相比前代

● CPU 单线程速率为提升 1.5 倍（up by 1.5x）
● Sunspider 跑分提升 4 倍（4x faster）
● 基于 NEON 的多核视频解码速率提升 20 倍（20x faster）
● SysBench 整体多线程 CPU 分数为旧版的 6 倍（6x）

- 树莓派2B型与树莓派B型的区别

● 搭载900MHz 的四核处理器（900MHz quad-core ARM Cortex-A7 CPU ），预计性能6倍于之前的B+版本。
● 1GB LPDDR2 SDRAM，2倍于之前的B+版本。
● 与1代完全兼容。

由于CPU已经升级到 ARM Cortex-A7 系，所以树莓派2将支持运行全系列的 ARM GNU/Linux 发行版。包括 Ubuntu 甚至 微软的 Windows 10。

- 红版树莓派

2013年2月国内厂商深圳韵动电子取得了该产品在国内的生产及销售权限，为了便于区分市场，树莓派基金会规定韵动电子在中国大陆销售的树莓派一律采用红色的PCB，并去掉FCC及CE标示

- 树莓派3B型与树莓派2B型的区别

2016年2月，“树莓派3B版本发布。

● 搭载1.2GHz 的64位四核处理器（ARM Cortex-A53 1.2GHz 64-bit quad-core ARMv8 CPU）。
● 增加802.11 b/g/n无线网卡。
● 增加低功耗蓝牙4.1适配器。
● 最大驱动电流增加至2.5A。

- 树莓派4B型与树莓派3B+型的区别

2019年6月24日，“树莓派4B版本

![Raspberry Pi 4 Computer Model B](https://bkimg.cdn.bcebos.com/pic/11385343fbf2b21199a9fcacc48065380dd78e48?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto)

![图为美光LPDDR4颗粒，树莓派4B所用](https://bkimg.cdn.bcebos.com/pic/4bed2e738bd4b31c870175c8a29f307f9e2f07085224?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto)

● 搭载1.5GHz 的64位四核处理器（Broadcom BCM2711, Quad core Cortex-A72 (ARM v8) 64-bit SoC @ 1.5GHz）
● VideoCore VI GPU，支持 H.265 (4Kp60 decode)， H.264 (1080p60 decode, 1080p30 encode)，OpenGL ES 3.0 graphics
Raspberry Pi 4 Computer Model B
Raspberry Pi 4 Computer Model B
● 1GB/2GB/4GB LPDDR4 内存
● 全吞吐量千兆以太网 (PCI-E 通道)
● 支持Bluetooth 5.0, BLE
● 两个USB 3.0和两个USB 2.0 接口
● 双micro HDMI输出，支持4K分辨率
● microSD存储系统增加了双倍数据速率支持
● 先前版本的microUSB供电接口在树莓派4B型中变更为USB Type-C接口
● 驱动电流增加至3A

- 树莓派4B Rev1.2，即8GB RAM版本

2020年05月28日，树莓派基金会宣布，推出树莓派4B新SKU，即8GB RAM版本。
为了充分利用8GB RAM，树莓派还开发了基于Debian的64位专用操作系统。
其它方面，8GB版本相比于前一个版本，改进了电源问题。
TMHW对树莓派4B 8GB版本的测试显示，Web性能、7zip压缩、APP打开速度等方面，8GB对比4GB甚至不增反减。
另外，在32位系统中，可用RAM为7.8GB，64位系统缩减到了7.6GB。


