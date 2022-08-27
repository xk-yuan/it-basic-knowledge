# thrift

>

## 资源

> [官网](https://thrift.apache.org/)
>
>  - [下载](https://dlcdn.apache.org/thrift/0.15.0/thrift-0.15.0.exe)
>
>  - [下载](https://dlcdn.apache.org/thrift/0.9.3/thrift-0.9.3.exe)
>
>  - [github](https://github.com/apache/thrift)

> [百度百科 - thrift](https://baike.baidu.com/item/thrift/3879058)
>
> [thrift rpc 框架的安装和使用](https://www.cnblogs.com/newboys/p/9366762.html)

> [gRPC vs Thrift](https://blog.csdn.net/dazheng/article/details/48830511)


## 简介

thrift, 是Facebook 由Facebook于2007年开发，2008年进入Apache开源项目, 的一款开源跨语言的RPC(Remote Procedure Call, 远程过程调用)框架。其通过一个中间语言IDL(接口定义语言)来定义RPC的数据类型和接口, 其内容定义在.thrift文件中, 通过编译器来生成不同语言的代码,以满足不同需要的开发者, 成的代码中不但包含目标语言的接口定义,方法,数据类型,还包含有RPC协议层和传输层的实现代码。

Thrift 是用于点对点 RPC 实现的轻量级、独立于语言的软件堆栈。Thrift 为数据传输、数据序列化和应用程序级处理提供了清晰的抽象和实现。代码生成系统将简单的定义语言作为输入，并生成跨编程语言的代码，这些编程语言使用抽象堆栈来构建可互操作的 RPC 客户端和服务器。

![](https://images2015.cnblogs.com/blog/870109/201702/870109-20170221155000163-876398090.png)

![](https://github.com/apache/thrift/blob/master/doc/images/thrift-layers.png)


### 使用案例

1. 定义 thrift 接口文件

```thrift Apple.thrift
namespace java service.demo
service Apple {
    string appleString(1:string para);
    i32 appleAdd(1:i32 para);
    i32 appleMult(2:i32 para1,i32 para2);
}
```

2. 编译 thrift 接口文件, 生成 java 接口文件

$> thrift -r -gen java Apple.thrift

3. 创建 java 项目, 导入依赖

```xml
<dependency>
    <groupId>org.apache.thrift</groupId>
    <artifactId>libthrift</artifactId>
    <version>0.10.0</version>
</dependency>
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-log4j12</artifactId>
    <version>1.7.5</version>
</dependency>
```

4. 接口实现类

```java 接口实现类
package service.demo;
 
import org.apache.thrift.TException;
 
public class AppleServiceImpl implements Apple.Iface {
 
    @Override
    public String appleString(String para) throws TException {
         
        return "apple print hello " + para;
    }
 
    @Override
    public int appleAdd(int para) throws TException {
        // TODO Auto-generated method stub
        return para+10;
    }
 
    @Override
    public int appleMult(int para1, int para2) throws TException {
        // TODO Auto-generated method stub
        return para1-para2;
    }
 
}
```

```java 服务端
package service.demo;
 
import org.apache.thrift.TProcessor;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.server.TServer;
import org.apache.thrift.server.TSimpleServer;
import org.apache.thrift.transport.TServerSocket;
import org.apache.thrift.transport.TTransportException;
 
public class AppleServiceServer {
 
    public static void main(String[] args) throws TTransportException {
        System.out.println("apple 服务端开启。。");
        TProcessor tprocessor = new Apple.Processor<Apple.Iface>(new AppleServiceImpl());
        TServerSocket serverTransport = new TServerSocket(9000);
        TServer.Args tArgs = new TServer.Args(serverTransport);
        tArgs.processor(tprocessor);
        tArgs.protocolFactory(new TBinaryProtocol.Factory());
         
        TServer server = new TSimpleServer(tArgs);
        server.serve();
    }
 
}
```

```java 客户端
package service.demo;
 
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.apache.thrift.transport.TTransportException;
 
import service.demo.Apple.Client;
 
public class AppleServiceClient {
 
    public static void main(String[] args) {
        System.out.println("客户端开始。。");
        TTransport transport = null;
        try{
            transport = new TSocket("localhost",9000,3000);
            TProtocol protocol = new TBinaryProtocol(transport);
            Client client = new Apple.Client(protocol);
            transport.open();
             
            String result = client.appleString("abc");
            System.out.println("服务端返回  。  " + result);
             
            int a = client.appleAdd(8);
            int b = client.appleMult(29, 3);
            System.out.println("a= " + a + "  b="+b);
             
        }catch(TTransportException e){
            e.printStackTrace();
        }catch(TException e){
            e.printStackTrace();
        }finally{
            if(null!=transport){
                transport.close();
            }
        }
    }
}
```

