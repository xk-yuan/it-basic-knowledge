# C 语言

> c 语言, 基础核心知识体系, 学习整理笔记

> 专注于, C语言本身最核心部分的知识学习, 以及笔记整理

## 目录

> **1. 语言概述**
>
> **2. 核心概念**
>
> - 01. 程序结构 (C 程序结构包含组成部分: 预处理器指令, 函数, 变量, 常量, 语句&表达式)
>  - 关键字
>  - 分号作用
>  - 注释
>
> - 02. 数据类型: 基本数据类型(算术类型，包括两种类型：整数类型和浮点类型)
>  - 1. 基本数据类型 (算术类型: 整数类型, 浮点类型; 无符号表示, 有符号表示)
>    - short
>    - int
>    - long
>    - float
>    - char
>    - double
>    - unsigned
>    - signed
>  - 2. 派生数据类型 (数组类型、结构类型、共用体类型和函数类型, 指针类型)
>    - 数组
>      - 一维数组
>      - 二维数组
>      - 多维数组
>    - 指针
>    - 函数, 函数指针, 回调函数
>    - 结构体
>    - 共用体
>    - 位域
>  - 3. 高级数据类型
>    - void 类型
>    - 枚举类型
>
> - 03. 标识符, 变量, 常量 含义 (标识符规范, 变量常量定义及使用, 作用域等)
>  - auto
>  - const
>  - static
>  - register
>  - extern
>  - volatile
>  - typedef 标识符
>  - sizeof  运算符   
>
> - 04. 运算符
>
> - 05. 语句&表达式
>
> - 06. 逻辑控制结构: 判断, 循环, 递归
>
> - 07. 函数
>   - 概念定义及使用
>   - 可变参数
>   - 命令行参数
>
> - 08. 作用域
>
> **3. 特性概念**
>
> - 01. 预处理器: 头文件, 宏定义&宏运算
>    - include 标识符
>    - #define 标识符
>
> - 02. 强制类型转换
>
> - 03. 错误处理
>
> - 04. 字符串
>
> **4. 基础库操作**
>
> - 01. 基础操作

>   - 1. 输入&输出
>   - 2. 文件读写
>   - 3. 内存管理
>   - 4. 排序算法
>
> - 02. 标准库
>   - assert.h
>   - ctype.h
>   - errno.h
>   - float.h
>   - limits.h
>   - locale.h
>   - math.h
>   - setjmp.h
>   - signal.h
>   - stdarg.h
>   - stddef.h
>   - stdio.h
>   - stdlib.h
>   - string.h
>   - time.h
>
> **5. 功能库**
>
> **6. 平台库**
>
>   - linux平台库
>
>   - windows平台库

### 01. 语言概述

C 语言, 1972 年，为了移植与开发 UNIX 操作系统，丹尼斯·里奇在贝尔电话实验室设计开发的, 一种通用的、面向过程式的计算机程序设计语言, 在 1978 年，布莱恩·柯林汉（Brian Kernighan）和丹尼斯·里奇（Dennis Ritchie）制作了 C 的第一个公开可用的描述，现在被称为 K&R 标准。

C语言的原型是A语言（ALGOL 60语言）。 

1963年，剑桥大学将ALGOL 60语言发展成为CPL(Combined Programming Language)语言。 

1967年，剑桥大学的Matin Richards 对CPL语言进行了简化，于是产生了BCPL语言。 

1969年，美国贝尔实验室的Ken Thompson将BCPL进行了修改，提炼出它的精华，并为它起了一个有趣的名字“B语言”。并且他用B语言写了第一个UNIX操作系统。 

而在1973年，美国贝尔实验室的D.M.RITCHIE在B语言的基础上最终设计出了一种新的语言，他取了BCPL的第二个字母作为这种语言的名字，这就是C语言。 

为了使UNIX操作系统推广，1977年Dennis M.Ritchie 发表了不依赖于具体机器系统的C语言编译文本《可移植的C语言编译程序》。即著名的ANSI C。 

1978年由AT&T（美国电话电报公司）贝尔实验室正式发表了C语言。同时Brian W.Kernighian和Dennis M.Ritchie出版了名著《The C Programming Language》一书。通常简称为《K&R》,也有人称之为《K&R》标准。但是，在《K&R》中并没有定义一个完整的标准C语言，后来由美国国家标准协会（American National Standards Institute,ANSI）在此基础上制定了一个C语言标准，于1983年发表。通常称之为ANSI C。从而使C语言成为目前世界上流行最广泛的高级程序设计语言。

自顶向下的规划，结构化的编程，以及模块化的设计

### 02. 核心概念

#### 02.01. 程序结构

> 1. 简单程序结构

```c helloword case
#include <stdio.h>
 
int main()
{
    /**
     * 我的第一个 C 程序
     */
    printf("Hello, World! \n");

    return 0;
}

// #include : 包含引入头文件, <> 引入标准库, "" 引入自定义库; 其属于, 预处理器指令
// int main()  main函数, 是程序启动入口函数, 主函数
// 注释: // 单行注释, /**/ 多行注释
// 左右花跨号 { }: 函数体, 定义函数内容部分
// return 语句: 返回函数结果
// ;分号: 语句结束标识符, C中所有表达式语句, 必须以分号结尾
```

只包含空格的行，被称为空白行，可能带有注释，C 编译器会完全忽略它。空格用于描述空白符、制表符、换行符和注释。空格分隔语句的各个部分，让编译器能识别语句各元素。

> 2. 关键字, 即 C语言中的保留字, 其不能作为常量名、变量名或其他标识符名称

``` 32个

> 基本数据类型

int	声明整型变量或函数
short	声明短整型变量或函数
long	声明长整型变量或函数返回值类型
float	声明浮点型变量或函数返回值类型
double	声明双精度浮点型变量或函数返回值类型
char	声明字符型变量或函数返回值类型

unsigned  声明无符号类型变量或函数
signed	  声明有符号类型变量或函数

> 派生数据类型

struct	声明结构体类型
union	声明共用体类型

> 高级数据类型

void	声明函数无返回值或无参数，声明无类型指针
enum	声明枚举类型
typedef	  用以给数据类型取别名
sizeof	  计算数据类型或变量长度（即所占字节数）

> 

auto	  声明自动变量
const     定义常量，如果一个变量被 const 修饰，那么它的值就不能再被改变

static	  声明静态变量
register  声明寄存器变量
volatile  说明变量在程序执行中可被隐含地改变
extern	  声明变量或函数是在其它文件或本文件的其他位置定义

> 逻辑控制

if	    条件语句
else	条件语句否定分支（与 if 连用）
switch	用于开关语句
case	 开关语句分支
default	 开关语句中的"其它"分支
continue 结束当前循环，开始下一轮循环
break	 跳出当前循环
return	子程序返回语句（可以带参数，也可不带参数）
for	    一种循环语句
do	    循环语句的循环体
while	循环语句的循环条件
goto	无条件跳转语句

---------- ---------- C99 新增关键字 ---------- ----------

_Bool
_Complex
_Imaginary
inline
restrict  // 由 restrict 修饰的指针是唯一一种访问它所指向的对象的方式。只有 C99 增加了新的类型限定符 restrict。

---------- ---------- C11 新增关键字 ---------- ----------

_Alignas
_Alignof
_Atomic
_Generic
_Noreturn
_Static_assert
_Thread_local  // 存储类, 声明的变量仅可在它在其上创建的线程上访问, 变量在创建线程时创建，并在销毁线程时销毁。 每个线程都有其自己的变量副本。仅应用于数据声明和定义，不能用于函数声明或定义

```

#### 02.02. 数据类型

数据类型指的是用于声明不同类型的变量或函数的一个广泛的系统, 数据类型可以用来定义变量, 其类型决定变量初始化时存储的空间大小, 以及对位模式的解释。

枚举类型, 是特殊的算术类型，被用来定义在程序中只能赋予其一定的离散整数值的变量。

void 类型, 用来说明没有可用的值。

数组类型和结构类型统称为聚合类型。函数的类型指的是函数返回值的类型。

存储类, 定义 C 程序中变量/函数的范围（可见性）和生命周期

##### 01. 基本数据类型

- short
- int
- long
- float
- char
- double

- unsigned
- signed

##### 02. 派生数据类型

- 数组：一维数组, 二维数组, 多维数组
- 指针
- 函数指针, 回调函数

- struct 结构体
- union  共用体

> 1. 数组

数组数据结构，它可以存储一个固定大小的相同类型元素的顺序集合，用来存储一系列数据，但它往往被认为是一系列相同类型的变量。数组都是由连续的内存位置组成。最低的地址对应第一个元素，最高的地址对应最后一个元素。

数组中的特定元素可以通过索引访问，第一个索引值为 0。

![数组结构](https://www.runoob.com/wp-content/uploads/2014/09/c-array-2021-01-18-2.png)

- 数组声明：

type arrayName [ arraySize ]; // 声明一维数组, arraySize 必须是一个大于零的整数常量，type 可以是任意有效的 C 数据类型。

- 数组初始化：

type arrayName[arraySize] = {v0, v1, v2, ...}; // 大括号 { } 之间的值的数目不能大于我们在数组声明时在方括号 [ ] 中指定的元素数目。省略掉了数组的大小，数组的大小则为初始化时元素的个数。

- 数组访问：

arrayName[index] = v;  // 对数组索引位 index 的变量进行赋值

type valueName = arrayName[index]; // 取对数组索引位 index 的变量的值, 赋值给变量 valueName


C 语言不允许返回一个完整的数组作为函数的参数。但是，您可以通过指定不带索引的数组名来返回一个指向数组的指针，C 不支持在函数外返回局部变量的地址，除非定义局部变量为 static 变量

数组名是一个指向数组中第一个元素的常量指针。

- 多维数组：

type name[size1][size2]...[sizeN];

type arrayName [ x ][ y ]; // 多维数组最简单的形式是二维数组。

- 初始化多维数组：

type arrayName[xsize][ysize] = {  
  {V0, V1, V2, ...Vysize-1} ,
  ... xsize
};

- 访问多维数组

arrayName[size1][size2]...[sizeN] = v;             // 对数组索引位 index 的变量进行赋值

type valueName = arrayName[size1][size2]...[sizeN]; // 取对数组索引位 index 的变量的值, 赋值给变量 valueName

> 2. 指针

指针也就是内存地址，指针变量是用来存放内存地址的变量。指针变量, 其值存储的是 表示内存地址的值。通过指针变量可以访问指定的内存地址中存储的数据。

每一个变量都有一个内存位置，每一个内存位置都定义了可使用 & 运算符访问的地址，它表示了在内存中的一个地址。

指向指针的指针是一种多级间接寻址的形式，或者说是一个指针链。一个指针包含一个变量的地址。当我们定义一个指向指针的指针时，第一个指针包含了第二个指针的地址，第二个指针指向包含实际值的位置。

![指针结构](https://www.runoob.com/wp-content/uploads/2014/09/c-pointer.png)
![指针结构](https://www.runoob.com/wp-content/uploads/2014/09/c-pointerxxxxx.png)

- 指针运算符：& 取址操作, * 取值操作

& 取址操作, 获取指定变量所在的内存地址; * 取值操作, 获取指定内存地址中存储的值。

- 指针变量定义

type *pointer_value_name; // type 是指针的基类型，它必须是一个有效的 C 数据类型，var-name 是指针变量的名称。

所有指针的值的类型都是一样的，都是一个代表内存地址的长的十六进制数。不同数据类型的指针之间唯一的不同是，指针所指向的变量或常量的数据类型不同。


- 指针变量使用

pointer_value_name = &value_name; // 为指针变量赋值

pointer_value_name 中存储的值为十六进制的内存地址; *pointer_value_name 获取该指针变量内存地址, 所在地址中的值

- NULL 指针

在变量声明的时候，如果没有确切的地址可以赋值，为指针变量赋一个 NULL 值是一个良好的编程习惯。赋为 NULL 值的指针被称为空指针。NULL 指针是一个定义在标准库中的值为零的常量。

int *ptr = NULL;

在大多数的操作系统上，程序不允许访问地址为 0 的内存，因为该内存是操作系统保留的。然而，内存地址 0 有特别重要的意义，它表明该指针不指向一个可访问的内存位置。但按照惯例，如果指针包含空值（零值），则假定它不指向任何东西。

> 3. 函数指针&回调函数

函数指针是指向函数的指针变量。函数指针可以像一般函数一样，用于调用函数、传递参数。

, 函数指针变量可以作为某个函数的参数来使用的，回调函数就是一个通过函数指针调用的函数。

- 函数指针声明

typedef int (*fun_ptr)(int, int); // 声明一个指向同样参数、返回值的函数指针类型

- 回调函数

当函数指针作为某个函数的参数, 被那个函数指针调用时, 此操作就是调用回调函数, 此时函数指针表示为回调函数

> 4. 结构体

结构是 C 编程中另一种用户自定义的可用的数据类型，和 数组允许定义可存储相同类型数据项的变量 不同，它允许您存储不同类型的数据项。

- 结构体定义

struct struct_type_tag { 
  value-name;
  value-list;
  ...
} variable-list ; // struct_type_tag 结构体标签, value-list 变量定义列表定义该结构体的内部结构; variable-list 结构体变量, 可以定义零个或多个该结构体的变量, 以逗号分割。

struct 语句定义了一个包含多个成员的新的数据类型

- 结构体变量声明

struct struct_type_tag struct_value;

结构体的成员可以包含其他结构体，也可以包含指向自己结构体类型的指针，而通常这种指针的应用是为了实现一些更高级的数据结构如链表和树等。

如果两个结构体互相包含，则需要对其中一个结构体进行不完整声明

- 结构体访问，成员访问运算符（.）

struct_value.value-name // 成员访问运算符是结构变量名称和我们要访问的结构成员之间的一个句号。

结构作为函数参数，传参方式与其他类型的变量或指针类似

- 指向结构的指针, -> 运算符

struct struct_type_tag *struct_pointer = &struct_value;

struct_pointer->title; // 使用 -> 运算符, 使用指向该结构的指针访问结构的成员

> 5. 共用体

共用体是一种特殊的数据类型，允许您在相同的内存位置存储不同的数据类型。可以定义一个带有多成员的共用体，但是任何时候只能有一个成员带有值。共用体提供了一种使用相同的内存位置的有效方式。

- 共同体定义

union [union union_type_tag]
{
  value-name;
  value-list;
  ...
} [one or more union variables];

定义一个共同体变量后, 意味着同一时刻只能存储其中定义的成员列表中的其中一个, 其占用的内存应足够存储共用体中最大的成员

- 共用体变量声明

union union_type_tag union_value_name; // union 关键字来定义共用体类型的变量


- 共用体成员访问, 成员访问运算符（.）

成员访问运算符是共用体变量名称和我们要访问的共用体成员之间的一个句号。 

union_value_name.value-name

所以共用体使用, 同一个时间只能有效使用其中一个成员, 切换其他成员时需要再次赋值在使用, 否则获取的值时无效的。

> 6. 位域

带有预定义宽度的变量被称为位域。位域, 使用是的结构体, 用来更精确的使用字节, 其可以定义到位的成员; 其定义变量的宽度来告诉编译器，您将只使用这些字节。位域在本质上就是一种结构类型，位域的使用和结构成员的使用相同。

解决有些信息在存储时，并不需要占用一个完整的字节，而只需占几个或一个二进制位。为了节省存储空间，并使处理简便，C 语言提供了一种数据结构，称为"位域"或"位段"。所谓"位域"是把一个字节中的二进位划分为几个不同的区域，并说明每个区域的位数。每个域有一个域名，允许在程序中按域名进行操作。这样就可以把几个不同的对象用一个字节的二进制位域来表示。

struct
{
  unsigned int widthValidated;
  unsigned int heightValidated;
} status;

-> 改写成, 其占用空间更小, 使用率更高

struct
{
  unsigned int widthValidated : 1;
  unsigned int heightValidated : 1;
} status;

- 位域定义

struct 位域结构名 
{

 位域列表

};

type [bit_name] : width ; // 位域列表, type 只能为 int(整型)，unsigned int(无符号整型)，signed int(有符号整型) 三种类型，决定了如何解释位域的值。width 位域中位的数量。宽度必须小于或等于指定类型的位宽度。

位域可以是无名位域，这时它只用来作填充或调整位置。无名的位域是不能使用的。当 bit_name 没有值, 则为定义空域。

一个位域存储在同一个字节中，如一个字节所剩空间不够存放另一位域时，则会从下一单元起存放该位域。也可以有意使某位域从下一单元开始。

位域的宽度不能超过它所依附的数据类型的长度，成员变量都是有类型的，这个类型限制了成员变量的最大长度, : 后面的数字不能超过这个长度。


##### 03. 高级数据类型

- 枚举类型
- void 类型
- 位域

> 1. 枚举类型

枚举是 C 语言中的一种基本数据类型，它可以让数据更简洁，更易读。

- 枚举类型声明

enum　枚举名　{枚举元素1, 枚举元素2, ……};

使用 #define 定义别名, 来定义枚举

```c 定义一周的枚举类型
#define MON  1
#define TUE  2
#define WED  3
#define THU  4
#define FRI  5
#define SAT  6
#define SUN  7

enum DAY
{
    MON=1, TUE, WED, THU, FRI, SAT, SUN
};
// 第一个枚举成员的默认值为整型的 0，后续枚举成员的值在前一个成员上加 1。

enum season {spring, summer=3, autumn, winter}; // 可以在定义枚举类型时改变枚举元素的值, 没有指定值的枚举元素，其值为前一元素加 1
```

- 枚举变量定义

enum enum_type_name { e0, e1, ... }; enum enum_type_name enum_value_name; // 先定义枚举类型，再定义枚举变量
enum enum_type_name { e0, e1, ... } enum_value_name; // 定义枚举类型的同时定义枚举变量
enum  { e0, e1, ... } enum_value_name; // 省略枚举名称，直接定义枚举变量

在C 语言中，枚举类型是被当做 int 或者 unsigned int 类型来处理的，所以按照 C 语言规范是没有办法遍历枚举类型的。不过在一些特殊的情况下，当枚举类型是连续可以实现有条件的遍历。

- 整数转换成枚举

enum enum_type_name enum_value_name = ( enum enum_type_name ) int_value;

> 2. void 类型


#### 02.03. 标识符 & 变量 & 常量 & 修饰符 & 存储类

标识符规范, 变量常量定义及使用, 作用域等。

标识符是用来标识变量、函数，或任何其他用户自定义项目的名称; 一个标识符以字母 A-Z 或 a-z 或下划线 _ 开始，后跟零个或多个字母、下划线和数字（0-9）; C语言中, 不允许出现标点字符，比如 @、$ 和 %。C 是区分大小写的编程语言。

- const

- auto
- static
- register
- extern

- volatile
- typedef 标识符
- sizeof  标识符

[float-单精度浮点值-存储结构：1位符号，8位指数，23位小数](https://www.runoob.com/wp-content/uploads/2014/09/v2-749cc641eb4d5dafd085e8c23f8826aa_hd.png)

[double-双精度浮点值-存储结构：1位符号，11位指数，52位小数](https://www.runoob.com/wp-content/uploads/2014/09/v2-749cc641eb4d5dafd085e8c23f8826aa_hd.png)

> 1. 变量声明定义

变量定义, 其含义就是, 告诉编译器在何处创建变量的存储，以及如何创建变量的存储。

变量, 其本质是程序可操作存储区的名称, 变量有其特定类型, 其类型决定了其存储的大小和布局(字段的存储结构)。

变量是对程序中数据所占内存空间的一种抽象定义,定义变量时,用户定义变量的名、 变量的类型,这些都是变量的操作属性。不仅可以通过变量名访问该变量,系统还通过该标识符确定变量 在内存中的位置。C 语言中定义了 4 种存储属性,即自动变量、外部变量、静 态变量和寄存器变量,它关系到变量在内存中的存放位置, 由此决定了变量的保留时间和变量的作用范围。变量的保留时间又称为生存期,从时间的角度,可将变量分为静态存储和动态存储两种情况。

静态存 储是指变量存储在内存的静态存储区,在编译时就分配了存储空间,在整个程序的运行期间,该变量占有 固定的存储单元,程序结束后,这部分空间才释放,变量的值在整个程序中始终存在;动态存储是指变量 存储在内存的动态存储区,在程序的运行过程中,只有当变量所在的函数被调用时,编译系统才临时为该 变量分配一段内存单元,函数调用结束,该变量空间释放,变量的值只在函数调用期存在。

变量的作用范围又称为作用域,从空间角度,可以将变量分为全局变量和局部变量。局部变量是在一 个函数或复合语句内定义的变量,它仅在函数或复合语句内有效,编译时,编译系统不为局部变量分配内 存单元,而是在程序运行过程中,当局部变量所在的函数被调用时,编译系统根据需要,临时分配内存, 调用结束,空间释放;全局变量是在函数之外定义的变量,其作用范围为从定义处开始到本文件结束,编 译时,编译系统为其分配固定的内存单元,在程序运行的自始至终都占用固定单元。 


变量的名称可以由字母、数字和下划线字符组成。它必须以字母或下划线开头。C语言是大小写敏感的。

type variable_list; // type 是明确有效的一个数据类型, variable_list 可以是一个或多个标识符以逗号分隔。

type variable_name = value; // 变量可以在声明的时候被初始化（指定一个初始值）。初始化器由一个等号，后跟一个常量表达式组成。不带初始化的定义：带有静态存储持续时间的变量会被隐式初始化为 NULL（所有字节的值都是 0），其他所有变量的初始值是未定义的。

变量声明向编译器保证变量以指定的类型和名称存在，这样编译器在不需要知道变量完整细节的情况下也能继续进一步的编译。变量声明只在编译时有它的意义，在程序连接时编译器需要实际的变量声明。
- 变量的声明有两种情况:
- 1、一种是需要建立存储空间的。例如：int a 在声明的时候就已经建立了存储空间, 即声明也定义变量。
- 2、另一种是不需要建立存储空间的，通过使用extern关键字声明变量名而不定义它, 只声明不定义变量。 除非有extern关键字，否则都是变量的定义。

> 2. 定义常量

常量是固定值，在程序执行期间不会改变。这些固定的值，又叫做字面量。其在定义后不能修改。

const type variable = value; // 通过 const 关键字定义常量

#define identifier value;    // 通过#define 预处理器定义常量

[](https://www.runoob.com/wp-content/uploads/2014/09/c-const-2021-01-15.png)

> 3. 存储类

存储类定义 C 程序中变量/函数的范围（可见性）和生命周期。这些说明符放置在它们所修饰的类型之前。

- auto     所有局部变量默认的存储类，auto 只能用在函数内，即 auto 只能修饰局部变量
- static   指示编译器在程序的生命周期内保持局部变量的存在，而不需要在每次它进入和离开作用域时进行创建和销毁。可以在函数调用之间保持局部变量的值
- register 用于定义存储在寄存器中而不是 RAM 中的局部变量, 这意味着变量的最大尺寸等于寄存器的大小，因为没有内存位置所以不能对它应用一元的 '&' 运算符
- extern   用于提供一个全局变量的引用，全局变量对所有的程序文件都是可见的，extern 修饰符通常用于当有两个或多个文件共享相同的全局变量或函数的时候

寄存器只用于需要快速访问的变量，比如计数器。还应注意的是，定义 'register' 并不意味着变量将被存储在寄存器中，它意味着变量可能存储在寄存器中，这取决于硬件和实现的限制。

static 修饰符也可以应用于全局变量。当 static 修饰全局变量时，会使变量的作用域限制在声明它的文件内。全局声明的一个 static 变量或方法可以被任何函数或方法调用，只要这些方法出现在跟 static 变量或方法同一个文件中。

当使用 extern 时，对于无法初始化的变量，会把变量名指向一个之前定义过的存储位置。当您有多个文件且定义了一个可以在其他文件中使用的全局变量或函数时，可以在其他文件中使用 extern 来得到已定义的变量或函数的引用。可以这么理解，extern 是用来在另一个文件中声明一个全局变量或函数。

> 4. typedef 标识符

可以 使用 typedef 它来为类型取一个新的名字, 按照惯例，定义时会大写字母，以便提醒用户类型名称是一个象征性的缩写，但您也可以使用小写字母

也可以使用 typedef 来为用户自定义的数据类型取一个新的名字, 您可以对结构体使用 typedef 来定义一个新的数据类型名字，然后使用这个新的数据类型来直接定义结构变量

- typedef 表达式

typedef type NEW_TYPE_NAME;

typedef struct struct_name
{
 ...
} NEW_STRUCT_NAME;

NEW_STRUCT_NAME s_v;

- typedef vs #define

#define 是 C 指令，用于为各种数据类型定义别名，与 typedef 类似, 但是有几点不同:

typedef 仅限于为类型定义符号名称，#define 不仅可以为类型定义别名，也能为数值定义别名，比如您可以定义 1 为 ONE。
typedef 是由编译器执行解释的，#define 语句是由预编译器进行处理的。


#### 02.04. 运算符

- 算术运算符
- 关系运算符
- 逻辑运算符
- 位运算符
- 赋值运算符
- 杂项运算符

- 运算符优先级

#### 02.05. 语句&表达式


#### 02.06. 逻辑控制结构: 判断, 循环, 递归

- if
- else
- switch
- case
- default
- for
- do
- while
- continue
- break
- return
- goto

> 1. 判断

判断结构要求指定一个或多个要评估或测试的条件，以及条件为真时要执行的语句（必需的）和条件为假时要执行的语句（可选的）。

![判断流程图](https://static.runoob.com/wp-content/uploads/c/C-decision-20200923-1.svg)

C 语言把任何非零和非空的值假定为 true，把零或 null 假定为 false。

- if
- if-else
- 嵌套判断
- switch-case-default
- ? : 运算符 (三元运算符)

> 3. 循环

循环语句允许多次执行一个语句或语句组

![循环流程图](https://www.runoob.com/wp-content/uploads/2015/12/loop.png)

- for
- while
- do-while
- 嵌套循环

> 4. 控制

- continue  告诉一个循环体立刻停止本次循环迭代，重新开始下次循环迭代。
- break     终止循环或 switch 语句，程序流将继续执行紧接着循环或 switch 的下一条语句。
- return    返回函数
- goto      将控制转移到被标记的语句。但是不建议在程序中使用 goto 语句。

> 5. 递归

递归指的是在函数的定义中使用函数自身的方法。C 语言支持递归，即一个函数可以调用其自身。

![递归流程图](https://www.runoob.com/wp-content/uploads/2014/09/recursion_0.png)


#### 02.07. 函数

函数是一组一起执行一个任务的语句。每个 C 程序都至少有一个函数，即主函数 main() 。

函数声明告诉编译器函数的名称、返回类型和参数。函数定义提供了函数的实际主体。函数声明会告诉编译器函数名称及如何调用函数。

> 1. 函数声明

return_type function_name( parameter list )
{
   body of the function
}

// return_type : 返回类型, 函数返回的值的数据类型
// function_name: 函数名称, 函数的实际名称。函数名和参数列表一起构成了函数签名。
// parameter list: 参数列表, 参数就像是占位符。当函数被调用时，您向参数传递一个值，这个值被称为实际参数。参数列表包括函数参数的类型、顺序、数量。
// { body of the function } : 函数体, 包含一组定义函数执行任务的语句, 由一对花括号包裹

> 2. 函数定义

return_type function_name( parameter list );

函数声明会告诉编译器函数名称及如何调用函数，函数声明中，参数的名称并不重要，只有参数的类型是必需的，所以参数名称可以忽略。

当您在一个源文件中定义函数且在另一个文件中调用函数时，函数声明是必需的。在这种情况下，您应该在调用函数的文件顶部声明函数。即调用函数之间, 必须声明。

> 3. 函数调用

当程序调用函数时，程序控制权会转移给被调用的函数。被调用的函数执行已定义的任务，当函数的返回语句被执行时，或到达函数的结束括号时，会把程序控制权交还给主程序。

return_type return_value = function_name ( parameter list );

如果函数要使用参数，则必须声明接受参数值的变量。这些变量称为函数的形式参数。形式参数就像函数内的其他局部变量，在进入函数时被创建，退出函数时被销毁。

当调用函数时，有两种向函数传递参数的方式：

- 传值调用, 该方法把参数的实际值复制给函数的形式参数。在这种情况下，修改函数内的形式参数不会影响实际参数。
- 引用调用, 通过指针传递方式，形参为指向实参地址的指针，当对形参的指向操作时，就相当于对实参本身进行的操作。

默认情况下，C 使用传值调用来传递参数。一般来说，这意味着函数内的代码不能改变用于调用函数的实际参数。

> 4. 可变参数

可变参数, 解决函数带有可变数量的参数，而不是预定义数量的参数。允许您定义一个函数，能根据具体的需求接受可变数量的参数。

要使用可变参数, 需要使用 stdarg.h 头文件，该文件提供了实现可变参数功能的函数和宏

- 定义可变参数

在函数定义时, 最后一个参数使用 省略号 ... 表示, 省略号前面可以设置自定义参数

函数定义中创建一个 va_list 类型变量，该类型是在 stdarg.h 头文件中定义的, 使用 int 参数和 va_start 宏来初始化 va_list 变量为一个参数列表。宏 va_start 是在 stdarg.h 头文件中定义的。使用 va_arg 宏和 va_list 变量来访问参数列表中的每个项。使用宏 va_end 来清理赋予 va_list 变量的内存。

```c
#include <stdio.h>
#include <stdarg.h>
 
double average(int num,...)
{
 
    va_list valist;
    double sum = 0.0;
    int i;
 
    /* 为 num 个参数初始化 valist */
    va_start(valist, num);
 
    /* 访问所有赋给 valist 的参数 */
    for (i = 0; i < num; i++)
    {
       sum += va_arg(valist, int);
    }
    /* 清理为 valist 保留的内存 */
    va_end(valist);
 
    return sum/num;
}
 
int main()
{
   printf("Average of 2, 3, 4, 5 = %f\n", average(4, 2,3,4,5));
   printf("Average of 5, 10, 15 = %f\n", average(3, 5,10,15));
}
```

> 5. 命令行参数

执行程序时，可以从命令行传值给 C 程序。这些值被称为命令行参数，命令行参数是使用 main() 函数参数来处理的，其中，argc 是指传入参数的个数，argv[] 是一个指针数组，指向传递给程序的每个参数。

int main( int argc, char *argv[] ) {}

argv[0] 存储程序的名称，argv[1] 是一个指向第一个命令行参数的指针，*argv[n] 是最后一个参数。如果没有提供任何参数，argc 将为 1，否则，如果传递了一个参数，argc 将被设置为 2。

多个命令行参数之间用空格分隔，但是如果参数本身带有空格，那么传递参数的时候应把参数放置在双引号 "" 或单引号 '' 内部。


#### 02.08. 作用域

作用域是程序中定义的变量所存在的区域，超过该区域变量就不能被访问

C语言中能声明变量的地方:
- 1. 在函数或块内部的局部变量
- 2. 在所有函数外部的全局变量
- 3. 在形式参数的函数参数定义中

局部变量, 在某个函数或块的内部声明的变量, 其只能被该函数或该代码块内部的语句使用, 局部变量在函数外部是不可知的

全局变量, 定义在函数外部，通常是在程序的顶部, 全局变量在整个程序生命周期内都是有效的，在任意的函数内部能访问全局变量。全局变量可以被任何函数访问。也就是说，全局变量在声明后整个程序中都是可用的。

形式参数, 函数的参数, 被当作该函数内的局部变量，如果与全局变量同名它们会优先使用


全局变量保存在内存的全局存储区中，占用静态的存储单元；局部变量保存在栈中，只有在所在函数被调用时才动态地为变量分配存储单元。在程序中，局部变量和全局变量的名称可以相同，但是在函数内，如果两个名字相同，会优先使用局部变量值。当局部变量被定义时，系统不会对其初始化，您必须自行对其初始化。定义全局变量时，系统会自动对其初始化。

形参与实参，从字面上理解，所谓形式参数即只只是声明了一个作为参数的变量，并未直接进行赋值使用，而实际参数则相反。



### 03. 特性概念

#### 03.01 预处理器: 头文件, 宏定义&宏运算

- include 标识符
- #define 标识符

预处理器不是编译器的组成部分，但是它是编译过程中一个单独的步骤。简言之，只不过是一个文本替换工具而已，它们会指示编译器在实际编译之前完成所需的预处理。

C 预处理器（C Preprocessor）简写为 CPP

所有的预处理器命令都是以井号（#）开头。它必须是第一个非空字符，为了增强可读性，预处理器指令应从第一列开始。

- 预处理指令列表

#include	包含一个源代码文件

#define	    定义宏, #define macro-name replacement-text 
#undef	    取消已定义的宏
#ifdef	    如果宏已经定义，则返回真
#ifndef	    如果宏没有定义，则返回真

#if	        如果给定条件为真，则编译下面代码
#else	    #if 的替代方案
#elif	    如果前面的 #if 给定条件不为真，当前条件为真，则编译下面代码
#endif	    结束一个条件编译块

#error	    当遇到标准错误时，输出错误消息

#pragma	使用标准化方法，向编译器发布特殊的命令到编译器中

- 使用预处理指令案例

#include <stdio.h>           // 指示 CPP 从系统库中获取 stdio.h，并添加文本到当前的源文件中
#include "myheader.h"        // 指示 CPP 从本地目录中获取 myheader.h，并添加内容到当前的源文件中。

#define MAX_ARRAY_LENGTH 20  // 指示 CPP 把所有的 MAX_ARRAY_LENGTH 替换为 20, 使用 #define 定义常量来增强可读性。

#undef  MAX_ARRAY_LENGTH     // 指示 CPP 取消已定义的 MAX_ARRAY_LENGTH，并定义它为 42
#define MAX_ARRAY_LENGTH 20

#ifndef MAX_ARRAY_LENGTH     // 指示 CPP 只有当 MAX_ARRAY_LENGTH 未定义时，才定义 MESSAGE
  #define MAX_ARRAY_LENGTH 20
#endif

#ifdef DEBUG // 指示 CPP 只有当 DEBUG 已定义时，则执行处理语句, 当向 gcc 编译器传递了 -DDEBUG 开关量, 这个指令则会起作用, 可以在编译期间开启关闭调试
#endif

- 预定义宏, ANSI C 中预设定义的宏, 可以使用这些宏但不能修改宏的值

__DATE__  当前日期，一个以 "MMM DD YYYY" 格式表示的字符常量。
__TIME__  当前时间，一个以 "HH:MM:SS" 格式表示的字符常量。
__FILE__  这会包含当前文件名，一个字符串常量。
__LINE__  这会包含当前行号，一个十进制常量。
__STDC__  当编译器以 ANSI 标准编译时，则定义为 1

- 预处理器运算符, 用来创建宏

1. 宏延续运算符（\）, 一个宏通常写在一个单行上。但是如果宏太长，一个单行容纳不下，则使用宏延续运算符（\）。

#define  message_for(a, b)  \
    printf(#a " and " #b ": We love you!\n")

2. 字符串常量化运算符（#）, 在宏定义中，当需要把一个宏的参数转换为字符串常量时，则使用字符串常量化运算符（#）。在宏中使用的该运算符有一个特定的参数或参数列表。# 运算符会把 replacement-text 令牌转换为用引号引起来的字符串

#define  message_for(a, b)  \
    printf(#a " and " #b ": We love you!\n")

message_for(Carole, Debra); // 输出: Carole and Debra: We love you!

3. 标记粘贴运算符（##）, 宏定义内的标记粘贴运算符（##）会合并两个参数。它允许在宏定义中两个独立的标记被合并为一个标记。

#define tokenpaster(n) printf ("token" #n " = %d", token##n)

tokenpaster(34); // 输出: token34 = 40 ; 此时: printf ("token34 = %d", token34);

4. defined() 运算符

预处理器 defined 运算符是用在常量表达式中的，用来确定一个标识符是否已经使用 #define 定义过。如果指定的标识符已定义，则值为真（非零）。如果指定的标识符未定义，则值为假（零）。

```c
#if !defined (MESSAGE)
   #define MESSAGE "You wish!"
#endif
```

5. 参数化的宏 , 可以使用参数化的宏来模拟函数, 使用带有参数的宏之前，必须使用 #define 指令定义, 参数列表是括在圆括号内，且必须紧跟在宏名称的后边, 宏名称和左圆括号之间不允许有空格

int square(int x) {
   return x * x;
}

宏实现: #define square(x) ((x) * (x))

6. 头文件

头文件是扩展名为 .h 的文件，包含了 C 函数声明和宏定义，被多个源文件中引用共享。有两种类型的头文件：程序员编写的头文件和编译器自带的头文件。

要使用头文件，需要使用 C 预处理指令 #include 来引用它。引用头文件相当于复制头文件的内容，但是我们不会直接在源文件中复制头文件的内容，因为这么做很容易出错，特别在程序是由多个源文件组成的时候。

A simple practice in C 或 C++ 程序中，建议把所有的常量、宏、系统全局变量和函数原型写在头文件中，在需要的时候随时引用这些头文件。

#include <file>  引用用户和系统头文件。它在系统目录的标准列表中搜索名为 file 的文件。在编译源代码时，您可以通过 -I 选项把目录前置在该列表前。引用的是编译器的类库路径里面的头文件。
#include "file"  于引用用户头文件, 在包含当前文件的目录中搜索名为 file 的文件。在编译源代码时，您可以通过 -I 选项把目录前置在该列表前。引用的是你程序目录的相对路径中的头文件，如果在程序目录没有找到引用的头文件则到编译器的类库路径的目录下找该头文件。

如果一个头文件被引用两次，编译器会处理两次头文件的内容，这将产生错误。为了防止这种情况，标准的做法是把文件的整个内容放在条件编译语句中, 这种结构就是通常所说的包装器 #ifndef。

```c
#ifndef HEADER_FILE
#define HEADER_FILE

the entire header file file

#endif
```

有时需要从多个不同的头文件中选择一个引用到程序中。需要指定在不同的操作系统上使用的配置参数。您可以通过一系列条件来实现这点

```c
#if SYSTEM_1
   # include "system_1.h"
#elif SYSTEM_2
   # include "system_2.h"
#elif SYSTEM_3
   ...
#endif
```

如果头文件比较多的时候，这么做是很不妥当的，预处理器使用宏来定义头文件的名称。这就是所谓的有条件引用。它不是用头文件的名称作为 #include 的直接参数，您只需要使用宏名称代替即可, SYSTEM_H 会扩展，预处理器会查找 system_1.h，就像 #include 最初编写的那样。SYSTEM_H 可通过 -D 选项被您的 Makefile 定义。

```c
#define SYSTEM_H "system_1.h"
...
#include SYSTEM_H
```


#### 03.02 强制类型转换

强制类型转换是把变量从一种类型转换为另一种数据类型。使用强制类型转换运算符来把值显式地从一种类型转换为另一种类型

- 强制类型转换表达式

(type_name) expression;

强制类型转换运算符的优先级大于除法

类型转换可以是隐式的，由编译器自动执行，也可以是显式的，通过使用强制类型转换运算符来指定。在编程时，有需要类型转换的时候都用上强制类型转换运算符，是一种良好的编程习惯。

整数提升, 整数提升是指把小于 int 或 unsigned int 的整数类型转换为 int 或 unsigned int 的过程。

常用的算术转换是隐式地把值强制转换为相同的类型, 编译器首先执行整数提升，如果操作数类型不同，则它们会被转换为下列层次中出现的最高层次的类型, 如果一个运算符两边的运算数类型不同，先要将其转换为相同的类型，即较低类型转换为较高类型，然后再参加运算

![](https://www.runoob.com/wp-content/uploads/2014/08/usual_arithmetic_conversion.png)

常用的算术转换不适用于赋值运算符、逻辑运算符 && 和 ||。

#### 03.03 错误处理

C 语言不提供对错误处理的直接支持，但是作为一种系统编程语言，它以返回值的形式允许您访问底层数据。

在发生错误时，大多数的 C 或 UNIX 函数调用返回 1 或 NULL，同时会设置一个错误代码 errno，该错误代码是全局变量，表示在函数调用期间发生了错误。您可以在 errno.h 头文件中找到各种各样的错误代码。

C 程序员可以通过检查返回值，然后根据返回值决定采取哪种适当的动作。开发人员应该在程序初始化时，把 errno 设置为 0，这是一种良好的编程习惯。0 值表示程序中没有错误。

- errno、perror() 和 strerror()

perror()   函数显示您传给它的字符串，后跟一个冒号、一个空格和当前 errno 值的文本表示形式。
strerror() 函数，返回一个指针，指针指向当前 errno 值的文本表示形式。

```c
// 模拟一种错误情况，尝试打开一个不存在的文件。
// 您可以使用多种方式来输出错误消息，在这里我们使用函数来演示用法。另外有一点需要注意，您应该使用 stderr 文件流来输出所有的错误。

#include <stdio.h>
#include <errno.h>
#include <string.h>
 
extern int errno ;
 
int main ()
{
   FILE * pf;
   int errnum;
   pf = fopen ("unexist.txt", "rb");
   if (pf == NULL)
   {
      errnum = errno;
      fprintf(stderr, "错误号: %d\n", errno);
      perror("通过 perror 输出错误");
      fprintf(stderr, "打开文件错误: %s\n", strerror( errnum ));
   }
   else
   {
      fclose (pf);
   }
   return 0;
}

// 输出:

// 错误号: 2
// 通过 perror 输出错误: No such file or directory
// 打开文件错误: No such file or directory
```

- 被零除的错误

在进行除法运算时，如果不检查除数是否为零，则会导致一个运行时错误。代码在进行除法运算前会先检查除数是否为零

- 程序退出状态

通常情况下，程序成功执行完一个操作正常退出的时候会带有值 EXIT_SUCCESS。在这里，EXIT_SUCCESS 是宏，它被定义为 0。如果程序中存在一种错误情况，当您退出程序时，会带有状态值 EXIT_FAILURE，被定义为 -1


#### 03.04 字符串

C 语言中，字符串实际上是使用 null 字符 \0 终止的一维字符数组。因此，一个以 null 结尾的字符串，包含了组成字符串的字符。

![字符串内存结构](https://www.runoob.com/wp-content/uploads/2014/09/c-strings-2020-12-21.png)

- 字符串变量定义

char str[] = "";

- 字符串操作函数

strcpy(s1, s2); // 复制字符串 s2 到字符串 s1。
strcat(s1, s2); // 连接字符串 s2 到字符串 s1 的末尾。
strlen(s1);     // 返回字符串 s1 的长度。
strcmp(s1, s2); // 如果 s1 和 s2 是相同的，则返回 0；如果 s1<s2 则返回小于 0；如果 s1>s2 则返回大于 0。
strchr(s1, ch); // 返回一个指针，指向字符串 s1 中字符 ch 的第一次出现的位置。
strstr(s1, s2); // 返回一个指针，指向字符串 s1 中字符串 s2 的第一次出现的位置。


### 04. 基础库

> C语言核心标准库, 以及基于标准的基础操作

#### 04.01. 基础操作

> 1. 输入&输出

提到输入时，这意味着要向程序填充一些数据。输入可以是以文件的形式或从命令行中进行。C提供了一系列内置的函数来读取给定的输入，并根据需要填充到程序中。提到输出时，这意味着要在屏幕上、打印机上或任意文件中显示一些数据。C 语言提供了一系列内置的函数来输出数据到计算机屏幕上和保存数据到文本文件或二进制文件中。

- 标准文件, C 语言把所有的设备都当作文件。所以设备（比如显示器）被处理的方式与文件相同。标准文件会在程序执行时自动打开，以便访问键盘和屏幕。
 
stdin  标准输入文件指针, 键盘设备输入
stdout 标准输出文件指针, 屏幕设备输出
stderr 标准错误输出文件指针, 屏幕设备输出

- 文件指针操作

文件指针是访问文件的方式，C 语言中的 I/O (输入/输出) 通常使用 printf() 和 scanf() 两个函数。scanf() 函数用于从标准输入（键盘）读取并格式化， printf() 函数发送格式化输出到标准输出（屏幕）。

```c 标准输出案例
#include <stdio.h>      // 执行 printf() 函数需要该库

int main()
{
    printf("标准输出案例");  // 格式化输出到屏幕, printf() 函数在 "stdio.h" 头文件中声明。
    return 0;
}
```

nt getchar(void)   函数从屏幕读取下一个可用的字符，并把它返回为一个整数。这个函数在同一个时间内只会读取一个单一的字符。您可以在循环内使用这个方法，以便从屏幕上读取多个字符。
int putchar(int c) 函数把字符输出到屏幕上，并返回相同的字符。这个函数在同一个时间内只会输出一个单一的字符。您可以在循环内使用这个方法，以便在屏幕上输出多个字符。

char *gets(char *s)     函数从 stdin 读取一行到 s 所指向的缓冲区，直到一个终止符或 EOF。
int puts(const char *s) 函数把字符串 s 和一个尾随的换行符写入到 stdout。

int scanf(const char *format, ...)  函数从标准输入流 stdin 读取输入，并根据提供的 format 来浏览输入。读取字符串时，只要遇到一个空格，scanf() 就会停止读取
int printf(const char *format, ...) 函数把输出写入到标准输出流 stdout ，并根据提供的格式产生输出。

format 可以是一个简单的常量字符串，但是您可以分别指定 %s、%d、%c、%f 等来输出或读取字符串、整数、字符或浮点数。


> 2. 文件读写

使用文件操作函数, 创建、打开、关闭文本文件或二进制文件。

- 打开文件

FILE *fopen( const char * filename, const char * mode ); // 创建一个新的文件或者打开一个已有的文件, 调用会初始化类型 FILE 的一个对象，类型 FILE 包含了所有用来控制流的必要的信息。

访问模式 mode: 

r	打开一个已有的文本文件，允许读取文件。
w	打开一个文本文件，允许写入文件。如果文件不存在，则会创建一个新文件。在这里，您的程序会从文件的开头写入内容。如果文件存在，则该会被截断为零长度，重新写入。
a	打开一个文本文件，以追加模式写入文件。如果文件不存在，则会创建一个新文件。在这里，您的程序会在已有的文件内容中追加内容。
r+	打开一个文本文件，允许读写文件。
w+	打开一个文本文件，允许读写文件。如果文件已存在，则文件会被截断为零长度，如果文件不存在，则会创建一个新文件。
a+	打开一个文本文件，允许读写文件。如果文件不存在，则会创建一个新文件。读取会从文件的开头开始，写入则只能是追加模式。

"rb", "wb", "ab", "rb+", "r+b", "wb+", "w+b", "ab+", "a+b" // 访问二进制文件模式

- 关闭文件

int fclose( FILE *fp ); // 成功关闭文件，fclose( ) 函数返回零，如果关闭文件时发生错误，函数返回 EOF。这个函数实际上，会清空缓冲区中的数据，关闭文件，并释放用于该文件的所有内存。EOF 是一个定义在头文件 stdio.h 中的常量。

- 写入文件

int fputc( int c, FILE *fp ); // 字符写入到流中, 把参数 c 的字符值写入到 fp 所指向的输出流中。如果写入成功，它会返回写入的字符，如果发生错误，则会返回 EOF。

int fputs( const char *s, FILE *fp ); // 把字符串 s 写入到 fp 所指向的输出流中。如果写入成功，它会返回一个非负值，如果发生错误，则会返回 EOF。

int fprintf(FILE *fp,const char *format, ...); // 把一个字符串写入到文件中

- 读取文件

int fgetc( FILE * fp ); // 从文件读取单个字符, 从 fp 所指向的输入文件中读取一个字符。返回值是读取的字符，如果发生错误则返回 EOF。

char *fgets( char *buf, int n, FILE *fp ); // 从 fp 所指向的输入流中读取 n - 1 个字符。它会把读取的字符串复制到缓冲区 buf，并在最后追加一个 null 字符来终止字符串。

如果这个函数在读取最后一个字符之前就遇到一个换行符 '\n' 或文件的末尾 EOF，则只会返回读取到的字符，包括换行符。

int fscanf(FILE *fp, const char *format, ...) // 从文件中读取字符串，但是在遇到第一个空格和换行符时，它会停止读取。

- 二进制 I/O 函数

size_t fread(void *ptr, size_t size_of_elements, size_t number_of_elements, FILE *a_file);        // 用于存储块的读 - 通常是数组或结构体

size_t fwrite(const void *ptr, size_t size_of_elements, size_t number_of_elements, FILE *a_file); // 用于存储块的写 - 通常是数组或结构体


> 3. 内存管理

动态内存管理。C 语言为内存的分配和管理提供了几个函数。这些函数可以在 <stdlib.h> 头文件中找到。

void * 类型表示未确定类型的指针。C、C++ 规定 void * 类型可以通过类型转换强制转换为任何其它类型的指针。

当动态分配内存时，您有完全控制权，可以传递任何大小的值。而那些预先定义了大小的数组，一旦定义则无法改变大小。

- void *calloc(int num, int size);

在内存中动态地分配 num 个长度为 size 的连续空间，并将每一个字节都初始化为 0。所以它的结果是分配了 num*size 个字节长度的内存空间，并且每个字节的值都是0。

- void free(void *address);

该函数释放 address 所指向的内存块,释放的是动态分配的内存空间。

- void *malloc(int num);

在堆区分配一块指定大小的内存空间，用来存放数据。这块内存空间在函数执行完成后不会被初始化，它们的值是未知的。

- void *realloc(void *address, int newsize);

该函数重新分配内存，把内存扩展到 newsize。

```c
// 定义一个指针，该指针指向未定义所需内存大小的字符，后续再根据需求来分配内存

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
int main()
{
   char name[100];
   char *description;
 
   strcpy(name, "Zara Ali");
 
   /* 动态分配内存 */
   description = (char *) malloc( 200 * sizeof(char) );
   if( description == NULL )
   {
      fprintf(stderr, "Error - unable to allocate required memory\n");
   }
   else
   {
      strcpy( description, "Zara ali a DPS student in class 10th");
   }
   printf("Name = %s\n", name );
   printf("Description: %s\n", description );
}

// Name = Zara Ali
// Description: Zara ali a DPS student in class 10th
```

当程序退出时，操作系统会自动释放所有分配给程序的内存，但是，建议您在不需要内存时，都应该调用函数 free() 来释放内存。或者，您可以通过调用函数 realloc() 来增加或减少已分配的内存块的大小。

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
int main()
{
   char name[100];
   char *description;
 
   strcpy(name, "Zara Ali");
 
   /* 动态分配内存 */
   description = (char *)malloc( 30 * sizeof(char) );
   if( description == NULL )
   {
      fprintf(stderr, "Error - unable to allocate required memory\n");
   }
   else
   {
      strcpy( description, "Zara ali a DPS student.");
   }
   /* 假设您想要存储更大的描述信息 */
   description = (char *) realloc( description, 100 * sizeof(char) );
   if( description == NULL )
   {
      fprintf(stderr, "Error - unable to allocate required memory\n");
   }
   else
   {
      strcat( description, "She is in class 10th");
   }
   
   printf("Name = %s\n", name );
   printf("Description: %s\n", description );
 
   /* 使用 free() 函数释放内存 */
   free(description);
}

// Name = Zara Ali
// Description: Zara ali a DPS student.She is in class 10th
```

#### 04.02. 标准库

> 1. assert.h

标准库的 assert.h头文件提供了一个名为 assert 的宏，它可用于验证程序做出的假设，并在假设为假时输出诊断消息。

已定义的宏 assert 指向另一个宏 NDEBUG，宏 NDEBUG 不是 <assert.h> 的一部分。

如果已在引用 <assert.h> 的源文件中定义 NDEBUG 为宏名称，则 assert 宏的定义如下：#define assert(ignore) ((void)0)

void assert(int expression); // 这实际上是一个宏，不是一个函数，可用于在 C 程序中添加诊断。

> 2. ctype.h

标准库的 ctype.h 头文件提供了一些函数，可用于测试和映射字符。这些函数接受 int 作为参数，它的值必须是 EOF 或表示为一个无符号字符。如果参数 c 满足描述的条件，则这些函数返回非零（true）。如果参数 c 不满足描述的条件，则这些函数返回零。

int isalnum(int c);  // 该函数, 检查所传的字符, 是否是字母和数字
int isalpha(int c);  // 该函数, 检查所传的字符, 是否是字母
int iscntrl(int c);  // 该函数, 检查所传的字符, 是否是控制字符
int isdigit(int c);  // 该函数, 检查所传的字符, 是否是十进制数字
int isgraph(int c);  // 该函数, 检查所传的字符, 是否有图形表示法
int islower(int c);  // 该函数, 检查所传的字符, 是否是小写字母
int isprint(int c);  // 该函数, 检查所传的字符, 是否是可打印的
int ispunct(int c);  // 该函数, 检查所传的字符, 是否是标点符号字符
int isspace(int c);  // 该函数, 检查所传的字符, 是否是空白字符
int isupper(int c);  // 该函数, 检查所传的字符, 是否是大写字母
int isxdigit(int c); // 该函数, 检查所传的字符, 是否是十六进制数字

int tolower(int c); // 该函数把大写字母转换为小写字母
int toupper(int c); // 该函数把小写字母转换为大写字母

> 3. errno.h

标准库的 errno.h 头文件定义了整数变量 errno，它是通过系统调用设置的，在错误事件中的某些库函数表明了什么发生了错误。定义了一系列表示不同错误代码的宏，这些宏应扩展为类型为 int 的整数常量表达式。

该宏扩展为类型为 int 的可更改的左值，因此它可以被一个程序读取和修改。

在程序启动时，errno 设置为零，C 标准库中的特定函数修改它的值为一些非零值以表示某些类型的错误。您也可以在适当的时候修改它的值或重置为零。

extern int errno;    // 这是通过系统调用设置的宏，在错误事件中的某些库函数表明了什么发生了错误。
EDOM Domain Error;  // 这个宏表示一个域错误，它在输入参数超出数学函数定义的域时发生，errno 被设置为 EDOM
ERANGE Range Error; // 这个宏表示一个范围错误，它在输入参数超出数学函数定义的范围时发生，errno 被设置为 ERANGE。

> 4. float.h

标准库的 float.h 头文件包含了一组与浮点值相关的依赖于平台的常量。这些常量是由 ANSI C 提出的，这让程序更具有可移植性。

> 5. limits.h

标准库的 limits.h 头文件决定了各种变量类型的各种属性。定义在该头文件中的宏限制了各种变量类型（比如 char、int 和 long）的值。

这些限制指定了变量不能存储任何超出这些限制的值，例如一个无符号可以存储的最大值是 255。

> 6. locale.h

标准库的 locale.h 头文件定义了特定地域的设置，比如日期格式和货币符号。

char *setlocale(int category, const char *locale); // 设置或读取地域化信息
struct lconv *localeconv(void); // 设置或读取地域化信息

typedef struct {
   char *decimal_point;          // 用于非货币值的小数点字符
   char *thousands_sep;          // 用于非货币值的千位分隔符
   char *grouping;               // 一个表示非货币量中每组数字大小的字符串。每个字符代表一个整数值，每个整数指定当前组的位数。值为 0 意味着前一个值将应用于剩余的分组
   char *int_curr_symbol;        // 国际货币符号使用的字符串。前三个字符是由 ISO 4217:1987 指定的，第四个字符用于分隔货币符号和货币量。
   char *currency_symbol;        // 用于货币的本地符号
   char *mon_decimal_point;      // 用于货币值的小数点字符
   char *mon_thousands_sep;      // 用于货币值的千位分隔符
   char *mon_grouping;           // 一个表示货币值中每组数字大小的字符串。每个字符代表一个整数值，每个整数指定当前组的位数。值为 0 意味着前一个值将应用于剩余的分组
   char *positive_sign;          // 用于正货币值的字符
   char *negative_sign;          // 用于负货币值的字符
   char int_frac_digits;         // 国际货币值中小数点后要显示的位数
   char frac_digits;             // 货币值中小数点后要显示的位数
   char p_cs_precedes;           // 如果等于 1，则 currency_symbol 出现在正货币值之前。如果等于 0，则 currency_symbol 出现在正货币值之后
   char p_sep_by_space;          // 如果等于 1，则 currency_symbol 和正货币值之间使用空格分隔。如果等于 0，则 currency_symbol 和正货币值之间不使用空格分隔
   char n_cs_precedes;           // 如果等于 1，则 currency_symbol 出现在负货币值之前。如果等于 0，则 currency_symbol 出现在负货币值之后
   char n_sep_by_space;          // 如果等于 1，则 currency_symbol 和负货币值之间使用空格分隔。如果等于 0，则 currency_symbol 和负货币值之间不使用空格分隔
   char p_sign_posn;             // 表示正货币值中正号的位置
   char n_sign_posn;             // 表示负货币值中负号的位置
} lconv;

LC_ALL      // 设置下面的所有选项
LC_COLLATE  // 影响 strcoll 和 strxfrm 函数
LC_CTYPE    // 影响所有字符函数
LC_MONETARY // 影响 localeconv 函数提供的货币信息
LC_NUMERIC  // 影响 localeconv 函数提供的小数点格式化和信息
LC_TIME     // 影响 strftime 函数

> 7. math.h

标准库的 math.h 头文件定义了各种数学函数和一个宏。在这个库中所有可用的功能都带有一个 double 类型的参数，且都返回 double 类型的结果。

HUGE_VAL // 当函数的结果不可以表示为浮点数时。如果是因为结果的幅度太大以致于无法表示，则函数会设置 errno 为 ERANGE 来表示范围错误，并返回一个由宏 HUGE_VAL 或者它的否定（- HUGE_VAL）命名的一个特定的很大的值。如果结果的幅度太小，则会返回零值。在这种情况下，error 可能会被设置为 ERANGE，也有可能不会被设置为 ERANGE。

double acos(double x); // 返回以弧度表示的 x 的反余弦
double asin(double x); // 返回以弧度表示的 x 的反正弦
double atan(double x); // 返回以弧度表示的 x 的反正切
double atan2(double y, double x); // 返回以弧度表示的 y/x 的反正切。y 和 x 的值的符号决定了正确的象限
double cos(double x);  // 返回弧度角 x 的余弦
double cosh(double x); // 返回 x 的双曲余弦
double sin(double x);  // 返回弧度角 x 的正弦
double sinh(double x); // 返回 x 的双曲正弦
double tanh(double x); // 返回 x 的双曲正切
double exp(double x);  // 返回 e 的 x 次幂的值
double frexp(double x, int *exponent); // 把浮点数 x 分解成尾数和指数。返回值是尾数，并将指数存入 exponent 中。所得的值是 x = mantissa * 2 ^ exponent
double ldexp(double x, int exponent); // 返回 x 乘以 2 的 exponent 次幂
double log(double x);  // 返回 x 的自然对数（基数为 e 的对数）
double log10(double x); // 返回 x 的常用对数（基数为 10 的对数）
double modf(double x, double *integer); // 返回值为小数部分（小数点后的部分），并设置 integer 为整数部分
double pow(double x, double y); // 返回 x 的 y 次幂
double sqrt(double x);  // 返回 x 的平方根
double ceil(double x);  // 返回大于或等于 x 的最小的整数值
double fabs(double x);  // 返回 x 的绝对值
double floor(double x); // 返回小于或等于 x 的最大的整数值
double fmod(double x, double y); // 返回 x 除以 y 的余数

> 8. setjmp.h

标准库的 setjmp.h 头文件定义了宏 setjmp()、函数 longjmp() 和变量类型 jmp_buf，该变量类型会绕过正常的函数调用和返回规则。

jmp_buf // 这是一个用于存储宏 setjmp() 和函数 longjmp() 相关信息的数组类型。

int setjmp(jmp_buf environment); // 这个宏把当前环境保存在变量 environment 中，以便函数 longjmp() 后续使用。如果这个宏直接从宏调用中返回，则它会返回零，但是如果它从 longjmp() 函数调用中返回，则它会返回一个非零值。

void longjmp(jmp_buf environment, int value); // 该函数恢复最近一次调用 setjmp() 宏时保存的环境，jmp_buf 参数的设置是由之前调用 setjmp() 生成的

> 9. signal.h

标准库的 signal.h 头文件定义了一个变量类型 sig_atomic_t、两个函数调用和一些宏来处理程序执行期间报告的不同信号。

sig_atomic_t // 这是 int 类型，在信号处理程序中作为变量使用。它是一个对象的整数类型，该对象可以作为一个原子实体访问，即使存在异步信号时，该对象可以作为一个原子实体访问。

SIG_DFL // 默认的信号处理程序
SIG_ERR // 表示一个信号错误
SIG_IGN // 忽视信号

SIGABRT // 程序异常终止
SIGFPE  // 算术运算出错，如除数为 0 或溢出
SIGILL  // 非法函数映象，如非法指令
SIGINT  // 中断信号，如 ctrl-C
SIGSEGV // 非法访问存储器，如访问不存在的内存单元
SIGTERM // 发送给本程序的终止请求信号

void (*signal(int sig, void (*func)(int)))(int); // 该函数设置一个函数来处理信号，即信号处理程序。
int raise(int sig); // 该函数会促使生成信号 sig。sig 参数与 SIG 宏兼容。

> 10. stdarg.h

标准库的 stdarg.h 头文件定义了一个变量类型 va_list 和三个宏，这三个宏可用于在参数个数未知（即参数个数可变）时获取函数中的参数。

可变参数的函数通在参数列表的末尾是使用省略号(,...)定义的。

va_list // 这是一个适用于 va_start()、va_arg() 和 va_end() 这三个宏存储信息的类型。

void va_start(va_list ap, last_arg); // 这个宏初始化 ap 变量，它与 va_arg 和 va_end 宏是一起使用的。last_arg 是最后一个传递给函数的已知的固定参数，即省略号之前的参数
type va_arg(va_list ap, type); // 这个宏检索函数参数列表中类型为 type 的下一个参数
void va_end(va_list ap); // 这个宏允许使用了 va_start 宏的带有可变参数的函数返回。如果在从函数返回之前没有调用 va_end，则结果为未定义

> 11. stddef.h

标准库的 stddef .h 头文件定义了各种变量类型和宏。这些定义中的大部分也出现在其它头文件中。

ptrdiff_t // 这是有符号整数类型，它是两个指针相减的结果
size_t // 这是无符号整数类型，它是 sizeof 关键字的结果
wchar_t // 这是一个宽字符常量大小的整数类型

NULL // 这个宏是一个空指针常量的值
offsetof(type, member-designator) // 这会生成一个类型为 size_t 的整型常量，它是一个结构成员相对于结构开头的字节偏移量。成员是由 member-designator 给定的，结构的名称是在 type 中给定的。

> 12. stdio.h

标准库的 stdio .h 头文件定义了三个变量类型、一些宏和各种函数来执行输入和输出。

size_t // 这是无符号整数类型，它是 sizeof 关键字的结果
FILE   // 这是一个适合存储文件流信息的对象类型
fpos_t // 这是一个适合存储文件中任何位置的对象类型

NULL // 这个宏是一个空指针常量的值。
_IOFBF、_IOLBF 和 _IONBF // 这些宏扩展了带有特定值的整型常量表达式，并适用于 setvbuf 函数的第三个参数。
BUFSIZ // 这个宏是一个整数，该整数代表了 setbuf 函数使用的缓冲区大小。
EOF // 这个宏是一个表示已经到达文件结束的负整数。
FOPEN_MAX // 这个宏是一个整数，该整数代表了系统可以同时打开的文件数量。
FILENAME_MAX // 这个宏是一个整数，该整数代表了字符数组可以存储的文件名的最大长度。如果实现没有任何限制，则该值应为推荐的最大值。
L_tmpnam // 这个宏是一个整数，该整数代表了字符数组可以存储的由 tmpnam 函数创建的临时文件名的最大长度。
SEEK_CUR、SEEK_END 和 SEEK_SET // 这些宏是在 fseek 函数中使用，用于在一个文件中定位不同的位置。
TMP_MAX // 这个宏是 tmpnam 函数可生成的独特文件名的最大数量。
stderr、stdin 和 stdout // 这些宏是指向 FILE 类型的指针，分别对应于标准错误、标准输入和标准输出流。

int fclose(FILE *stream); // 关闭流 stream。刷新所有的缓冲区。
void clearerr(FILE *stream); // 清除给定流 stream 的文件结束和错误标识符。
int feof(FILE *stream); // 测试给定流 stream 的文件结束标识符。
int ferror(FILE *stream); // 测试给定流 stream 的错误标识符。
int fflush(FILE *stream); // 刷新流 stream 的输出缓冲区。
int fgetpos(FILE *stream, fpos_t *pos); // 获取流 stream 的当前文件位置，并把它写入到 pos。
FILE *fopen(const char *filename, const char *mode); // 使用给定的模式 mode 打开 filename 所指向的文件。
size_t fread(void *ptr, size_t size, size_t nmemb, FILE *stream); // 从给定流 stream 读取数据到 ptr 所指向的数组中。
FILE *freopen(const char *filename, const char *mode, FILE *stream); // 把一个新的文件名 filename 与给定的打开的流 stream 关联，同时关闭流中的旧文件。
int fseek(FILE *stream, long int offset, int whence); // 设置流 stream 的文件位置为给定的偏移 offset，参数 offset 意味着从给定的 whence 位置查找的字节数。
int fsetpos(FILE *stream, const fpos_t *pos); // 设置给定流 stream 的文件位置为给定的位置。参数 pos 是由函数 fgetpos 给定的位置。
long int ftell(FILE *stream); // 返回给定流 stream 的当前文件位置。
size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream); // 把 ptr 所指向的数组中的数据写入到给定流 stream 中。
int remove(const char *filename); // 删除给定的文件名 filename，以便它不再被访问。
int rename(const char *old_filename, const char *new_filename); // 把 old_filename 所指向的文件名改为 new_filename。
void rewind(FILE *stream); // 设置文件位置为给定流 stream 的文件的开头。
void setbuf(FILE *stream, char *buffer); // 定义流 stream 应如何缓冲。
int setvbuf(FILE *stream, char *buffer, int mode, size_t size); // 另一个定义流 stream 应如何缓冲的函数。
FILE *tmpfile(void); // 以二进制更新模式(wb+)创建临时文件。
char *tmpnam(char *str); // 生成并返回一个有效的临时文件名，该文件名之前是不存在的。
int fprintf(FILE *stream, const char *format, ...); // 发送格式化输出到流 stream 中。
int printf(const char *format, ...); // 发送格式化输出到标准输出 stdout。
int sprintf(char *str, const char *format, ...); // 发送格式化输出到字符串。
int vfprintf(FILE *stream, const char *format, va_list arg); // 使用参数列表发送格式化输出到流 stream 中。
int vprintf(const char *format, va_list arg); // 使用参数列表发送格式化输出到标准输出 stdout。
int vsprintf(char *str, const char *format, va_list arg); // 使用参数列表发送格式化输出到字符串。
int fscanf(FILE *stream, const char *format, ...); // 从流 stream 读取格式化输入。
int scanf(const char *format, ...); // 从标准输入 stdin 读取格式化输入。
int sscanf(const char *str, const char *format, ...); // 从字符串读取格式化输入。
int fgetc(FILE *stream); // 从指定的流 stream 获取下一个字符（一个无符号字符），并把位置标识符往前移动。
char *fgets(char *str, int n, FILE *stream); // 从指定的流 stream 读取一行，并把它存储在 str 所指向的字符串内。当读取 (n-1) 个字符时，或者读取到换行符时，或者到达文件末尾时，它会停止，具体视情况而定。
int fputc(int char, FILE *stream); // 把参数 char 指定的字符（一个无符号字符）写入到指定的流 stream 中，并把位置标识符往前移动。
int fputs(const char *str, FILE *stream); // 把字符串写入到指定的流 stream 中，但不包括空字符。
int getc(FILE *stream); // 从指定的流 stream 获取下一个字符（一个无符号字符），并把位置标识符往前移动。
int getchar(void); // 从标准输入 stdin 获取一个字符（一个无符号字符）。
char *gets(char *str); // 从标准输入 stdin 读取一行，并把它存储在 str 所指向的字符串中。当读取到换行符时，或者到达文件末尾时，它会停止，具体视情况而定。
int putc(int char, FILE *stream); // 把参数 char 指定的字符（一个无符号字符）写入到指定的流 stream 中，并把位置标识符往前移动。
int putchar(int char); // 把参数 char 指定的字符（一个无符号字符）写入到标准输出 stdout 中。
int puts(const char *str); // 把一个字符串写入到标准输出 stdout，直到空字符，但不包括空字符。换行符会被追加到输出中。
int ungetc(int char, FILE *stream); // 把字符 char（一个无符号字符）推入到指定的流 stream 中，以便它是下一个被读取到的字符。
void perror(const char *str); // 把一个描述性错误消息输出到标准错误 stderr。首先输出字符串 str，后跟一个冒号，然后是一个空格。
int snprintf(char *str, size_t size, const char *format, ...); // 格式字符串到 str 中。

> 13. stdlib.h

标准库的 stdlib .h 头文件定义了四个变量类型、一些宏和各种通用工具函数。

size_t  // 这是无符号整数类型，它是 sizeof 关键字的结果。
wchar_t // 这是一个宽字符常量大小的整数类型。
div_t   // 这是 div 函数返回的结构。
ldiv_t  // 这是 ldiv 函数返回的结构。

NULL // 这个宏是一个空指针常量的值。
EXIT_FAILURE // 这是 exit 函数失败时要返回的值。
EXIT_SUCCESS // 这是 exit 函数成功时要返回的值。
RAND_MAX // 这个宏是 rand 函数返回的最大值。
MB_CUR_MAX // 这个宏表示在多字节字符集中的最大字符数，不能大于 MB_LEN_MAX。

double atof(const char *str); // 把参数 str 所指向的字符串转换为一个浮点数（类型为 double 型）。
int atoi(const char *str); // 把参数 str 所指向的字符串转换为一个整数（类型为 int 型）。
long int atol(const char *str); // 把参数 str 所指向的字符串转换为一个长整数（类型为 long int 型）。
double strtod(const char *str, char **endptr); // 把参数 str 所指向的字符串转换为一个浮点数（类型为 double 型）。
long int strtol(const char *str, char **endptr, int base); // 把参数 str 所指向的字符串转换为一个长整数（类型为 long int 型）。
unsigned long int strtoul(const char *str, char **endptr, int base); // 把参数 str 所指向的字符串转换为一个无符号长整数（类型为 unsigned long int 型）。
void *calloc(size_t nitems, size_t size); // 分配所需的内存空间，并返回一个指向它的指针。
void free(void *ptr); // 释放之前调用 calloc、malloc 或 realloc 所分配的内存空间。
void *malloc(size_t size); // 分配所需的内存空间，并返回一个指向它的指针。
void *realloc(void *ptr, size_t size); // 尝试重新调整之前调用 malloc 或 calloc 所分配的 ptr 所指向的内存块的大小。
void abort(void); // 使一个异常程序终止。
int atexit(void (*func)(void)); // 当程序正常终止时，调用指定的函数 func。
void exit(int status); // 使程序正常终止。
char *getenv(const char *name); // 搜索 name 所指向的环境字符串，并返回相关的值给字符串。
int system(const char *string); // 由 string 指定的命令传给要被命令处理器执行的主机环境。
void *bsearch(const void *key, const void *base, size_t nitems, size_t size, int (*compar)(const void *, const void *)); // 执行二分查找。
void qsort(void *base, size_t nitems, size_t size, int (*compar)(const void *, const void*)); // 数组排序。
int abs(int x); // 返回 x 的绝对值。
div_t div(int numer, int denom); // 分子除以分母。
long int labs(long int x); // 返回 x 的绝对值。
ldiv_t ldiv(long int numer, long int denom); // 分子除以分母。
int rand(void); // 返回一个范围在 0 到 RAND_MAX 之间的伪随机数。
void srand(unsigned int seed); // 该函数播种由函数 rand 使用的随机数发生器。
int mblen(const char *str, size_t n); // 返回参数 str 所指向的多字节字符的长度。
size_t mbstowcs(schar_t *pwcs, const char *str, size_t n); // 把参数 str 所指向的多字节字符的字符串转换为参数 pwcs 所指向的数组。
int mbtowc(whcar_t *pwc, const char *str, size_t n); // 检查参数 str 所指向的多字节字符。
size_t wcstombs(char *str, const wchar_t *pwcs, size_t n); // 把数组 pwcs 中存储的编码转换为多字节字符，并把它们存储在字符串 str 中。
int wctomb(char *str, wchar_t wchar); // 检查对应于参数 wchar 所给出的多字节字符的编码。

> 14. string.h

标准库的 string .h 头文件定义了一个变量类型、一个宏和各种操作字符数组的函数。

size_t // 这是无符号整数类型，它是 sizeof 关键字的结果。

NULL // 这个宏是一个空指针常量的值。

void *memchr(const void *str, int c, size_t n); // 在参数 str 所指向的字符串的前 n 个字节中搜索第一次出现字符 c（一个无符号字符）的位置。
int memcmp(const void *str1, const void *str2, size_t n); // 把 str1 和 str2 的前 n 个字节进行比较。
void *memcpy(void *dest, const void *src, size_t n);      // 从 src 复制 n 个字符到 dest。
void *memmove(void *dest, const void *src, size_t n);     // 另一个用于从 src 复制 n 个字符到 dest 的函数。
void *memset(void *str, int c, size_t n);  // 复制字符 c（一个无符号字符）到参数 str 所指向的字符串的前 n 个字符。
char *strcat(char *dest, const char *src); // 把 src 所指向的字符串追加到 dest 所指向的字符串的结尾。
char *strncat(char *dest, const char *src, size_t n); // 把 src 所指向的字符串追加到 dest 所指向的字符串的结尾，直到 n 字符长度为止。
char *strchr(const char *str, int c); // 在参数 str 所指向的字符串中搜索第一次出现字符 c（一个无符号字符）的位置。
int strcmp(const char *str1, const char *str2); // 把 str1 所指向的字符串和 str2 所指向的字符串进行比较。
int strncmp(const char *str1, const char *str2, size_t n); // 把 str1 和 str2 进行比较，最多比较前 n 个字节。
int strcoll(const char *str1, const char *str2); // 把 str1 和 str2 进行比较，结果取决于 LC_COLLATE 的位置设置。
char *strcpy(char *dest, const char *src); // 把 src 所指向的字符串复制到 dest。
char *strncpy(char *dest, const char *src, size_t n); // 把 src 所指向的字符串复制到 dest，最多复制 n 个字符。
size_t strcspn(const char *str1, const char *str2);   // 检索字符串 str1 开头连续有几个字符都不含字符串 str2 中的字符。
char *strerror(int errnum);     // 从内部数组中搜索错误号 errnum，并返回一个指向错误消息字符串的指针。
size_t strlen(const char *str); // 计算字符串 str 的长度，直到空结束字符，但不包括空结束字符。
char *strpbrk(const char *str1, const char *str2); // 检索字符串 str1 中第一个匹配字符串 str2 中字符的字符，不包含空结束字符。也就是说，依次检验字符串 str1 中的字符，当被检验字符在字符串 str2 中也包含时，则停止检验，并返回该字符位置。
char *strrchr(const char *str, int c);                  // 在参数 str 所指向的字符串中搜索最后一次出现字符 c（一个无符号字符）的位置。
size_t strspn(const char *str1, const char *str2);      // 检索字符串 str1 中第一个不在字符串 str2 中出现的字符下标。
char *strstr(const char *haystack, const char *needle); // 在字符串 haystack 中查找第一次出现字符串 needle（不包含空结束字符）的位置。
char *strtok(char *str, const char *delim);             // 分解字符串 str 为一组字符串，delim 为分隔符。
size_t strxfrm(char *dest, const char *src, size_t n);  // 根据程序当前的区域选项中的 LC_COLLATE 来转换字符串 src 的前 n 个字符，并把它们放置在字符串 dest 中。

itoa()  // 将整型值转换为字符串
ltoa()  // 将长整型值转换为字符串
ultoa() // 将无符号长整型值转换为字符串
gcvt()  // 将浮点型数转换为字符串，取四舍五入
ecvt()  // 将双精度浮点型值转换为字符串，转换结果中不包含十进制小数点
fcvt()  // 指定位数为转换精度，其余同ecvt()

> 15. time.h

标准库的 time.h 头文件定义了四个变量类型、两个宏和各种操作日期和时间的函数。

size_t // 是无符号整数类型，它是 sizeof 关键字的结果。
clock_t // 这是一个适合存储处理器时间的类型。
time_t is // 这是一个适合存储日历时间类型。
struct tm // 这是一个用来保存时间和日期的结构。

struct tm {
   int tm_sec;         // 秒，范围从 0 到 59
   int tm_min;         // 分，范围从 0 到 59
   int tm_hour;        // 小时，范围从 0 到 23
   int tm_mday;        // 一月中的第几天，范围从 1 到 31
   int tm_mon;         // 月，范围从 0 到 11
   int tm_year;        // 自 1900 年起的年数
   int tm_wday;        // 一周中的第几天，范围从 0 到 6
   int tm_yday;        // 一年中的第几天，范围从 0 到 365
   int tm_isdst;       // 夏令时
};

NULL // 这个宏是一个空指针常量的值。
CLOCKS_PER_SEC // 这个宏表示每秒的处理器时钟个数。

char *asctime(const struct tm *timeptr); // 返回一个指向字符串的指针，它代表了结构 timeptr 的日期和时间。
clock_t clock(void);                     // 返回程序执行起（一般为程序的开头），处理器时钟所使用的时间。
char *ctime(const time_t *timer);        // 返回一个表示当地时间的字符串，当地时间是基于参数 timer。
double difftime(time_t time1, time_t time2); // 返回 time1 和 time2 之间相差的秒数 (time1-time2)。
struct tm *gmtime(const time_t *timer);      //timer 的值被分解为 tm 结构，并用协调世界时（UTC）也被称为格林尼治标准时间（GMT）表示。
struct tm *localtime(const time_t *timer);   // timer 的值被分解为 tm 结构，并用本地时区表示。
time_t mktime(struct tm *timeptr);           // 把 timeptr 所指向的结构转换为一个依据本地时区的 time_t 值。
size_t strftime(char *str, size_t maxsize, const char *format, const struct tm *timeptr); // 根据 format 中定义的格式化规则，格式化结构 timeptr 表示的时间，并把它存储在 str 中。
time_t time(time_t *timer); // 计算当前日历时间，并把它编码成 time_t 格式。


### 05. 功能库

> 使用第三方, 或操作系统库, 来完成相应功能操作



