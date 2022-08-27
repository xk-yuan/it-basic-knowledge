# SSH (Secure Shell, 安全外壳协议)

> 

## 资源

> [openssh](http://www.openssh.com/)

> [ssh2 - nodejs](https://github.com/mscdex/ssh2)

> [rfc4251](https://tools.ietf.org/pdf/rfc4251.pdf)

> [](https://segmentfault.com/a/1190000011395818)



## 简介

1995年，芬兰学者Tatu Ylonen设计了SSH协议，将登录信息全部加密，成为互联网安全的一个基本解决方案，迅速在全世界获得推广，目前已经成为Linux系统的标准配置。

其由 IETF 的网络小组（Network Working Group）所制定，SSH 为建立在应用层基础上的安全协议，其专为远程登录会话和其他网络服务提供安全性的协议

由客户端和服务端的软件组成的，有两个不兼容的版本分别是：1.x和2.x。 用SSH 2.x的客户程序是不能连接到SSH 1.x的服务程序上去的。OpenSSH 2.x同时支持SSH 1.x和2.x。

客户端包含ssh程序以及像scp（远程拷贝）、slogin（远程登陆）、sftp（安全文件传输）等其他的应用程序，服务端一般是sshd进程，提供了对远程连接的处理，一般包括公共密钥认证、密钥交换、对称密钥加密和非安全连接。

组成：

1. 传输层协议 (The Transport Layer Protocol) [SSH-TRANS]

提供服务器认证，数据机密性，信息完整性等的支持。

2. 用户认证协议 (The User Authentication Protocol) [SSH-USERAUTH]

用户认证协议为服务器提供客户端的身份鉴别

3. 连接协议 (The Connection Protocol) [SSH-CONNECT]

连接协议将加密的信息隧道复用成若干个逻辑通道，提供给更高层的应用协议使用。它提供了交互式登录话路、远程命令执行、转发 TCP/IP 连接和转发 X11 连接。

