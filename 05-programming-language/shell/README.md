# shell

> Bourne shell (sh), bash (Bourne Again shell), dash (Debian Almquist Shell)

## 资源

> [LinuxShell - 百度百科](https://baike.baidu.com/item/Linux%20Shell/10142850)

> [Linux Bash shell](https://zhuanlan.zhihu.com/p/187425765)

> [Shell 教程](https://www.runoob.com/linux/linux-shell.html)


## 简介

Shell Script，Shell 脚本。 Shell是一个命令解释器，它在操作系统的最外层，负责用户程序与内核进行交互操作的一种接口，将用户输入的命令翻译给操作系统，并将处理后的结果输出至屏幕。实际上Shell是一个命令解释器，它解释由用户输入的命令并且把它们送到内核。

其有多种 shell 脚本类型，最常用的几种是 Bourne shell（sh）、C shell（csh） 和 Korn shell（ksh）。

通过 shell 可以实现 Linux 系统的管理功能, 文件管理、权限管理、用户管理、磁盘管理、网络管理、软件管理等


Bourne shell, 是贝尔实验室研发的UNIX最初使用的shell，并且在每种UNIX上都可以使用。Bourne shell在shell编程方面相当优秀，但在处理与用户的交互方面做得不如其他几种shell。

Bourne Again shell, 是Linux操作系统缺省的shell，是Bourne shell的扩展，简称Bash，与Bourne shell完全向后兼容，并且在Bourne shell的基础上增加、增强了很多特性。Bash放在/bin/bash中，它有许多特色，可以提供如命令补全、命令编辑和命令历史表等功能，它还包含了很多C shell和Korn shell中的优点，有灵活和强大的编程接口，同时又有很友好的用户界面。所以在GNU/Linux 操作系统中的 /bin/sh 是 bash（Bourne-Again Shell）的符号链接（但是这只是比较原始的做法，现在开始有了新的做法了，也就是若脚本第一行为“#!/bin/bash”，我们使用命令：” sh script_name.sh“ 时是调用的bash去解释脚本；）

Dash，GNU/Linux操作系统中的/bin/sh本是bash (Bourne-Again Shell) 的符号链接，但鉴于bash过于复杂，有人把bash从NetBSD移植到Linux并更名为dash (Debian Almquist Shell)，并建议将/bin/sh指向它，以获得更快的脚本执行速度。Dash Shell 比Bash Shell小的多，符合POSIX标准。也就是若脚本第一行为“#!/bin/sh”，我们使用命令：”sh script_name.sh“时是调用的dash去解释脚本。Ubuntu继承了Debian，所以从Ubuntu 6.10开始默认是Dash Shell。


### bash

> 基本语法结构

#### 1. 变量

- 定义, 变量名=值 ,变量名和等号之间不能有空格, 变量名命名规则: 1. 只能使用字母数字和下划线,并以字母开头 2. 不能使用标点符号 3. 不能使用关键字

name=value;

- 使用, ($name), 变量名前面加美元符号进行引用, 当变量名和其他字母链接在一起无法直接识别时外面必须加花括号。

已定义的变量，可以被重新定义, 相当于重新赋值

- 只读变量, (readonly 变量名), 使用 readonly 命令可以将变量定义为只读变量，只读变量的值不能被改变

- 删除变量, (unset 变量名), 使用 unset 命令可以删除变量, 变量被删除后不能再次使用。unset 命令不能删除只读变量。

- 变量类型, 局部变量, 在脚本或命令中定义，仅在当前shell实例中有效; 环境变量, shell脚本也可以定义环境变量; shell变量, hell变量是由shell程序设置的特殊变量;

- 注释, 以 # 开头的行就是注释，会被解释器忽略; 多行注释, 

:<<EOF
注释内容...
注释内容...
注释内容...
EOF

EOF 也可以使用其他符号: 

:<<'
注释内容...
注释内容...
注释内容...
'

:<<!
注释内容...
注释内容...
注释内容...
!

#### 2. 数据类型

- 字符串

字符串可以用单引号，也可以用双引号，也可以不用引号; 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的; 单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用。

双引号里可以有变量, 双引号里可以出现转义字符;

获取字符串长度, ( ${#string} ), 提取子字符串, ( ${string:1:4} ), 从字符串第 2 个字符开始截取 4 个字符

查找子字符串, ( `expr index "$string" io` ), 查找字符 i 或 o 的位置(哪个字母先出现就计算哪个), ` 是反引号，而不是单引号 '

#### 3. 传参

执行 Shell 脚本时，向脚本传递参数，脚本内获取参数的格式为：$n。n 代表一个数字，1 为执行脚本的第一个参数，2 为执行脚本的第二个参数。

其中 $0 为执行的文件名（包含文件路径）

- 特殊字符说明

```bash
$#     传递到脚本的参数个数
$*     以一个单字符串显示所有向脚本传递的参数。如"$*" 用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。
$$     脚本运行的当前进程ID号
$!     后台运行的最后一个进程的ID号
$@     与$*相同，但是使用时加引号，并在引号中返回每个参数。如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。
$-     显示Shell使用的当前选项，与set命令功能相同。
$?     显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。

$* 与 $@ 区别, 都是引用所有参数, 有在双引号中体现出来。假设在脚本运行时写了三个参数 1、2、3，，则 " * " 等价于 "1 2 3"（传递了一个参数），而 "@" 等价于 "1" "2" "3"（传递了三个参数）。
```

```bash
#!/bin/sh
echo "-- \$* 演示 ---"
for i in "$*"; do
    echo $i
done

echo "-- \$@ 演示 ---"
for i in "$@"; do
    echo $i
done
```

#### 4. 数组

bash支持一维数组（不支持多维数组），并且没有限定数组的大小。数组元素的下标由 0 开始编号。获取数组中的元素要利用下标，下标可以是整数或算术表达式，其值应大于或等于 0。

- 定义, 在 Shell 中，用括号来表示数组，数组元素用"空格"符号分割开。

数组名=(值1 值2 ... 值n);

数组名=(
    值1
    值2
    值3
)

数组名[0]=value0
数组名[1]=value1
数组名[n]=valuen

- 读取数组, ${数组名[下标]}, 使用 @ 符号可以获取数组中的所有元素 ${array_name[@]}

- 获取数组的长度, 获取数组长度的方法与获取字符串长度的方法相同

length=${#array_name[@]}  # 取得数组元素的个数
length=${#array_name[*]}
lengthn=${#array_name[n]} # 取得数组单个元素的长度

#### 5. 运算符

算数运算符, 关系运算符, 布尔运算符, 字符串运算符, 文件测试运算符

原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。expr 是一款表达式计算工具，使用它能完成表达式的求值操作。表达式和运算符之间要有空格, 完整的表达式要被 ` 包含，注意这个字符不是常用的单引号。

```bash 变量 a 为 10，变量 b 为 20
+   加法	`expr $a + $b` 结果为 30。
-   减法	`expr $a - $b` 结果为 -10。
*   乘法	`expr $a \* $b` 结果为  200。
/   除法	`expr $b / $a` 结果为 2。
%   取余	`expr $b % $a` 结果为 0。
=   赋值	a=$b 把变量 b 的值赋给 a。
==  相等。用于比较两个数字，相同则返回 true。	[ $a == $b ] 返回 false。
!=  不相等。用于比较两个数字，不相同则返回 true。	[ $a != $b ] 返回 true。

乘号(*)前边必须加反斜杠(\)才能实现乘法运算；条件表达式要放在方括号之间，并且要有空格，例如: [$a==$b] 是错误的，必须写成 [ $a == $b ]。
```

关系运算符只支持数字，不支持字符串，除非字符串的值是数字。

```bash  变量 a 为 10，变量 b 为 20
-eq  检测两个数是否相等，相等返回 true。	          [ $a -eq $b ] 返回 false。
-ne  检测两个数是否不相等，不相等返回 true。	          [ $a -ne $b ] 返回 true。
-gt  检测左边的数是否大于右边的，如果是，则返回 true。	   [ $a -gt $b ] 返回 false。
-lt  检测左边的数是否小于右边的，如果是，则返回 true。	   [ $a -lt $b ] 返回 true。
-ge  检测左边的数是否大于等于右边的，如果是，则返回 true。	  [ $a -ge $b ] 返回 false。
-le  检测左边的数是否小于等于右边的，如果是，则返回 true。	  [ $a -le $b ] 返回 true。
```

布尔运算符

```bash  变量 a 为 10，变量 b 为 20
!     非运算，表达式为 true 则返回 false，否则返回 true。	[ ! false ] 返回 true。
-o    或运算，有一个表达式为 true 则返回 true。	[ $a -lt 20 -o $b -gt 100 ] 返回 true。
-a    与运算，两个表达式都为 true 才返回 true。	[ $a -lt 20 -a $b -gt 100 ] 返回 false。
```

> **逻辑运算符**

```bash  变量 a 为 10，变量 b 为 20
&&    逻辑的 AND	[[ $a -lt 100 && $b -gt 100 ]] 返回 false
||    逻辑的 OR	    [[ $a -lt 100 || $b -gt 100 ]] 返回 true
```

> **字符串运算符**

```bash  变量 a 为 "abc"，变量 b 为 "efg"
=   检测两个字符串是否相等，相等返回 true。      [ $a = $b ] 返回 false。
!=  检测两个字符串是否不相等，不相等返回 true。   [ $a != $b ] 返回 true。
-z  检测字符串长度是否为0，为0返回 true。        [ -z $a ] 返回 false。
-n  检测字符串长度是否不为 0，不为 0 返回 true。 [ -n "$a" ] 返回 true。
$   检测字符串是否为空，不为空返回 true。        [ $a ] 返回 true。
```

文件测试运算符, 文件测试运算符用于检测 Unix 文件的各种属性

```bash
-b file  检测文件是否是块设备文件，如果是，则返回 true。	[ -b $file ] 返回 false。
-c file  检测文件是否是字符设备文件，如果是，则返回 true。	[ -c $file ] 返回 false。
-d file  检测文件是否是目录，如果是，则返回 true。	       [ -d $file ] 返回 false。
-f file  检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。	[ -f $file ] 返回 true。
-g file  检测文件是否设置了 SGID 位，如果是，则返回 true。	[ -g $file ] 返回 false。
-k file  检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。	[ -k $file ] 返回 false。
-p file  检测文件是否是有名管道，如果是，则返回 true。	    [ -p $file ] 返回 false。
-u file  检测文件是否设置了 SUID 位，如果是，则返回 true。	[ -u $file ] 返回 false。
-r file  检测文件是否可读，如果是，则返回 true。	        [ -r $file ] 返回 true。
-w file  检测文件是否可写，如果是，则返回 true。	               [ -w $file ] 返回 true。
-x file  检测文件是否可执行，如果是，则返回 true。	               [ -x $file ] 返回 true。
-s file  检测文件是否为空（文件大小是否大于0），不为空返回 true。	 [ -s $file ] 返回 true。
-e file  检测文件（包括目录）是否存在，如果是，则返回 true。	    [ -e $file ] 返回 true。

-S   判断某文件是否 socket。
-L   检测文件是否存在并且是一个符号链接。
```

test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试

```bash
-eq   等于则为真      test $name -eq $name 
-ne   不等于则为真
-gt   大于则为真
-ge   大于等于则为真
-lt   小于则为真
-le   小于等于则为真

=	等于则为真
!=	不相等则为真
-z 字符串	字符串的长度为零则为真
-n 字符串	字符串的长度不为零则为真

-e 文件名	如果文件存在则为真
-r 文件名	如果文件存在且可读则为真
-w 文件名	如果文件存在且可写则为真
-x 文件名	如果文件存在且可执行则为真
-s 文件名	如果文件存在且至少有一个字符则为真
-d 文件名	如果文件存在且为目录则为真
-f 文件名	如果文件存在且为普通文件则为真
-c 文件名	如果文件存在且为字符型特殊文件则为真
-b 文件名	如果文件存在且为块特殊文件则为真

与( -a )、或( -o )、非( ! )三个逻辑操作符用于将测试条件连接起来，其优先级为： ! 最高， -a 次之， -o 最低。
```

#### 6. 流程控制

sh 的流程控制不可为空, 如果没有语句则去除分支

> 分支语句

```bash
if condition; then command; fi

if condition
then
    command1 
    command2
    ...
    commandN 
fi

if condition
then
    command1 
    command2
    ...
    commandN
else
    command
fi

if condition1
then
    command1
elif condition2 
then 
    command2
else
    commandN
fi
```

> 循环语句

```bash
for var in item1 item2 ... itemN; do command1; command2… done;

for var in item1 item2 ... itemN
do
    command1
    command2
    ...
    commandN
done

当变量值在列表里，for 循环即执行一次所有命令，使用变量名获取列表中的当前取值。命令可为任何有效的 shell 命令和语句。in 列表可以包含替换、字符串和文件名。
in列表是可选的，如果不用它，for循环使用命令行的位置参数。

for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done

for str in This is a string
do
    echo $str
done
```

```bash
while condition
do
    command
done


#!/bin/bash
int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done

Bash let 命令，let arg [arg ...], 它用于执行一个或多个表达式，变量计算中不需要加上 $ 来表示变量; let 命令是 BASH 中用于计算的工具，用于执行一个或多个表达式，变量计算中不需要加上 $ 来表示变量。如果表达式中包含了空格或其他特殊字符，则必须引起来。
```

```bash
until condition
do
    command
done

until 循环执行一系列命令直至条件为 true 时停止。
```

```bash
case 值 in
模式1)
    command1
    command2
    ...
    commandN
    ;;
模式2)
    command1
    command2
    ...
    commandN
    ;;
    *)
    command1
    ;;
esac

case ... esac 为多选择语句，与其他语言中的 switch ... case 语句类似，是一种多分支选择结构，每个 case 分支用右圆括号开始，用两个分号 ;; 表示 break，即执行结束，跳出整个 case ... esac 语句，esac（就是 case 反过来）作为结束标记。每一模式必须以右括号结束。取值可以为变量或常数，匹配发现取值符合某一模式后，其间所有命令开始执行直至 ;;。

取值将检测匹配的每一个模式。一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令。
```

reak命令允许跳出所有循环（终止执行后面的所有循环）。continue命令与break命令类似，只有一点差别，它不会跳出所有循环，仅仅跳出当前循环。


#### 7. 函数

linux shell 可以用户定义函数，然后在shell脚本中可以随便调用。函数定义实现可以覆盖，以最后一个定义的函数为准。

```bash
[ function ] funname [()]

{

    action;

    [return int;]
}

funname pram1 pram2

1、可以带function funname() 定义，也可以直接funname() 定义,不带任何参数。
2、参数返回，可以显示加：return 返回，如果不加，将以最后一条命令运行结果，作为返回值。 return后跟数值n(0-255)

函数返回值在调用该函数后通过 $? 来获得。所有函数在使用前必须定义。这意味着必须将函数放在脚本开始部分，直至shell解释器首次发现它时，才可以使用。调用函数仅使用其函数名即可。在Shell中，调用函数时可以向其传递参数。在函数体内部，通过 $n 的形式来获取参数的值，例如，$1表示第一个参数，$2表示第二个参数...。$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。

$#    传递到脚本或函数的参数个数
$*    以一个单字符串显示所有向脚本传递的参数
$$    脚本运行的当前进程ID号
$!    后台运行的最后一个进程的ID号
$@    与$*相同，但是使用时加引号，并在引号中返回每个参数。
$-    显示Shell使用的当前选项，与set命令功能相同。
$?    显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。

$? 仅对其上一条指令负责，一旦函数返回后其返回值没有立即保存入参数，那么其返回值将不再能通过 $? 获得。

函数与命令的执行结果可以作为条件语句使用。要注意的是，和 C 语言不同，shell 语言中 0 代表 true，0 以外的值代表 false。
```

#### 8. 文件包含

Shell 也可以包含外部脚本。这样可以很方便的封装一些公用的代码作为一个独立的文件。被包含的文件 test1.sh 不需要可执行权限。

```bahs
. filename   # 注意点号(.)和文件名中间有一空格
或
source filename
```

