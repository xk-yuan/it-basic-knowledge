# Net Protocol

> 网络协议

> OSI（Open System Interconnection，开放式系统互联）

> netwox 网络工具集工具, lauconstantin 开发的一款网络工具集，适用群体为网络管理员和网络黑客，它可以创造任意的 TCP、UDP 和 IP 数据报文


## 简介

![](https://pic2.zhimg.com/80/v2-7d2e4c0776af712f5437bc99104f10bd_720w.jpg)

网络是计算机或类似计算机的网络设备的集合，它们之间通过各种传输介质进行连接。无论设备之间如何连接，网络都是将来自于其中一台网络设备上的数据，通过传输介质传输到另外一台网络设备上。

网络设备, 指的是网络组成中的设备，如交换机、路由器、调制解调器等。它们是发送或接收数据的终端设备。

  网络电缆, 用来连接网络中的各个设备，供设备之间进行数据通信。常见的网络电缆有双绞线、光纤、电话线等。

  网卡, 也被称为网络适配器（Network Adapter），数据链路层工作，是连接计算机和传输介质的接口。主要用来将计算机数据转换为能够通过传输介质传输的信号。实现与传输介质的物理连接和电信号匹配，同时还负责帧的发送与接收、帧的封装与拆封、介质访问控制、数据的编码与解码以及数据缓存的功能等。
  
  调制解调器（Modem），俗称“猫”，是一种计算机硬件。它能把计算机的数字信号翻译成可沿普通电话线传送的脉冲信号，而这些脉冲信号又可被线路另一端的另一个调制解调器接收，并翻译为计算机的数字信号语言。

  中继器 （Repeater）, 在物理层运行， 2 端口设备。放大信号，从而延长信号在同一网络上传输的长度。

  集线器 （Hub）, 在物理层运行，基本上是一个多端口中继器。不能过滤数据，因此数据包将发送到所有连接的设备（广播）。集线器都有碰撞检测功能，每次只允许一个设备发送广播信号，效率低。

  网桥 （Bridge）, 数据链路层运行，2 端口设备。跟集线器相比，网桥可以通过读取源和目的地的 MAC 地址来过滤内容，从而隔离网络。将一个局域网分成两个，可以减少碰撞。

  交换机（Switch）, 在数据链路层运行，是一个多端口网桥。可以将多个网络设备连接起来组成一个局域网。它是一种用于电（光）信号转发的网络设备，用来进行数据交换。

  路由器（Router）又称网关设备（Gateway），网络层运行，类似交换机，但是根据 IP 地址发送数据包。用于连接多个逻辑上分开的网络。所谓逻辑网络是代表一个单独的网络或者一个子网。

  网关（gateway）, 将两个网络连接在一起的通道，可以在不同的网络协议下工作。网关也称为协议转换器，可以在任何网络层运行。网关通常比交换机或路由器更复杂。路由器可以在相同网络间移动数据，相当于特殊的网关（IP 网关）。


网络协议是网络运行的基石。在网络中，网络设备、传输介质、网卡又各有不同，数据在传输过程中也会使用不同的规则进行传输，而这些规则是依靠网络协议完成的。

网络协议为计算机网络中进行数据交换而建立的规则、标准或约定的集合，它规定了通信时信息必须采用的格式和这些格式所代表的意义。网络协议使网络上各种设备能够相互交换信息。


1. TCP/IP 协议

TCP/IP 协议是 Internet 网络的基础协议，它不是一个协议，而是一个协议族的统称。

在 20 世纪 70 年代前半叶，ARPANET（全球互联网的祖先）中的一个研究机构研发了 TCP/IP，直到 1983 年成为 ARPANET 网络中唯一指定的协议，后来逐步演变为现有的 TCP/IP 协议族。TCP/IP 协议族包括 TCP 协议、IP 协议和 ICMP 协议和 HTTP 协议等。

基于 TCP/IP 的参考模型，可以将协议分成 4 个层次，从上到下分别为应用层、传输层、网际层和网络访问层。分层以后，层中的协议只负责该层的数据处理。

![](http://c.biancheng.net/uploads/allimg/191106/6-191106095UD36.gif)

a. 应用层

  为应用程序提供服务并规定应用程序中相关的通信细节。

b. 传输层

  为两台主机上的应用程序提供端到端的通信，提供流量控制、错误控制和确认服务。

c. 网际层

  提供独立于硬件的逻辑寻址，从而让数据能够在具有不同的物理结构的子网之间传递。负责寻找地址和路由选择的同时，网络层还可以实现拥塞控制、网际互联等功能。

d. 网络访问层

  提供了与物理网络连接的接口。针对传输介质设置数据格式，根据硬件的物理地址实现数据的寻址，对数据在物理网络中的传递提供错误控制。


2. OSI 协议层次

OSI 协议层次结构就是现在常说的 OSI 参考模型（Open System Interconnection Reference Model），它是国际标准化组织（ISO）提出的一个标准框架，定义了不同计算机互连的标准，目的是使世界范围内的各种计算机互连起来，构成一个网络。


OSI 框架是基于 1984 年国际标准化组织（ISO）发布的 ISO/IEC 7498 标准，该标准定义了网络互联的 7 层框架，自下而上依次为物理层、数据链路层、网络层、传输层、会话层、表示层和应用层。

![](http://c.biancheng.net/uploads/allimg/191106/6-19110609555N63.gif)

a. 应用层

  为应用程序提供服务并规定应用程序中相关的通信细节。常见的协议包括超文本传输协议（HTTP）、简单邮件传送协议（SMTP）和远程登录（Telnet）协议等。

b. 表示层

  将应用处理的信息转换为适合网络传输的格式，或将来自下一层的数据转换为上层能够处理的格式。该层主要负责数据格式的转换，确保一个系统的应用层信息可被另一个系统应用层读取。

c. 会话层

  负责建立和断开通信连接（数据流动的逻辑通路），以及记忆数据的分隔等数据传输相关的管理。

d. 传输层

  只在通信双方的节点上（比如计算机终端）进行处理，无须在路由器上处理。

e. 网络层

  将数据传输到目标地址，主要负责寻找地址和路由选择，网络层还可以实现拥塞控制、网际互联等功能。

f. 数据链路层

  负责物理层面上互连的节点间的通信传输。例如，一个以太网相连的两个节点之间的通信。该层的作用包括：物理地址寻址、数据的成帧、流量控制、数据的检错和重发等。

g. 物理层

  利用传输介质为数据链路层提供物理连接，实现比特流的透明传输。


## 协议

**1. 数据链路层协议**

Ethernet (以太网协议), MAC 地址

**2. 网络层协议**

IP协议 , IPv4 / TPv6

**3. 传输层协议**

TCP

UDP

**4. 应用层协议**

HTTP/1.0, HTTP/2.0

DNS

ARP

5. 路由协议

RIP (Routing Information Protocol, 路由信息协议)

OSPF (Open Shortest Path First, 开放式最短路径优先)

IS-IS ()

BGP (Border Gateway Protocol, 边界网关协议)

