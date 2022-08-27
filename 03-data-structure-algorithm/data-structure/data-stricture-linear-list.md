# data-structure-linear-list

> 表 , 线性表，线性结构

## 资源

> [百度百科-线性表](https://baike.baidu.com/item/%E7%BA%BF%E6%80%A7%E8%A1%A8/3228081)
> [百度百科-线性表结构](https://baike.baidu.com/item/%E7%BA%BF%E6%80%A7%E8%A1%A8%E7%BB%93%E6%9E%84/21509101)
>
> [百度百科-顺序表](https://baike.baidu.com/item/%E9%A1%BA%E5%BA%8F%E8%A1%A8/9664274)
> [百度百科-链表](https://baike.baidu.com/item/%E9%93%BE%E8%A1%A8/9794473)


> [超清晰-数据结构之线性表](https://blog.csdn.net/qq_38378384/article/details/80430396)
>
> [数据结构之线性表](https://www.cnblogs.com/accper/p/9136466.html)
>
> [链表基础知识总结](https://blog.csdn.net/u012531536/article/details/80170893)
>
> [链表](https://www.zhihu.com/topic/19649942)
>
> [链表实战（带图分析）](https://www.jianshu.com/p/9a4561d42e9a)

## 概论

表，线性表 (linear list)，指的是具有一对一关系的数据所组成的数据结构。一个线性表是n个具有相同特性的数据元素的有限序列。

**存储结构：顺序表 和 链表。** 线性结构是一个有序数据元素的集合。常用的线性结构有：线性表，栈，队列，双队列，串(一维数组)。

顺序存储，指的是用一组地址连续的存储单元依次存储线性表的数据元素，称为线性表的顺序存储结构或顺序映像（sequential mapping）。

它以“物理位置相邻”来表示线性表中数据元素间的逻辑关系，可随机存取表中任一元素

链式存储，指的是用一组任意的存储单元存储线性表中的数据元素，称为线性表的链式存储结构。它的存储单元可以是连续的，也可以是不连续的。

在表示数据元素之间的逻辑关系时，除了存储其本身的信息之外，还需存储一个指示其直接后继的信息（即直接后继的存储位置），这两部分信息组成数据元素的存储映像，称为结点（node）。它包括两个域；存储数据元素信息的域称为数据域；存储直接后继存储位置的域称为指针域。指针域中存储的信息称为指针或链。


### 表, 线性表 (Linear-list Structure)

> 线性结构的特点 ：
>
> 在数据元素的非空有限集中，
> (1) 存在唯一的一个被称做“第一个”的数据元素；
> (2) 存在惟一的一个被称做“最后一个”的数据元素；
> (3) 除第一个之外，集合中的每个数据元素均只有一个前驱；
> (4) 除最后一个之外，集合中每个数据元素均只有一个后继。

> 均匀性：虽然不同数据表的数据元素可以是各种各样的，但对于同一线性表的各数据元素必定具有相同的数据类型和长度。

> 有序性：各数据元素在线性表中的位置只取决于它们的序号，数据元素之前的相对位置是线性的，即存在唯一的“第一个“和“最后一个”的数据元素，除了第一个和最后一个外，其它元素前面均只有一个数据元素(直接前驱)和后面均只有一个数据元素（直接后继）。


链表在插入的时候可以达到O(1)的复杂度，比另一种线性表顺序表快得多，但是查找一个节点或者访问特定编号的节点则需要O(n)的时间，而线性表和顺序表相应的时间复杂度分别是O(logn)和O(1)。链表结构可以克服数组链表需要预先知道数据大小的缺点，链表结构可以充分利用计算机内存空间，实现灵活的内存动态管理。链表失去了数组随机读取的优点，同时链表由于增加了结点的指针域，空间开销比较大。

链表最明显的好处就是，常规数组排列关联项目的方式可能不同于这些数据项目在记忆体或磁盘上顺序，数据的存取往往要在不同的排列顺序中转换。链表允许插入和移除表上任意位置上的节点，但是不允许随机存取。


#### 顺序表 (array 数组)

> [ViewCodeInJava - MyArrayList](https://github.com/xknower/data-structure-and-algorithm-analysis-in-java-3nd-edition/blob/master/src/main/java/ch03/MyArrayList.java)

顺序表，线性存储结构，是在计算机内存中以数组的形式保存的线性表，是指用一组地址连续的存储单元依次存储数据元素的线性结构。

概念：用一组地址连续的存储单元依次存储线性表的数据元素，这种存储结构的线性表称为顺序表。

特点：逻辑上相邻的数据元素，物理次序也是相邻的。

> - 操作
>
> 0. 结构定义
> 1. 初始化
> 2. 取值
> 3. 赋值
> 4. 查找
> 5. 插入
> 6. 删除

#### 链表 (Linked list)

> [ViewCodeInJava - MyLinkedList](https://github.com/xknower/data-structure-and-algorithm-analysis-in-java-3nd-edition/blob/master/src/main/java/ch03/MyLinkedList.java)

链表，链式存储结构，是一种常见的基础数据结构，是一种线性表，但是并不会按线性的顺序存储数据，而是在每一个节点里存到下一个节点的指针(Pointer)。链表分为：单向链表，双向链表以及循环链表。

其是一种物理存储单元上非连续、非顺序的存储结构，数据元素的逻辑顺序是通过链表中的指针链接次序实现的。
其由一系列结点（链表中每一个元素称为结点）组成，结点可以在运行时动态生成。每个结点包括两个部分：一个是存储数据元素的数据域，另一个是存储下一个结点地址的指针域。其中存储数据元素信息的域称作数据域（设域名为data），存储直接后继存储位置的域称为指针域（设域名为next）。指针域中存储的信息又称做指针或链。


概念：用一组任意的存储单元存储线性表的数据元素（这组存储单元可以是连续的，也可以是不连续的），包括数据域和指针域，数据域存数据，指针域指示其后继的信息。

> - 操作
>
> 0. 结构定义
> 1. 初始化
> 2. 取值
> 3. 赋值
> 4. 查找
> 5. 插入
> 6. 删除

1. 单向链表

单向链表，它包含两个域，一个信息域和一个指针域。这个链接指向列表中的下一个节点，而最后一个节点则指向一个空值。

单向链表只可向一个方向遍历。

链表最基本的结构是在每个节点保存数据和到下一个节点的地址，在最后一个节点保存一个特殊的结束标记，另外在一个固定的位置保存指向第一个节点的指针，有的时候也会同时储存指向最后一个节点的指针。

2. 双向链表

双向链表，双链表，是链表的一种，它的每个数据结点中都有**两个指针**，分别指向直接后继和直接前驱。一般都构造使用，双向循环链表。

3. 循环链表

循环链表是一种链式存储结构，它的最后一个结点指向头结点，形成一个环。