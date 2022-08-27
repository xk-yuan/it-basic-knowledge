# wireshark

> 

## 资源

> [官网](http://www.wireshark.org)

> [WinPCAP](https://www.winpcap.org/)
>
> [WinPCAP-WIN10](http://www.win10pcap.org/download/)


https://blog.csdn.net/jasonhongcn/article/details/85199768


## 简介

wireshark 是一款网络封包分析软件, 其功能是撷取网络封包，并尽可能显示出最为详细的网络封包资料。Wireshark使用WinPCAP作为接口，直接与网卡进行数据报文交换。

1997年底，GeraldCombs需要一个能够追踪网络流量的工具软件作为其工作上的辅助。因此他开始撰写Ethereal软件。并在1998年7月释出其第一个版本v0.2.0。

2006年6月，因为商标的问题，Ethereal更名为Wireshark。

> 

Frame                           物理层的数据帧概况
Ethernet II                     数据链路层以太网帧头部信息
Internet Protocol Version 4     互联网层IP包头部信息
Transmission Control Protocol   传输层T的数据段头部信息，此处是TCP
Hypertext Transfer Protocol     应用层的信息，此处是HTTP协议

## 实现远程抓包

> 1. 安装 rpcapd

yum install -y glibc-static flex

wget https://www.winpcap.org/archive/4.1.1-WpcapSrc.zip  # https://www.winpcap.org/archive/
unzip 4.1.1-WpcapSrc.zip && cd winpcap/wpcap/libpcap

chmod +x configure runlex.sh
CFLAGS=-static ./configure --prefix=/usr/local/winpcap --sysconfdir=/etc/winpcap
make

cd rpcapd && make

./rpcapd -n -d                   # 后台启动, 默认端口 2002

./rpcapd -b 192.168.20.173 -p 80

tar zcvf wpcap-4.1.1.tar.gz winpcap

> 2. wireshark : 主界面 --->> 捕获--->> 选项（Ctrl +k）--->> 捕获接口--->> 管理接口（右下角）--->>远程接口--->> 选择 左下角的 ” + “  进行添加远程接口。

![](https://img-blog.csdn.net/20160727230057980)

> Q: configure: error: Your operating system's lex is insufficient to compile libpcap.  flex is a lex replacement that has many advantages, including
 being able to compile libpcap.

解决，安装 flex

> Q: socket(): Address family not supported by protocol (code 97)

解决，端口没有开放，开放端口 2002 或者 换一个端口


## 过滤器表达式

抓包过滤器类型 Type（host、net、port）
方向          Dir（src、dst）
协议          Proto（ether、ip、tcp、udp、http、icmp、ftp等）
逻辑运算符

### 抓包过滤器语法

ip.src eq 127.0.0.1 or ip.dst eq 127.0.0.1  过滤，源或目的地址为 127.0.0.1

1. 协议过滤

直接输入协议名（小写 ）

2. IP 过滤

host 192.168.1.104 src

host 192.168.1.104 dst

host 192.168.1.104

3. 端口过滤

port 80 src port 80 dst port 80

4. 逻辑运算符过滤 (&& 与、|| 或、！非)

连接两个过滤表达式

### 显示过滤器

1. 比较操作符

== 等于、!= 不等于、> 大于、< 小于、>= 大于等于、<=小于等于

1. 逻辑运算符为 and/or/not

过滤多个条件组合时，使用and/or

2. 协议过滤

3. IP 过滤

ip == 127.0.0.1
ip.src == 127.0.0.1  显示源地址
ip.dst == 127.0.0.1  显示目的地址
ip.addr == 127.0.0.1 显示源地址或目的地址

4. 端口过滤

tcp.port == 80       显示源主机或者目的主机端口为80的数据包列表
udp.port == 80
tcp.srcport == 80    只显示TCP协议的源主机端口为80的数据包列表
tcp.dstport == 80    只显示TCP协议的目的主机端口为80的数据包列表

5. Http模式过滤

http.request.method == GET  只显示HTTP GET方法的


