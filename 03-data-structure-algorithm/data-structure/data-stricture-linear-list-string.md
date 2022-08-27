# data-stricture-linear-list-string

> 串 (字符串) (特殊线性表)

## 资源

> [数据结构-串](https://www.cnblogs.com/TimVerion/p/11194268.html)
>
> [数据结构（六）串](https://zhuanlan.zhihu.com/p/128683179)
>
> [数据结构： ”串“ 的全面讲解](https://www.jianshu.com/p/78bb257f00a9)
>
> [数据结构—串](https://www.jianshu.com/p/65534d21e097)
>
> [数据结构浅析(5)-线性结构：串](https://zhuanlan.zhihu.com/p/45223450)
>   - [字符串匹配的KMP算法](https://ruanyifeng.com/blog/2013/05/Knuth–Morris–Pratt_algorithm.html)
>
> [数据结构笔记8串（《大话数据结构》学习笔记）](https://www.pianshen.com/article/52371458291/)
>
> [数据结构中的串](https://blog.csdn.net/weixin_42034217/article/details/84891312)


## 概论

![](imgs/数据结构_串_思维导图.webp)


### 定义

![](imgs/数据结构_串_思维导图_01.webp)

串（string，字符串）是由零个或多个字符组成的有序序列，一般记为 S=”a1a2…an”   (n>=0)。

s 是串的名，用双引号括起来的字符序列是串的值；ai (1≤i≤n) 可以是字母、数字或其他字符；串中字符的数目n成为串的长度。零个字符的串称为空串(null string),它的长度为0。

子串

串中任意个连续的字符组成的子序列称为该串的子串。包含子串的串相应的称为主串。通常称字符在序列中的序号为该字符在串中的位置。子串在主串中的位置则以子串的第一个字符在主串中的位置来表示。字符串的索引是从0开始的。

称两个串相等的，当且仅当这两个串的值相等。也就是说，只有当两个字符串的长度相等，并且各个对应位置的字符都相等才相等。


### 串的操作

（1）赋值           strcpy(数组名、字符串)；

（2）判空           strlen()    strcmp()   

（3）字符串比较     strcmp

（4）求字符串长度   strlen

（5）字符串拷贝     strcpy

（6）字符串连接     strcat

（7）求字符串子串（截取字符串）


### 存储结构

![](imgs/数据结构_串_思维导图_顺序存储结构.webp)

a. 定长顺序存储表示：类似线性表的顺序存储结构，用一组地址连续的存储单元存储字符串的字符序列。

```c++
#define MAXSIZE 255;

typedef struct
{
    char ch[MAXSIZE];
    int length;
} SString;
```

b. 堆分配存储表示：这种存储方式特点是：仍一一组连续的存储单元存放字符串序列，但它们的存储空间是在程序执行过程中动态分配而得的。

以一组地址连续的存储单元存放串值，但存储空间的分配是动态进行的。例如在C语言中用malloc()和free()来动态管理存储空间。

```c++
typedef struct
{
    char *ch;
    int length;
} HString;
```

c. 块链存储表示：和线性表的链式存储类似，也是用链表来保存字符串的值。根据串的特殊，若每个字符占一个结点太小，则采取每个结点可以存放一个也可以存放多个字符。

``` c++
#define CHUNKSIZE 80;

typedef struct Chunk
{
    char ch[CHUNKSIZE];
    struct Chunk *next;
} Chunk;

typedef struct
{
    Chunk *head, *tail; /* 串的头和尾指针 */
    int curlen;         /* 串的当前长度 */
} LString;
```


### 串的模式匹配算法 : 求子串位置的定位函数

![](imgs/数据结构_串_思维导图_比较.webp)

> a. ACM算法：子串的定位函数Index(S,T,pos)。O(n*m)

```c++
int Index(SString S, SString T, int pos)
{
    int i, j;
    i = pos; /* 主串开始比对位置 */
    j = 1;

    while ((i <= S.length) && (j <= T.length))
    {
        if (S.ch[i - 1] == T.ch[j - 1])
        {
            /* 继续比较后续字符 */
            i++;
            j++;
        }
        else
        {
            i = i - j + 2;
            j = 1;
        }
    }

    if (j > T.length)
    {
        return (i - T.length);
    }
    else
    {
        return (-1);
    }
}
```

> b. KMP算法：模式匹配的一种改进算法。O(n + m)

![](imgs/数据结构_串_思维导图_KMP模式匹配算法.webp)

这种改进算法是D.E.Knuth与V.R.Pratt和J.H.Morris同时发现的，因此人们称它为克努特-莫里斯-普拉特操作（简称KMP算法）。此算法可以在O（n+m）的时间数量级上完成串的模式匹配操作。

其改进在于：每趟匹配过程出现字符比较不等时，不需要回溯i指针，而是利用已经得到的“部分匹配”的结果将模式串向右“滑动”尽可能远的一段距离后，继续进行比较。

```c++
void GetNext(SString T, int next[])
{
    int i = 1;
    int j = 0;
    next[1] = 0;

    while (i < T.length)
    {
        if ((j == 0) || (T.ch[i] == T.ch[j]))
        {
            i++;
            j++;
            next[i] = j;
        }
        else
        {
            j = next[j];
        }
    }
}

int IndexKMP(SString S, SString T, int pos)
{
    int i, j;
    i = pos; /* 主串开始比对位置 */
    j = 1;

    while ((i <= S.length) && (j <= T.length))
    {
        if (S.ch[i - 1] == T.ch[j - 1])
        {
            /* 继续比较后续字符 */
            i++;
            j++;
        }
        else
        {
            j = next[j];
        }
    }

    if (j > T.length)
    {
        return (i - T.length);
    }
    else
    {
        return (-1);
    }
}
```
