# JDBC


## 资源

> [官网](https://docs.oracle.com/javase/tutorial/jdbc/)
>
>  - [JDBC 简介](https://docs.oracle.com/javase/tutorial/jdbc/overview/index.html)
>
>  - [JDBC 基础](https://docs.oracle.com/javase/tutorial/jdbc/basics/index.html)


> [百度百科-JDBC](https://baike.baidu.com/item/Java数据库连接/1173389)
>
> [JDBC 使用说明](https://www.runoob.com/w3cnote/jdbc-use-guide.html)
>
> [浅谈JDBC的理解（一）](https://blog.csdn.net/zdb292034/article/details/81705876)


## 简介

JDBC (Java Database Connectivity, Java数据库连接), 是Java语言中用来规范客户端程序如何来访问数据库的应用程序接口，提供了诸如查询和更新数据库中数据的方法。JDBC API 是一种 Java API，可以访问任何类型的表格数据，尤其是存储在关系数据库中的数据。

JDBC也是Sun Microsystems的商标。我们通常说的JDBC是面向关系型数据库的。

是一种用于执行SQL语句的Java API，可以为多种关系数据库提供统一访问，它由一组用Java语言编写的类和接口组成。JDBC提供了一种基准，据此可以构建更高级的工具和接口，使数据库开发人员能够编写数据库应用程序。

JDBC 是个"低级"接口，也就是说，它用于直接调用 SQL 命令。在这方面它的功能极佳，并比其它的数据库连接 API 易于使用，但它同时也被设计为一种基础接口，在它之上可以建立高级接口和工具。高级接口是"对用户友好的"接口，它使用的是一种更易理解和更为方便的 API，这种API在幕后被转换为诸如 JDBC 这样的低级接口。

JDBC API 既支持数据库访问的两层模型（C/S），同时也支持三层模型（B/S）。


> JDBC驱动程序共分四种类型

1. JDBC-ODBC桥

这种类型的驱动把所有JDBC的调用传递给ODBC，再让后者调用数据库本地驱动代码

2. 本地API驱动

这种类型的驱动通过客户端加载数据库厂商提供的本地代码库（C/C++等）来访问数据库，而在驱动程序中则包含了Java代码。

3. 网络协议驱动

这种类型的驱动给客户端提供了一个网络API，客户端上的JDBC驱动程序使用套接字（Socket）来调用服务器上的中间件程序，后者在将其请求转化为所需的具体API调用。

4. 本地协议驱动

这种类型的驱动使用Socket，直接在客户端和数据库间通信。


> JDBC API主要位于JDK中的java.sql包中（之后扩展的内容位于javax.sql包中）

- DriverManager      负责加载各种不同驱动程序（Driver），并根据不同的请求，向调用者返回相应的数据库连接（Connection）。

- Driver             驱动程序，会将自身加载到DriverManager中去，并处理相应的请求并返回相应的数据库连接（Connection）。

- Connection         数据库连接，负责与进行数据库间通讯，SQL执行以及事务处理都是在某个特定Connection环境中进行的。可以产生用以执行SQL的Statement。

- Statement          用以执行SQL查询和更新（针对静态SQL语句和单次执行）。

- PeparedStatement   用以执行包含动态参数的SQL查询和更新（在服务器端编译，允许重复执行以提高效率）。

- CallableStatement  用以调用数据库中的存储过程。

- SQLException       代表在数据库连接的建立和关闭和SQL语句的执行过程中发生了例外情况（即错误）。


> 编程使用步骤

1. 加载驱动

```java
Class.forName(driverClass);

// 加载MySql驱动
Class.forName("com.mysql.jdbc.Driver");
// 加载Oracle驱动
// Class.forName("oracle.jdbc.driver.OracleDriver");
```

2. 建立连接

```java
DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/imooc", "root", "root");
```

3. 通过连接, 创建操作对象 (Statement\PreparedStatement)

```java
conn.createStatement();
conn.prepareStatement(sql);
```

4. 通过操作对象, 执行SQL, 并处理执行结果

> 案例

> 增删改查

```java
import java.util.Date;

// 模型
public class Goddess {

    private Integer id;
    private String user_name;
    private Integer sex;
    private Integer age;
    private Date birthday; // 注意用的是java.util.Date
    private String email;
    private String mobile;
    private String create_user;
    private String update_user;
    private Date create_date;
    private Date update_date;
    private Integer isDel;
}

// DAO
import liulx.db.DbUtil;
import liulx.model.Goddess;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class GoddessDao {
    // 增加
    public void addGoddess(Goddess g) throws SQLException {
        // 获取连接
        Connection conn = DbUtil.getConnection();
        // sql
        String sql = "INSERT INTO imooc_goddess(user_name, sex, age, birthday, email, mobile,"+
            "create_user, create_date, update_user, update_date, isdel)"
                +"values("+"?,?,?,?,?,?,?,CURRENT_DATE(),?,CURRENT_DATE(),?)";
        // 预编译
        PreparedStatement ptmt = conn.prepareStatement(sql); //预编译SQL，减少sql执行

        // 传参
        ptmt.setString(1, g.getUser_name());
        ptmt.setInt(2, g.getSex());
        ptmt.setInt(3, g.getAge());
        ptmt.setDate(4, new Date(g.getBirthday().getTime()));
        ptmt.setString(5, g.getEmail());
        ptmt.setString(6, g.getMobile());
        ptmt.setString(7, g.getCreate_user());
        ptmt.setString(8, g.getUpdate_user());
        ptmt.setInt(9, g.getIsDel());

        // 执行
        ptmt.execute();
    }

    public void updateGoddess(){
        // 获取连接
        Connection conn = DbUtil.getConnection();
        // sql, 每行加空格
        String sql = "UPDATE imooc_goddess" +
                " set user_name=?, sex=?, age=?, birthday=?, email=?, mobile=?,"+
                " update_user=?, update_date=CURRENT_DATE(), isdel=? "+
                " where id=?";
        // 预编译
        PreparedStatement ptmt = conn.prepareStatement(sql); //预编译SQL，减少sql执行

        // 传参
        ptmt.setString(1, g.getUser_name());
        ptmt.setInt(2, g.getSex());
        ptmt.setInt(3, g.getAge());
        ptmt.setDate(4, new Date(g.getBirthday().getTime()));
        ptmt.setString(5, g.getEmail());
        ptmt.setString(6, g.getMobile());
        ptmt.setString(7, g.getUpdate_user());
        ptmt.setInt(8, g.getIsDel());
        ptmt.setInt(9, g.getId());

        // 执行
        ptmt.execute();
    }

    public void delGoddess(){
        // 获取连接
        Connection conn = DbUtil.getConnection();
        // sql, 每行加空格
        String sql = "delete from imooc_goddess where id=?";
        // 预编译SQL，减少sql执行
        PreparedStatement ptmt = conn.prepareStatement(sql);

        // 传参
        ptmt.setInt(1, id);

        // 执行
        ptmt.execute();
    }

    public List<Goddess> query() throws SQLException {
        Connection conn = DbUtil.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT user_name, age FROM imooc_goddess");

        List<Goddess> gs = new ArrayList<Goddess>();
        Goddess g = null;
        while(rs.next()){
            g = new Goddess();
            g.setUser_name(rs.getString("user_name"));
            g.setAge(rs.getInt("age"));

            gs.add(g);
        }
        return gs;
    }

    public Goddess get(){
        Goddess g = null;
        // 获取连接
        Connection conn = DbUtil.getConnection();
        // sql, 每行加空格
        String sql = "select * from  imooc_goddess where id=?";
        // 预编译SQL，减少sql执行
        PreparedStatement ptmt = conn.prepareStatement(sql);
        // 传参
        ptmt.setInt(1, id);
        // 执行
        ResultSet rs = ptmt.executeQuery();
        while(rs.next()){
            g = new Goddess();
            g.setId(rs.getInt("id"));
            g.setUser_name(rs.getString("user_name"));
            g.setAge(rs.getInt("age"));
            g.setSex(rs.getInt("sex"));
            g.setBirthday(rs.getDate("birthday"));
            g.setEmail(rs.getString("email"));
            g.setMobile(rs.getString("mobile"));
            g.setCreate_date(rs.getDate("create_date"));
            g.setCreate_user(rs.getString("create_user"));
            g.setUpdate_date(rs.getDate("update_date"));
            g.setUpdate_user(rs.getString("update_user"));
            g.setIsDel(rs.getInt("isdel"));
        }
        return g;
    }
}
```
