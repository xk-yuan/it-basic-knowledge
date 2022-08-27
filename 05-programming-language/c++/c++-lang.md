# C++ 语言

> c++ 语言, 基础核心知识体系, 学习整理笔记

> 专注于, C++语言本身(除去C语言特性), 最核心部分的知识学习, 以及笔记整理

## 资源

[](https://en.cppreference.com/w/cpp/header)
[](http://www.sunistudio.com/cppfaq/)
[](http://www.hal9k.com/cug/)

## 目录

> **1. 语言概述**
>
> **2. 核心概念**
>
> - 01. 程序结构
>
> - 02. Lambda 函数与表达式
>
> - 03. 字符串
>
> - 04. 引用
>
> **3.特性概念**
>
> - 01. 面向对象程序设计 (向对象开发的四大特性)
>   - 面向对象四大特性: 封装, 抽象, 继承, 多态
>   - 类 & 对象
>   - 继承
>   - 重载运算符和重载函数
>   - 多态 (编译时多态和运行时的多态)
>   - 数据抽象
>   - 数据封装
>   - 接口（抽象类）
>   - this指针
>   - 虚基类, 避免二义性, 在继承时使用 virtual 描述
>   - 虚函数 (动态联编, 实现运行时多态), 虚析构函数
>   - 纯虚函数, 抽象类
>
> - 02. 异常处理
>
> - 03. 命名空间
>
> - 04. 模板
>
> **4. 标准库**
>
> - 01. 基础操作
>
>   - 文件和流
>   - 动态内存
>   - 信号处理
>   - 多线程
>   - Web 编程
>
> - 02. 标准模板库 (STL)
>
>   - iostream 定义了 cin、cout、cerr 和 clog 对象，分别对应于标准输入流、标准输出流、非缓冲标准错误流和缓冲标准错误流
>   - iomanip  参数化的流操纵器, 声明对执行标准化 I/O 有用的服务
>   - fstream  文件处理声明服务
>   - ctime    日期时间操作库
>
> **5. 功能库**
>
> **6. 平台库**
>
>   - linux平台库
>     - unistd.h
>
>   - windows平台库
>     - windows.h


### 1. 语言概述

C++ 由 Bjarne Stroustrup 于 1979 年在贝尔实验室开始设计开发的。C++ 进一步扩充和完善了 C 语言，是一种面向对象的程序设计语言。C++ 被认为是一种中级语言，它综合了高级语言和低级语言的特点。

C++ 进一步扩充和完善了 C 语言，最初命名为带类的C，后来在 1983 年更名为 C++。C++ 是 C 的一个超集，事实上，任何合法的 C 程序都是合法的 C++ 程序。

C++ 是一种静态类型的、编译式的、通用的、大小写敏感的、不规则的编程语言，支持**过程化编程**、**面向对象编程**和**泛型编程**。使用静态类型的编程语言是在编译时执行类型检查，而不是在运行时执行类型检查。


### 02. 核心概念

#### 02.01. 程序结构

> 1. 简单程序结构

```cpp
#include <iostream>

using namespace std;

int main()
{
    cout << "Hello, world!" << endl;
    return 0;
}
// #include         包含引入头文件
// using namespace  使用命名空间 std
```

> 2. 关键字 , 63关键字

```cpp

>

int
short
long
float
double
char
wchar_t  // C++新增, 宽字符型，typedef short int wchar_t;
bool     // C++新增, 布尔型
true
false

unsigned
signed

struct
union

void
enum
typedef
sizeof

>

auto         // 从 C++ 17 开始，auto 关键字不再是 C++ 存储类说明符，auto 关键字用于两种情况：声明变量时根据初始化表达式自动推断该变量的类型、声明函数时函数返回值的占位符。
const
const_cast   //

static       // 在生命周期内保持局部变量的存在，不需每次都创建和销毁。用于在函数调用之间保持局部变量的值。也可以应用于全局变量，会使变量的作用域限制在声明它的文件内。
static_cast  // C++新增
register     // 从 C++ 17 开始，register 关键字被弃用。用于定义存储在寄存器中而不是 RAM 中的局部变量。
volatile
extern       // 用于提供一个全局变量的引用，全局变量对所有的程序文件都是可见的, 对于无法初始化的变量，会把变量名指向一个之前定义过的存储位置。用于当有两个或多个文件共享相同的全局变量或函数

mutable      // C++新增, 仅适用于类的对象, 允许对象的成员替代常量。也就是说，mutable 成员可以通过 const 成员函数修改。

>

if
else
switch
case
default
continue
break
return
for
do
while
goto

> 以下全为C++新增关键字

try
catch
throw

> 面向对象

class
this
private
protected
public
operator
virtual

friend    // 友元函数, 定义在函数前面, 即把外部的函数声明为友元类型，赋予它可以访问类内私有成员的权利。
// 友元的对象，它可以是全局的一般函数，也可以是其他类里的成员函数，这种叫做友元函数。不仅如此，友元还可以是一个类，这种叫做友元类。友元并不属于这个类本身，无论是友元函数还是友元类。都不能使用类内的this指针，同时也不可以被继承。
inline    // 内联函数, 定义在函数前面, 表示 编译的时候，把函数代码插入到函数调用处，从而免去函数调用的一系列过程
// 内联函数与register变量类似，仅仅是我们提给编译器的一个请求，最终是否真正会实现内联，由编译器根据情况自行选择

> 命名空间

using
namespace

> 泛型

template
typename

> 内存分配

new
delete

>

export
explicit
typeid
reinterpret_cast
dynamic_cast
asm
```

#### 02.02. Lambda 函数与表达式

C++11 提供了对匿名函数的支持, 称为 Lambda 函数(也叫 Lambda 表达式)

Lambda 表达式把函数看作对象。Lambda 表达式可以像对象一样使用，比如可以将它们赋给变量和作为参数传递，还可以像函数一样对其求值。

Lambda 表达式本质上与函数声明非常类似。

- Lambda 表达式

[capture](parameters)->return-type{body}; // [](int x, int y){ return x < y ; }

[capture](parameters){body}; // 没有返回值表示, []{ ++global_x; } 


在Lambda表达式内可以访问当前作用域的变量，这是Lambda表达式的闭包（Closure）行为。 与JavaScript闭包不同，C++变量传递有传值和传引用的区别。

[]      // 沒有定义任何变量。使用未定义变量会引发错误。
[x, &y] // x以传值方式传入（默认），y以引用方式传入。
[&]     // 任何被使用到的外部变量都隐式地以引用方式加以引用。
[=]     // 任何被使用到的外部变量都隐式地以传值方式加以引用。
[&, x]  // x显式地以传值方式加以引用。其余变量以引用方式加以引用。
[=, &z] // z显式地以引用方式加以引用。其余变量以传值方式加以引用。

对于[=]或[&]的形式，lambda 表达式可以直接使用 this 指针。但是，对于[]的形式，如果要使用 this 指针，必须显式传入：[this]() { this->someFunc(); }();

#### 02.03. 字符串

C++ 提供了以下两种类型的字符串表示形式，C 风格字符串 以及 C++ 引入的 string 类类型

1. C 风格的字符串起源于 C 语言，并在 C++ 中继续得到支持。字符串实际上是使用 null 字符 \0 终止的一维字符数组。

2. string 类

C++ 标准库提供了 string 类类型，需要引入库，#include <string>

#### 02.04. 引用

引用变量是一个别名，也就是说，它是某个已存在变量的另一个名字。一旦把引用初始化为某个变量，就可以使用该引用名称或变量名称来指向变量。

引用和指针是不同概念：

不存在空引用，引用必须连接到一块合法的内存; 一旦引用被初始化为一个对象，就不能被指向到另一个对象，指针可以在任何时候指向到另一个对象。引用必须在创建时被初始化，指针可以在任何时间被初始化。

- 定义引用

type &name = var; // & 读作引用 , name 是一个初始化为变量 var 的 type 引用

引用通常用于函数参数列表和函数返回值。引用作为参数，C++ 支持把引用作为参数传给函数，这比传一般的参数更安全。引用作为返回值，以从 C++ 函数中返回引用，就像返回其他数据类型一样。

当返回一个引用时，要注意被引用的对象不能超出作用域。所以返回一个对局部变量的引用是不合法的，但是，可以返回一个对静态变量的引用。


### 03. 特性概念

#### 03.01. 面向对象程序设计 (向对象开发的四大特性)

>   - 面向对象四大特性: 封装, 抽象, 继承, 多态
>   - 类 & 对象
>   - 继承
>   - 重载运算符和重载函数
>   - 多态
>   - 数据抽象
>   - 数据封装
>   - 接口（抽象类）

- 类, 对象, 方法, 属性(即时变量)

类, 类可以定义为描述对象行为/状态的模板/蓝图; 对象, 对象具有状态和行为, 对象是类的实例, 是运行时通过类创建出来的;

方法, 方法是对象的行为, 起本质是一个函数, 是对对象操作的封装; 属性, 即时变量, 对象都有其独特的即时变量, 值用来表示对象的状态信息。

类是对象的抽象和概括，而对象是类的具体和实例

对象指针的使用方法，除了在赋值、访问成员的时候用以外，在传参的时候也建议用指针来传递，因为其传递的为地址，不会进行对象之间的副本赋值，从而减少内存的开销，提高效率。

引用，是C++中一种新的类型，对象引用就是一个类对象起个别名，本质上也是把这个类对象的地址赋给了这个引用类型，两者是指向一块内存空间的。

> 1. 类 & 对象

C++ 在 C 语言的基础上增加了面向对象编程，C++ 支持面向对象程序设计。类是 C++ 的核心特性，通常被称为用户定义的类型。

类用于指定对象的形式，它包含了数据表示法和用于处理数据的方法。类中的数据和方法称为类的成员。函数在一个类中被称为类的成员。

- 类定义

class ClassName
{
    Access specifiers:

      type/class members/variables;

      type/class funcations() {}
}

// 类定义是以关键字 class 开头，后跟类的名称。类的主体是包含在一对花括号中。类定义后必须跟着一个分号或一个声明列表。

定义一个类，本质上是定义一个数据类型的模板, 实际上并没有定义任何数据，但它定义了类的含义。

![类定义](https://www.runoob.com/wp-content/uploads/2015/05/cpp-classes-objects-2020-12-10-11.png)

- 对象定义

对象是根据类来创建的。声明类的对象，就像声明基本类型的变量一样

classname members/variables;

- 访问数据成员

类的对象的公共数据成员可以使用直接成员访问运算符 . 来访问, 私有的成员和受保护的成员不能使用直接成员访问运算符 (.) 来直接访问。

类访问修饰符, 类成员可以被定义为 public、private 或 protected。默认情况下是定义为 private。

- 构造函数 & 析构函数 & 拷贝构造函数 (深拷贝与浅拷贝)

类的构造函数是一种特殊的函数，在创建一个新的对象时调用。类的析构函数也是一种特殊的函数，在删除所创建的对象时调用。

类的构造函数是类的一种特殊的成员函数，它会在每次创建类的新对象时执行。构造函数的名称与类的名称是完全相同的，并且不会返回任何类型，也不会返回 void。构造函数可用于为某些成员变量设置初始值。

拷贝构造函数, 与类名同名，且形参是本类对象的引用类型的函数，叫做拷贝构造函数(Copy Constrctor)，与构造函数一样，当我们不主动定义的时候，系统也会自动生成一个，进行两个对象成员之间对应的简单赋值，用来初始化一个对象。

默认的拷贝构造函数仅仅是进行数据赋值，并不能为指针开辟内存空间, 那么本质上，也就是两个指针指向一块堆空间。

当类中有指针类型时，依靠默认的拷贝构造函数的方法，已经无法满足我们的需求，必须定义一个特定的拷贝构造函数，即不仅可以进行数据的拷贝，也可以为成员分配内存空间，实现真正的拷贝，也叫做深拷贝，这就是深拷贝构造函数。

```cpp
// 定义构造函数
class ClassName
{
    Access specifiers:
      ClassName();

    ...
}

ClassName::ClassName() {
}
```


```cpp
#include <iostream>

using namespace std;

// 定义类
class ClassName
{
public:
	ClassName();           // 构造函数, 创建类对象时调用
	ClassName(double len); // 构造函数, 带参数
	~ClassName();          // 析构函数, 销毁对象时调用
	void setLength(double len) { // 成员方法
		this->length = len;
	};
	double getLength(void) {
		return length;
	};

private:
	double length = 0; // 成员属性
};

// 实现类方法
ClassName::ClassName(void)
{
	cout << "Object is being created" << endl;
}

ClassName::ClassName(double len)
{
	this->length = len;
}

ClassName::~ClassName(void)
{
}

// 程序的主函数
int main()
{
	ClassName c;       // 定义初始化对象

	// 调用对象方法
	c.setLength(6.0);
	cout << "Length of line : " << c.getLength() << endl;

	ClassName c1(10.0); // 定义初始化对象，带参数

	cout << "Length of line : " << c1.getLength() << endl;

	return 0;
}
```

> 2. 继承

面向对象程序设计中最重要的一个概念是继承。继承允许我们依据另一个类来定义一个类，这使得创建和维护一个应用程序变得更容易。这样做，也达到了重用代码功能和提高执行效率的效果。

当创建一个类时，您不需要重新编写新的数据成员和成员函数，只需指定新建的类继承了一个已有的类的成员即可。这个已有的类称为基类，新建的类称为派生类。

继承代表了 is a 关系。

![](https://www.runoob.com/wp-content/uploads/2015/05/cpp-inheritance-2020-12-15-1.png)

一个类可以派生自多个类，这意味着，它可以从多个基类继承数据和函数。定义一个派生类，我们使用一个类派生列表来指定基类。类派生列表以一个或多个基类命名

class derived-class: access-specifier base-class

修饰符 access-specifier 是 public、protected 或 private 其中的一个，base-class 是之前定义过的某个类的名称。如果未使用访问修饰符 access-specifier，则默认为 private。

访问修饰符 access-specifier: 
公有继承（public）：当一个类派生自公有基类时，基类的公有成员也是派生类的公有成员，基类的保护成员也是派生类的保护成员，基类的私有成员不能直接被派生类访问，但是可以通过调用基类的公有和保护成员来访问。
保护继承（protected）： 当一个类派生自保护基类时，基类的公有和保护成员将成为派生类的保护成员。
私有继承（private）：当一个类派生自私有基类时，基类的公有和保护成员将成为派生类的私有成员。

```cpp
// 基类
class BaseClass {
};

// 派生类
class SubClass : public BaseClass {
};
```

访问控制和继承, 派生类可以访问基类中所有的非私有成员。因此基类成员如果不想被派生类的成员函数访问，则应在基类中声明为 private。

一个派生类继承了所有的基类方法, 除了, 基类的构造函数、析构函数和拷贝构造函数; 基类的重载运算符; 基类的友元函数

- 多继承特性

多继承即一个子类可以有多个父类，它继承了多个父类的特性，C++ 类可以从多个类继承成员

```cpp
class <派生类名>:<继承方式1><基类名1>,<继承方式2><基类名2>,…
{
<派生类类体>
};
// 访问修饰符继承方式是 public、protected 或 private 其中的一个，用来修饰每个基类，各个基类之间用逗号分隔
```

> 3. 重载运算符和重载函数

C++ 允许在同一作用域中的某个函数和运算符指定多个定义，分别称为函数重载和运算符重载。

重载声明是指一个与之前已经在该作用域内声明过的函数或方法具有相同名称的声明，但是它们的参数列表和定义（实现）不相同。当您调用一个重载函数或重载运算符时，编译器通过把您所使用的参数类型与定义中的参数类型进行比较，决定选用最合适的定义。选择最合适的重载函数或重载运算符的过程，称为重载决策。

在同一个作用域内，可以声明几个功能类似的同名函数，但是这些同名函数的形式参数（指参数的个数、类型或者顺序）必须不同。您不能仅通过返回类型的不同来重载函数。


运算符重载, 可以 重定义或重载大部分 C++ 内置的运算符。这样，您就能使用自定义类型的运算符。多数的重载运算符可被定义为普通的非成员函数或者被定义为类成员函数。

重载的运算符是带有特殊名称的函数，函数名是由关键字 operator 和其后要重载的运算符符号构成的。与其他函数一样，重载运算符有一个返回类型和一个参数列表。

ClassName operator+(const ClassName&); // 声明加法运算符用于把两个 ClassName 对象相加，返回最终的 ClassName 对象。

> 4. 多态

多态按字面的意思就是多种形态。当类之间存在层次结构，并且类之间是通过继承关联时，就会用到多态。C++ 多态意味着调用成员函数时，会根据调用函数的对象的类型来执行不同的函数。

静态多态，或静态链接 - 函数调用在程序执行前就准备好了。有时候这也被称为早绑定, 此时需要关键字 virtual 设置基类方法, 这样设置的方法, 编译器看的是指针的内容，而不是它的类型, 从而实现多态调用

- 虚函数 virtual

虚函数 是在基类中使用关键字 virtual 声明的函数。在派生类中重新定义基类中定义的虚函数时，会告诉编译器不要静态链接到该函数。

此时需要的是, 在程序中任意点可以根据所调用的对象类型来选择调用的函数，这种操作被称为动态链接，或后期绑定。

虚函数可以为private, 并且可以被子类覆盖（因为虚函数表的传递），但子类不能调用父类的private虚函数。虚函数的重载性和它声明的权限无关。

一个成员函数被定义为private属性，标志着其只能被当前类的其他成员函数(或友元函数)所访问。而virtual修饰符则强调父类的成员函数可以在子类中被重写，因为重写之时并没有与父类发生任何的调用关系，故而重写是被允许的。

编译器不检查虚函数的各类属性。被virtual修饰的成员函数，不论他们是private、protect或是public的，都会被统一的放置到虚函数表中。

- 纯虚函数

在基类中定义虚函数，以便在派生类中重新定义该函数更好地适用于对象，但是您在基类中又不能对虚函数给出有意义的实现，这个时候就会用到纯虚函数。

virtual int area() = 0; // = 0 告诉编译器，函数没有主体，上面的虚函数是纯虚函数。

纯虚函数可以设计成私有的，不过这样不允许在本类之外的非友元函数中直接调用它，子类中只有覆盖这种纯虚函数的义务，却没有调用它的权利。


> 5. 数据抽象

数据抽象是指，只向外界提供关键信息，并隐藏其后台的实现细节，即只表现必要的信息而不呈现细节。

数据抽象是一种依赖于接口和实现分离的编程（设计）技术。

使用类来定义我们自己的抽象数据类型（ADT）。

访问标签强制抽象, 使用访问标签来定义类的抽象接口。一个类可以包含零个或多个访问标签：

使用公共标签定义的成员都可以访问该程序的所有部分。一个类型的数据抽象视图是由它的公共成员来定义的。
使用私有标签定义的成员无法访问到使用类的代码。私有部分对使用类型的代码隐藏了实现细节。

访问标签出现的频率没有限制。每个访问标签指定了紧随其后的成员定义的访问级别。指定的访问级别会一直有效，直到遇到下一个访问标签或者遇到类主体的关闭右括号为止。

优点: 

类的内部受到保护，不会因无意的用户级错误导致对象状态受损。
类实现可能随着时间的推移而发生变化，以便应对不断变化的需求，或者应对那些要求不改变用户级代码的错误报告。

如果只在类的私有部分定义数据成员，编写该类的作者就可以随意更改数据。如果实现发生改变，则只需要检查类的代码，看看这个改变会导致哪些影响。如果数据是公有的，则任何直接访问旧表示形式的数据成员的函数都可能受到影响。

抽象把代码分离为接口和实现。所以在设计组件时，必须保持接口独立于实现，这样，如果改变底层实现，接口也将保持不变。

> 6. 数据封装

程序语句（代码）：这是程序中执行动作的部分，它们被称为函数。程序数据：数据是程序的信息，会受到程序函数的影响。

封装是面向对象编程中的把数据和操作数据的函数绑定在一起的一个概念，这样能避免受到外界的干扰和误用，从而确保了安全。数据封装引申出了另一个重要的 OOP 概念，即数据隐藏。

数据封装是一种把数据和操作数据的函数捆绑在一起的机制，数据抽象是一种仅向用户暴露接口而把具体的实现细节隐藏起来的机制。

C++ 通过创建类来支持封装和数据隐藏（public、protected、private）。

类包含私有成员（private）、保护成员（protected）和公有成员（public）成员。默认情况下，在类中定义的所有项目都是私有的。

把一个类定义为另一个类的友元类，会暴露实现细节，从而降低了封装性。理想的做法是尽可能地对外隐藏每个类的实现细节。

> 7. 接口（抽象类）

接口描述了类的行为和功能，而不需要完成类的特定实现。

C++ 接口是使用抽象类来实现的，抽象类与数据抽象互不混淆，数据抽象是一个把实现细节与相关的数据分离开的概念。

如果类中至少有一个函数被声明为纯虚函数，则这个类就是抽象类。纯虚函数是通过在声明中使用 "= 0" 来指定的。可用于实例化对象的类被称为具体类。

抽象类的存在是为了提供一个高度抽象、对外统一的接口，然后通过多态的特性使用各自的不同方法，是C++面向对象设计以及软件工程的核心思想之一。

设计抽象类（通常称为 ABC）的目的，是为了给其他类提供一个可以继承的适当的基类。抽象类不能被用于实例化对象，它只能作为接口使用。如果试图实例化一个抽象类的对象，会导致编译错误。

如果一个 ABC 的子类需要被实例化，则必须实现每个虚函数，这也意味着 C++ 支持使用 ABC 声明接口。如果没有在派生类中重写纯虚函数，就尝试实例化该类的对象，会导致编译错误。

面向对象的系统可能会使用一个抽象基类为所有的外部应用程序提供一个适当的、通用的、标准化的接口。然后，派生类通过继承抽象基类，就把所有类似的操作都继承下来。

外部应用程序提供的功能（即公有函数）在抽象基类中是以纯虚函数的形式存在的。这些纯虚函数在相应的派生类中被实现。

> 8. this指针

只要定义一个类，系统就会预定义个名字叫做this名且指向当前对象的指针, 可以明确是本类中的成员，从而明显的区别本对象与外部变量


#### 03.02. 异常处理

异常是程序在执行期间产生的问题。C++ 异常是指在程序运行时发生的特殊情况，异常提供了一种转移程序控制权的方式。C++ 异常处理涉及到三个关键字：try、catch、throw。

![C++ 标准的异常](https://www.runoob.com/wp-content/uploads/2015/05/exceptions_in_cpp.png)

- exception 库, 提供一系列标准的异常

- try    // try 块中的代码标识将被激活的特定异常。它后面通常跟着一个或多个 catch 块。
- catch  // 在您想要处理问题的地方，通过异常处理程序捕获异常。catch 关键字用于捕获异常。
- throw  // 当问题出现时，程序会抛出一个异常。这是通过使用 throw 关键字来完成的。

如果有一个块抛出一个异常，捕获异常的方法会使用 try 和 catch 关键字。try 块中放置可能抛出异常的代码，try 块中的代码被称为保护代码。

- 异常捕获

```cpp
try
{
   // 保护代码
}catch( ExceptionName e1 )
{
   // catch 块
}catch( ExceptionName e2 )
{
   // catch 块
}catch( ExceptionName eN )
{
   // catch 块
}catch(...) {
   // 捕获任何类型异常
}
```

- 抛出异常

使用 throw 语句在代码块中的任何地方抛出异常。throw 语句的操作数可以是任意的表达式，表达式的结果的类型决定了抛出的异常的类型。

throw "Division by zero condition!";

- 自定义异常, 通过继承和重载 exception 类来定义新的异常

```cpp
#include <iostream>
#include <exception>

using namespace std;
 
struct MyException : public exception
{
  const char * what () const throw ()  // what() 是异常类提供的一个公共方法，它已被所有子异常类重载。这将返回异常产生的原因
  {
    return "C++ Exception";
  }
};

int main()
{
  try
  {
    throw MyException();
  }
  catch(MyException& e)
  {
    std::cout << "MyException caught" << std::endl;
    std::cout << e.what() << std::endl;
  }
  catch(std::exception& e)
  {
    //其他的错误
  }
}
```

#### 03.02. 命名空间

命名空间，解决多个模块间命名冲突的问题，可作为附加信息来区分不同库中相同名称的函数、类、变量等。使用了命名空间即定义了上下文。本质上，命名空间就是定义了一个范围。



一个文件夹(目录)中可以包含多个文件夹，每个文件夹中不能有相同的文件名，但不同文件夹中的文件可以重名。

![](https://www.runoob.com/wp-content/uploads/2019/09/0129A8E9-30FE-431D-8C48-399EA4841E9D.jpg)

- 定义命名空间

// 使用关键字 namespace，后跟命名空间的名称

```cpp
namespace namespace_name {
   // 代码声明
}

// 为了调用带有命名空间的函数或变量，需要在前面加上命名空间的名称
name::code;  // code 可以是变量或函数
```

不连续的命名空间: 命名空间可以定义在几个不同的部分中，因此命名空间是由几个单独定义的部分组成的。一个命名空间的各个组成部分可以分散在多个文件中。

如果命名空间中的某个组成部分需要请求定义在另一个文件中的名称，则仍然需要声明该名称。命名空间定义可以是定义一个新的命名空间，也可以是为已有的命名空间增加新的元素

嵌套的命名空间: 命名空间可以嵌套，您可以在一个命名空间中定义另一个命名空间, 通过使用 :: 运算符来访问嵌套的命名空间中的成员

```cpp
namespace namespace_name1 {
   // 代码声明
   namespace namespace_name2 {
      // 代码声明
   }
}


// 访问 namespace_name2 中的成员
using namespace namespace_name1::namespace_name2;
 
// 访问 namespace:name1 中的成员
using namespace namespace_name1;
```

- using 指令

使用 using namespace 指令，这样在使用命名空间时就可以不用在前面加上命名空间的名称, 这个指令会告诉编译器，后续的代码将使用指定的命名空间中的名称。

// using 指令也可以用来指定命名空间中的特定项目。例如，如果您只打算使用 std 命名空间中的 cout 部分，

using std::cout;

using 指令引入的名称遵循正常的范围规则。名称从使用 using 指令开始是可见的，直到该范围结束。此时，在范围以外定义的同名实体是隐藏的。


#### 03.03. 模板

模板是泛型编程的基础，泛型编程即以一种独立于任何特定类型的方式编写代码。

模板是创建泛型类或函数的蓝图或公式。库容器，比如迭代器和算法，都是泛型编程的例子，它们都使用了模板的概念。可以使用模板来定义函数和类

- 函数模板

```cpp
template <typename type> ret-type func-name(parameter list)
{
   // 函数的主体
}

// type 是函数所使用的数据类型的占位符名称。这个名称可以在函数定义中使用。
```

```cpp
// 函数模板的实例，返回两个数中的最大值
#include <iostream>
#include <string>

using namespace std;

template <typename T> inline T const& Max (T const& a, T const& b)
{
    return a < b ? b:a;
}

int main ()
{
    int i = 39;
    int j = 20;
    cout << "Max(i, j): " << Max(i, j) << endl;

    double f1 = 13.5;
    double f2 = 20.7;
    cout << "Max(f1, f2): " << Max(f1, f2) << endl;

    string s1 = "Hello";
    string s2 = "World";
    cout << "Max(s1, s2): " << Max(s1, s2) << endl;

   return 0;
}
```

- 类模板

```cpp
template <class type> class class-name {

}
// type 是占位符类型名称，可以在类被实例化的时候进行指定。您可以使用一个逗号分隔的列表来定义多个泛型数据类型
```

```cpp
#include <iostream>
#include <vector>
#include <cstdlib>
#include <string>
#include <stdexcept>

using namespace std;

// 定义了类 Stack<>，并实现了泛型方法来对元素进行入栈出栈操作
template <class T> class Stack 
{
    private:
        vector<T> elems;     // 元素 

    public:
        void push(T const&);    // 入栈
        void pop();             // 出栈
        T top() const;          // 返回栈顶元素
        bool empty() const {    // 如果为空则返回真。
            return elems.empty();
        }
};

// 实现类成员方法
template <class T> void Stack<T>::push(T const& elem) 
{
	// 追加传入元素的副本
	elems.push_back(elem);
}

template <class T> void Stack<T>::pop()
{
	if (elems.empty()) {
		throw out_of_range("Stack<>::pop(): empty stack");
	}
	// 删除最后一个元素
	elems.pop_back();
}

template <class T> T Stack<T>::top() const
{
	if (elems.empty()) {
		throw out_of_range("Stack<>::top(): empty stack");
	}
	// 返回最后一个元素的副本 
	return elems.back();
}

int main()
{
	try {
		Stack<int>    intStack;    // int 类型的栈 
		Stack<string> stringStack; // string 类型的栈 

		// 操作 int 类型的栈 
		intStack.push(7);
		cout << intStack.top() << endl;

		// 操作 string 类型的栈 
		stringStack.push("hello");
		cout << stringStack.top() << std::endl;
		stringStack.pop();
		stringStack.pop();
	}
	catch (exception const& ex) {
		cerr << "Exception: " << ex.what() << endl;
		return -1;
	}
}
```

### 04. 标准库

#### 04.01 基础库操作

>   - 文件和流
>   - 动态内存
>   - 信号处理
>   - 多线程
>   - Web 编程

> 1. 文件和流

iostream 标准库，它提供了 cin 和 cout 方法分别用于从标准 输入读取流和向标准输出写入流。

fstream 标准库, 文件读取流和向文件写入流

ofstream 该数据类型表示输出文件流，用于创建文件并向文件写入信息。
ifstream 该数据类型表示输入文件流，用于从文件读取信息。
fstream	 该数据类型通常表示文件流，且同时具有 ofstream 和 ifstream 两种功能，这意味着它可以创建文件，向文件写入信息，从文件读取信息。

- 打开文件

void open(const char *filename, ios::openmode mode);

在从文件读取信息或者向文件写入信息之前，必须先打开文件。ofstream 和 fstream 对象都可以用来打开文件进行写操作，如果只需要打开文件进行读操作，则使用 ifstream 对象。

open() 函数是 fstream、ifstream 和 ofstream 对象的一个成员。第一参数指定要打开的文件的名称和位置，第二个参数定义文件被打开的模式。

ios::app  追加模式。所有写入都追加到文件末尾。
ios::ate  文件打开后定位到文件末尾。
ios::in	  打开文件用于读取。
ios::out  打开文件用于写入。
ios::trunc  如果该文件已经存在，其内容将在打开文件之前被截断，即把文件长度设为 0。

可以把以上两种或两种以上的模式结合使用。例如，如果您想要以写入模式打开文件，并希望截断文件，以防文件已存在，那么您可以使用下面的语法：

ifstream  afile;
afile.open("file.dat", ios::out | ios::in );

- 关闭文件

void close();

当 C++ 程序终止时，它会自动关闭刷新所有流，释放所有分配的内存，并关闭所有打开的文件。但程序员应该养成一个好习惯，在程序终止前关闭所有打开的文件。

close() 函数是 fstream、ifstream 和 ofstream 对象的一个成员。

- 写入文件

使用流插入运算符（ << ）向文件写入信息，就像使用该运算符输出信息到屏幕上一样。唯一不同的是，在这里您使用的是 ofstream 或 fstream 对象，而不是 cout 对象。

- 读取文件

使用流提取运算符（ >> ）从文件读取信息，就像使用该运算符从键盘输入信息一样。唯一不同的是，在这里您使用的是 ifstream 或 fstream 对象，而不是 cin 对象。

```cpp
// 以读写模式打开一个文件。在向文件 afile.dat 写入用户输入的信息之后，程序从文件读取信息，并将其输出到屏幕上
// 使用了 cin 对象的附加函数，比如 getline()函数从外部读取一行，ignore() 函数会忽略掉之前读语句留下的多余字符。
#include <fstream>
#include <iostream>

using namespace std;

int main()
{

	char data[100];

	// 以写模式打开文件
	ofstream outfile;
	outfile.open("afile.dat");

	cout << "Writing to the file" << endl;
	cout << "Enter your name: ";
	cin.getline(data, 100);

	// 向文件写入用户输入的数据
	outfile << data << endl;

	cout << "Enter your age: ";
	cin >> data;
	cin.ignore();

	// 再次向文件写入用户输入的数据
	outfile << data << endl;

	// 关闭打开的文件
	outfile.close();

	// 以读模式打开文件
	ifstream infile;
	infile.open("afile.dat");

	cout << "Reading from the file" << endl;
	infile >> data;

	// 在屏幕上写入数据
	cout << data << endl;

	// 再次从文件读取数据，并显示它
	infile >> data;
	cout << data << endl;

	// 关闭打开的文件
	infile.close();

	return 0;
}
```

- 文件位置指针

istream 和 ostream 都提供了用于重新定位文件位置指针的成员函数。

文件位置指针是一个整数值，指定了从文件的起始位置到指针所在位置的字节数。

seekg 和 seekp 的参数通常是一个长整型。第二个参数可以用于指定查找方向。查找方向可以是 ios::beg（默认的，从流的开头开始定位），也可以是 ios::cur（从流的当前位置开始定位），也可以是 ios::end（从流的末尾开始定位）。

> 2. 动态内存

内存:

栈, 在函数内部声明的所有变量都将占用栈内存

堆, 程序中未使用的内存，在程序运行时可用于动态分配内存

- 内存分配

使用 new 运算符 为给定类型的变量在运行时分配堆内的内存，这会返回所分配的空间地址。使用 delete 运算符，释放由 new 运算符分配的内存。

new 运算符来为任意的数据类型动态分配内存的通用语法

new data-type; // data-type 可以是包括数组在内的任意内置的数据类型，也可以是包括类或结构在内的用户自定义的任何数据类型。

```cpp
double* pvalue  = NULL; // 初始化为 null 的指针
pvalue  = new double;   // 为变量请求内存

// 如果自由存储区已被用完，可能无法成功分配内存。所以建议检查 new 运算符是否返回 NULL 指针
double* pvalue  = NULL;
if( !(pvalue  = new double ))
{
   cout << "Error: out of memory." <<endl;
   exit(1);
}
```

malloc() 函数在 C 语言中就出现了，在 C++ 中仍然存在，但建议尽量不要使用 malloc() 函数。new 与 malloc() 函数相比，其主要的优点是，new 不只是分配了内存，它还创建了对象。

- 释放内存

delete pvalue;        // 释放 pvalue 所指向的内存

- 数组的动态内存分配

```cpp
// 一维数组分配内存

// 动态分配,数组长度为 m
int *array = new int [m]; // 初始化为 null 的指针, 为变量请求内存
 
//释放内存
delete [] array;

// 二维数组分配内存, 假定数组第一维长度为 m， 第二维长度为 n

int **array
array = new int *[m]; // 动态分配空间
for( int i=0; i<m; i++ )
{
    array[i] = new int [n]  ;
}

// 释放
for( int i=0; i<m; i++ )
{
    delete [] array[i];
}
delete [] array;
```

- 对象的动态内存分配

ClassName *v = new ClassName( parameter );

> 3. 信号处理

信号是由操作系统传给进程的中断，会提早终止一个程序。在 UNIX、LINUX、Mac OS X 或 Windows 系统上，可以通过按 Ctrl+C 产生中断。

有些信号不能被程序捕获，有些信号可以在程序中捕获，并可以基于信号采取适当的动作。这些信号是定义在 C++ 头文件 <csignal> 中。

SIGABRT  程序的异常终止，如调用 abort。
SIGFPE   错误的算术运算，比如除以零或导致溢出的操作。
SIGILL   检测非法指令。
SIGINT   程序终止(interrupt)信号。
SIGSEGV  非法访问内存。
SIGTERM  发送到程序的终止请求。

void (*signal (int sig, void (*func)(int)))(int); // signal() 函数, 用来捕获突发事件, signal(registered signal, signal handler)

接收两个参数：第一个参数是一个整数，代表了信号的编号；第二个参数是一个指向信号处理函数的指针。

int raise (signal sig); // raise() 生成信号，该函数带有一个整数信号编号作为参数, sig 是要发送的信号的编号，这些信号包括：SIGINT、SIGABRT、SIGFPE、SIGILL、SIGSEGV、SIGTERM、SIGHUP

> 4. 多线程

多线程是多任务处理的一种特殊形式，多任务处理允许让电脑同时运行两个或两个以上的程序。一般情况下，两种类型的多任务处理：基于进程和基于线程。

基于进程的多任务处理是程序的并发执行; 基于线程的多任务处理是同一程序的片段的并发执行

多线程程序包含可以同时运行的两个或多个部分。这样的程序中的每个部分称为一个线程，每个线程定义了一个单独的执行路径。

- linux 使用 POSIX 编写多线程 POSIX Threads 或 Pthreads 提供的 API 可在多种类 Unix POSIX 系统上可用，比如 FreeBSD、NetBSD、GNU/Linux、Mac OS X 和 Solaris。

```cpp
#include <pthread.h>
pthread_create (thread, attr, start_routine, arg); // 创建一个 POSIX 线程, 创建线程成功时，函数返回 0，若返回值不为 0 则说明创建线程失败。
```

thread  指向线程标识符指针。
attr    一个不透明的属性对象，可以被用来设置线程属性。您可以指定线程属性对象，也可以使用默认值 NULL。
start_routine  线程运行函数起始地址，一旦线程被创建就会执行。
arg  运行函数的参数。它必须通过把引用作为指针强制转换为 void 类型进行传递。如果没有传递参数，则使用 NULL。

终止线程

```cpp
#include <pthread.h>
pthread_exit (status);
```

pthread_exit 用于显式地退出一个线程。通常情况下，pthread_exit() 函数是在线程完成工作后无需继续存在时被调用。如果 main() 是在它所创建的线程之前结束，并通过 pthread_exit() 退出，那么其他线程将继续执行。否则，它们将在 main() 结束时自动被终止。

连接和分离线程

pthread_join (threadid, status); // 子程序阻碍调用程序，直到指定的 threadid 线程终止为止
pthread_detach (threadid) 

当创建一个线程时，它的某个属性会定义它是否是可连接的（joinable）或可分离的（detached）。只有创建时定义为可连接的线程才可以被连接。如果线程创建时被定义为可分离的，则它永远也不能被连接。

- c++ 11 之后有了标准的线程库 <thread>

如果设置为 PTHREAD_CREATE_JOINABLE，就继续用 pthread_join() 来等待和释放资源，否则会内存泄露。

```cpp
#include <iostream>
#include <thread>

std::thread::id main_thread_id = std::this_thread::get_id();

void hello()
{
	std::cout << "Hello Concurrent World\n";
	if (main_thread_id == std::this_thread::get_id())
		std::cout << "This is the main thread.\n";
	else
		std::cout << "This is not the main thread.\n";
}

void pause_thread(int n) {
	std::this_thread::sleep_for(std::chrono::seconds(n));
	std::cout << "pause of " << n << " seconds ended\n";
}

int main() {
	std::thread t(hello);
	std::cout << t.hardware_concurrency() << std::endl;  //可以并发执行多少个(不准确)
	std::cout << "native_handle " << t.native_handle() << std::endl; //可以并发执行多少个(不准确)
	t.join();
	std::thread a(hello);
	a.detach();
	std::thread threads[5];                         // 默认构造线程

	std::cout << "Spawning 5 threads...\n";
	for (int i = 0; i < 5; ++i)
		threads[i] = std::thread(pause_thread, i + 1);   // move-assign threads
	std::cout << "Done spawning threads. Now waiting for them to join:\n";
	for (auto& thread : threads)
		thread.join();
	std::cout << "All threads joined!\n";
}
```

> 5. Web 编程

CGI, 公共网关接口, 是一套标准，定义了信息是如何在 Web 服务器和客户端脚本之间进行交换的

CGI 规范目前是由 NCSA 维护的，NCSA 定义 CGI 如下, GCI是一种用于外部网关程序与信息服务器（如 HTTP 服务器）对接的接口标准, 目前的版本是 CGI/1.1，CGI/1.2 版本正在推进中

公共网关接口（CGI），是使得应用程序（称为 CGI 程序或 CGI 脚本）能够与 Web 服务器以及客户端进行交互的标准协议。

![CGI架构](https://www.runoob.com/wp-content/uploads/2015/05/cgiarch.gif)


#### 04.02 标准模板库 (STL)

标准库可以分为两部分：

1. 标准函数库, 这个库是由通用的、独立的、不属于任何类的函数组成的。函数库继承自 C 语言。

输入/输出 I/O
字符串和字符处理
数学
时间、日期和本地化
动态分配
其他
宽字符函数

2. 面向对象类库, 这个库是类及其相关函数的集合

标准的 C++ 面向对象类库定义了大量支持一些常见操作的类，比如输入/输出 I/O、字符串处理、数值处理。

标准的 C++ I/O 类
String 类
数值类
STL 容器类
STL 算法
STL 函数对象
STL 迭代器
STL 分配器
本地化库
异常处理类
杂项支持库

> 标准模板库 (STL)

C++ STL（标准模板库）是一套功能强大的 C++ 模板类，提供了通用的模板类和函数，这些模板类和函数可以实现多种流行和常用的算法和数据结构，如向量、链表、队列、栈。

组件:

1. 容器（Containers）

容器是用来管理某一类对象的集合。C++ 提供了各种不同类型的容器，比如 deque、list、vector、map 等。

2. 算法（Algorithms）

算法作用于容器。它们提供了执行各种操作的方式，包括对容器内容执行初始化、排序、搜索和转换等操作。

3. 迭代器（iterators）

迭代器用于遍历对象集合的元素。这些集合可能是容器，也可能是容器的子集。

```cpp
// 
#include <iostream>
#include <vector>
using namespace std;

int main()
{
	// 创建一个向量存储 int
	vector<int> vec;
	int i;

	// 显示 vec 的原始大小
	cout << "vector size = " << vec.size() << endl;

	// 推入 5 个值到向量中
	for (i = 0; i < 5; i++) {
		vec.push_back(i);
	}

	// 显示 vec 扩展后的大小
	cout << "extended vector size = " << vec.size() << endl;

	// 访问向量中的 5 个值
	for (i = 0; i < 5; i++) {
		cout << "value of vec [" << i << "] = " << vec[i] << endl;
	}

	// 使用迭代器 iterator 访问值
	vector<int>::iterator v = vec.begin();
	while (v != vec.end()) {
		cout << "value of v = " << *v << endl;
		v++;
	}

	return 0;
}
// push_back() 成员函数在向量的末尾插入值，如果有必要会扩展向量的大小。
// size()      函数显示向量的大小。
// begin()     函数返回一个指向向量开头的迭代器。
// end()       函数返回一个指向向量末尾的迭代器。

// size 是当前 vector 容器真实占用的大小，也就是容器当前拥有多少个容器。capacity 是指在发生 realloc 前能允许的最大元素数，即预分配的内存空间。
```

### 05. 功能库



