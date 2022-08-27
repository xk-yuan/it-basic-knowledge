# TCPDUMP

> LIUNX 命令，用于监听网络传输数据，支持针对网络层、协议、主机、网络或端口的过滤，并提供and、or、not等逻辑语句来帮助你去掉无用的信息

## 资源


## 


常见参数

> tcpdump -D

-D：列出可用于抓包的接口。将会列出接口的数值编号和接口名，它们都可以用于"-i"后。

-F：从文件中读取抓包的表达式。若使用该选项，则命令行中给定的其他表达式都将失效。
-w：将抓包数据输出到文件中而不是标准输出。可以同时配合"-G time"选项使得输出文件每time秒就自动切换到另一个文件。可通过"-r"选项载入这些文件以进行分析和打印。
-r：从给定的数据包文件中读取数据。使用"-"表示从标准输入中读取。

> tcpdump -i ens33

-i interface：指定tcpdump需要监听的接口，any 关键字表示捕获所有网络接口

> 输出显示参数

-e         输出的每行中都将包括数据链路层头部信息，例如源MAC和目标MAC。
-q         快速打印输出。即打印很少的协议相关信息，从而输出行都比较简短。
-X         输出包的头部数据，会以16进制和ASCII两种方式同时输出。
-XX        输出包的头部数据，会以16进制和ASCII两种方式同时输出，更详细。
-v         当分析和打印的时候，产生详细的输出。
-vv        产生比-v更详细的输出。
-vvv       产生比-vv更详细的输出。

> tcpdump -i ens33  监视指定网络接口的数据包

> tcpdump host host_name  监视指定主机的数据包，例如所有进入或离开host_name的数据包

> tcpdump -i ens33 host 192.168.3.1

> tcpdump -i ens33 -w tmp.pcap  # 输出，pcap 文件，wireshark 分析

> tcpdump -i ens33 -c 100 -Xvnn -s0 host 192.168.3.1 and port 22  # 抓取指定IP和端口的包，-s0 防止包截断，-Xvnn 显示详细信息, -c 只获取指定包数

> tcpdump -i any -c 20 -Xvnn -s0 host 39.156.69.79 and port 80 -w tmp.pcap # 捕获，获取HTTP请求


10.218.65.42:8904

tcpdump -i any -c 20 -Xvnn -s0 host 39.156.69.79 and port 80 -w tmp.pcap

tcpdump -i ens33 -Xvnn -s0 host 10.34.17.21 -w tmp.pcap

tcpdump -i eth0 -Xvnn -s0 host 10.218.65.42 -w tmp.pcap

tcpdump -i eth0 -Xvnn -s0 host 10.123.234.35 -w tmp.pcap

tcpdump -i eth0 -Xvnn -s0 host 100.65.39.24 -w tmp.pcap

tcpdump -i eth0 -Xvnn -s0 port 8081 -w tmp.pcap

tcpdump -i eth0 -Xvnn -s0 host 10.34.17.20 port 3452 -w tmp.pcap

## 安装

> yum install tcpdump -y

```bash
# tcpdump --version
tcpdump version 4.9.2
libpcap version 1.5.3
OpenSSL 1.0.2k-fips  26 Jan 2017

# tcpdump --help
tcpdump version 4.9.2
libpcap version 1.5.3
OpenSSL 1.0.2k-fips  26 Jan 2017

Usage: tcpdump [-aAbdDefhHIJKlLnNOpqStuUvxX#] [ -B size ] [ -c count ]
		[ -C file_size ] [ -E algo:secret ] [ -F file ] [ -G seconds ]
		[ -i interface ] [ -j tstamptype ] [ -M secret ] [ --number ]
		[ -Q|-P in|out|inout ]
		[ -r file ] [ -s snaplen ] [ --time-stamp-precision precision ]
		[ --immediate-mode ] [ -T type ] [ --version ] [ -V file ]
		[ -w file ] [ -W filecount ] [ -y datalinktype ] [ -z postrotate-command ]
		[ -Z user ] [ expression ]

> -a                 尝试将网络和广播地址转换成名称

> -d                 把编译过的数据包编码转换成可阅读的格式，并输出到标准输出
> -dd                把编译过的数据包编码转换成C语言的格式，并输出到标准输出
> -ddd               把编译过的数据包编码转换成十进制数字的格式，并输出到标准输出
> -e 在每列倾倒资料上显示连接层级的文件头
-f 用数字显示网际网络地址
-F<表达文件> 指定内含表达方式的文件。
。
-l 使用标准输出列的缓冲区。

-N 不列出域名。
-O 不将数据包编码最佳化。
-r<数据包文件> 从指定的文件读取数据包数据。
-s<数据包大小> 设置每个数据包的大小。
-S 用绝对而非相对数值列出TCP关联数。
-t 在每列倾倒资料上不显示时间戳记。
-tt 在每列倾倒资料上显示未经格式化的时间戳记。
-T<数据包类型> 强制将表达方式所指定的数据包转译成设置的数据包类型。
-v 详细显示指令执行过程。
-vv 更详细显示指令执行过程。
-x 用十六进制字码列出数据包资料。
-w<数据包文件> 把数据包数据写入指定的文件


> -c <数据包数目>     指定抓包数量
> -i <网络界面>       指定tcpdump需要监听的接口。默认会抓取第一个网络接口
> -n                 对地址以数字方式显式，否则显式为主机名，也就是说-n选项不做主机名解析
> -nn                除了-n的作用外，还把端口显示为数值，否则显示端口服务名
-p 不让网络界面进入混杂模式。
> -P                 指定要抓取的包是流入还是流出的包。可以给定的值为"in"、"out"和"inout"，默认为"inout"
> -s len：设置tcpdump的数据包抓取长度为len，如果不设置默认将会是65535字节

tcpdump [-adeflnNOpqStvx] [-c<数据包数目>] [-dd][-ddd][-F<表达文件>] [-i<网络界面>] [-r<数据包文件>] [-s<数据包大小>][-tt][-T<数据包类型>][-vv][-w<数据包文件>][输出数据栏位]


-e：输出的每行中都将包括数据链路层头部信息，例如源MAC和目标MAC。
-q：快速打印输出。即打印很少的协议相关信息，从而输出行都比较简短。
-X：输出包的头部数据，会以16进制和ASCII两种方式同时输出。c
-XX：输出包的头部数据，会以16进制和ASCII两种方式同时输出，更详细。
-v：当分析和打印的时候，产生详细的输出。
-vv：产生比-v更详细的输出。
-vvv：产生比-vv更详细的输出。

-D：列出可用于抓包的接口。将会列出接口的数值编号和接口名，它们都可以用于"-i"后。
-F：从文件中读取抓包的表达式。若使用该选项，则命令行中给定的其他表达式都将失效。
-w：将抓包数据输出到文件中而不是标准输出。可以同时配合"-G

time"选项使得输出文件每time秒就自动切换到另一个文件。可通过"-r"选项载入这些文件以进行分析和打印。

```

### 离线安装

> [libcap](http://www.tcpdump.org/release/libpcap-1.5.3.tar.gz)

tar zxvf libpcap-1.5.3.tar.gz && cd libpcap-1.5.3 
  
./configure

make

make install

> [tcpdump](http://www.tcpdump.org/release/tcpdump-4.5.1.tar.gz)

tar zxvf tcpdump-4.5.1.tar.gz   && cd tcpdump-4.5.1
  
./configure

make

make install



