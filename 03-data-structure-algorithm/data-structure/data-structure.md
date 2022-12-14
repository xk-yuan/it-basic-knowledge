# data-structure

> 数据结构

## 资源

> [百度百科 - 数据结构](https://baike.baidu.com/item/%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84/1450)

> [数据结构：八大数据结构分类](https://blog.csdn.net/yeyazhishang/article/details/82353846)
>
> [常见数据结构与算法整理总结（上）](https://www.jianshu.com/p/230e6fde9c75)
>
> [Java - 集合框架完全解析](https://www.jianshu.com/p/63e76826e852)
> [集合框架](https://www.runoob.com/java/java-collections.html)
>
> [如何学习数据结构？](https://www.zhihu.com/question/21318658)
> [怎么学好数据结构？](https://www.zhihu.com/question/19830721)
>
> [数据结构与算法入门](https://www.dotcpp.com/course/ds/)

> [图解！24张图彻底弄懂九大常见数据结构！](https://blog.csdn.net/zhenghongcs/article/details/106536390)

## 目录

> 00.  数据结构
>
> - 概论
>
> - 抽象数据结构
>
> - 结构分类
>
> - 算法
>
>   - 时间复杂度
>
>   - 空间复杂度

> 01. 表
>
> - 顺序表(线性表、数组) : 
>
> - 链表 (linked list)
>
>   - a. 单链表
>
>   - b. 双链表

> 02. 串(string, 字符串) : 是一种特殊的线性表, 它的每个结点仅由一个字符组成。
>![](imgs/data-structure-串-思维导图.png)

> 03. 栈(stack) : 后进先出 (单链表实现)

> 04. 队列(queue) : 先进先出 (双向链表实现)
>
>   - 优先队列 : 优先高的先出, 使用堆结构实现

> 05. 树
>
>   - 树 (tree) : 单行分支结构的树
>
>     - 树遍历
>
>   - 二叉树 (binary tree) : 只有两个分支的树
>
>     - 完全二叉树 (Complete Binary Tree) : 所有节点遵循, 从上到下, 从左到右添加节点 的树
>       - 1. 因为完全二叉树是完全相连, 对完全二叉树按照从上到下, 从左到右进行编号, 可以得到一维数组。所以完全二叉树可以通过数组去存储。
>         parent = (i - 1) / 2 // 根据节点标号, 计算节点的父节点标号
>
>     - 满二叉树, 是完全二叉树的一种特殊形式, 所有子节点满的情况。
>
>     - 二叉查找树 (binary search tree) : (二叉排序树, 二叉搜索树)  1. 只有两个分支的树 2. 当添加节点时, 大于父节点时添加到父节点的左边, 小于父节点添加到父节点右边。
>     若左子树不空, 则左子树上所有结点的值均小于它的根结点的值; 若右子树不空，则右子树上所有结点的值均大于或等于它的根结点的值; 左、右子树也分别为二叉搜索树。
>     二叉搜索树中，左子树都比其根节点小，右子树都比其根节点大，递归定义。二叉搜索树的中序遍历一定是从小到大排序的。
>
>     - 平衡二叉树: 特殊的二叉查找树，他的结点元素间存在着偏序关系。左右子树的高度差不超过1，空树也是平衡二叉树的一种。倒数第二次层节点满, 最后一层节点从左到右分布。
>
>   - AVL 树 (adelson-velskii-landis)
>
>   - 伸展树 (splay tree)
>
>   - B 树

> 完全二叉树
> - 1. 因为完全二叉树是完全相连, 对完全二叉树按照从上到下, 从左到右进行编号, 可以得到一维数组。所以完全二叉树可以通过数组去存储。
>   2. 根据节点标号, 计算节点的父节点标号 : parent = (i - 1) / 2; 子节点 : C1 = 2i + 1, C2 = 2i + 2
>

>   - 红黑树
>   - trie 树

> 06. 散列
>
>   - 分离链接法 (separate chaining) (链表)
>
>   - 不用链表的散列表
>
>     - a. 线性探测法
>
>     - b. 平方探测法
>
>     - c. 双散列
>
>   - 最坏情况O(1)访问的散列表
>
>     - 完美散列
>
>     - 布谷鸟散列 (cuckoo hashing)
>
>     - 跳房子散列 (hopscotch hashing)
>
>   - 通用散列法
>
>   - 可扩散列 (extendible hashing)

> 07. 堆(heap) (优化队列, priority queue) : 1. 是完全二叉树 2. 所有父节点大于子节点
>
>   - 二叉堆 (binary heap)
>
>   - d-堆
>
>   - 左式堆 (leftist heap)
>
>   - 斜堆 (skew heap)
>
>   - 二项队列 (binomial queue)

> 堆 : heapfiy : 遍历递归所有节点, 子节点大于父节点, 子节点和父节点交换。从 h-1 层 向下遍历判断。

>   - 斐波那契堆 (Fibonacci heap)

> 08. 图 (Graph)
>![](imgs/数据结构与算法分析_图_思维导图.png)
>
>  - 存储结构
>    - 领接矩阵法
>    - 邻接表法
>    - 十字链表
>    - 邻接多重表
>
>  - 图遍历
>
>     - 广度优先遍历 (BFS)
>
>     - 深度优先遍历 (DFS)

> 算法
>
> 1. 排序算法
>
>   - 插入排序 (insertion sort)
>
>   - 希尔排序 (sell sort)
>
>   - 堆排序 (heap sort)
>
>   - 归并排序 (merge sort)
>
>   - 快速排序 (quick sort)
>
>   - 快速选择 : 解决选择问题(selection problem), 
>
>   - 线性时间排序
>
>     - 桶排序 (bucket sort)
>
>     - 基数排序 (radix sort)
>
>   - 外部排序 (external sorting)


## 概论

数据结构 (data structure), 计算机存储、组织数据方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。

数据结构, 是带有结构特性的数据元素的集合，它研究的是数据的逻辑结构和数据的物理结构以及它们之间的相互关系，并对这种结构定义相适应的运算，设计出相应的算法，并确保经过这些运算以后所得到的新结构仍保持原来的结构类型。

**数据结构 : 数据逻辑结构、数据物理结构、数据之间的相互关系**

简言之，数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。即带“结构”的数据元素的集合。“结构”就是指数据元素之间存在的关系，分为逻辑结构和存储结构。

数据结构中，同一逻辑结构可以对应不同的存储结构。算法的设计取决于数据的逻辑结构，而算法的实现依赖于指定的存储结构。

>**数据的逻辑结构 ：**
>
> 指反映数据元素之间的逻辑关系的数据结构，其中的逻辑关系是指数据元素之间的前后间关系，而与他们在计算机中的存储位置无关。
>
>  1. 集合结构  : 数据结构中的元素之间除了“同属一个集合” 的相互关系外，别无其他关系
>
>  2. 线形结构  : 数据结构中的元素存在一对一的相互关系。(又称为表结构)
>
>  3. 树形结构  : 数据结构中的元素存在一对多的相互关系
>
>  4. 图形结构  : 数据结构中的元素存在多对多的相互关系

> **数据的物理结构 ：**
>
> 指数据的逻辑结构在计算机存储空间的存放形式。
>
> 数据结构在计算机中的表示(映像)，它包括数据元素的机内表示和关系的机内表示。一般来说，一种数据结构的逻辑结构根据需要可以表示成多种存储结构，常用的存储结构有顺序存储、链式存储、索引存储和哈希存储等。
>
> 数据的顺序存储结构的特点是：借助元素在存储器中的相对位置来表示数据元素之间的逻辑关系；非顺序存储的特点是：借助指示元素存储地址的指针表示数据元素之间的逻辑关系。
> 
> 1. 数据元素的机内表示
>
>  用二进制位（bit）的位串表示数据元素。通常称这种位串为节点（node）。当数据元素有若干个数据项组成时，位串中与各个数据项对应的子位串称为数据域（data field）。因此，节点是数据元素的机内表示（或机内映像）。
>
> 2. 数据关系的机内表示
>
>  数据元素之间的关系的机内表示可以分为顺序映像和非顺序映像，常用两种存储结构：顺序存储结构和链式存储结构。
>
>  顺序映像借助元素在存储器中的相对位置来表示数据元素之间的逻辑关系。非顺序映像借助指示元素存储位置的指针（pointer）来表示数据元素之间的逻辑关系。

数据结构按照数据的逻辑结构可以划分为，线性结构和非线性结构。

线性结构特点 :

 > 线性表就是典型的线性结构，还有栈、队列和串等都属于线性结构。

  1. 线性结构是非空集。
  2. 线性结构有且仅有一个开始结点和一个终端结点。
  3. 线性结构所有结点都最多只有一个直接前趋结点和一个直接后继结点。

非线性结构特点 ：

  > 非线性结构就是表中各个结点之间具有多个对应关系
  > 数组、广义表、树结构和图结构等数据结构都属于非线性结构。

  1. 非线性结构是非空集。
  2. 非线性结构的一个结点可能有多个直接前趋结点和多个直接后继结点。


## 常用数据结构

```
表
    - 链表  ▪ 队列  ▪ 堆栈 ▪ 循环队列 ▪ 跳跃列表

数组 (Array)
    在程序设计中，为了处理方便，把具有相同类型的若干变量按有序的形式组织起来。
    这些按序排列的同类数据元素的集合称为数组。
    在C语言中， 数组属于构造数据类型。一个数组可以分解为多个数组元素，这些数组元素可以是基本数据类型或是构造类型。
    因此按数组元素的类型不同，数组又可分为数值数组、字符数组、指针数组、结构数组等各种类别。
    - 关联数组  ▪ Multimap  ▪ 集 ▪ 多重集 ▪ 散列表 ▪ 树状数组

链表 (Linked List)
    是一种物理存储单元上非连续、非顺序的存储结构，它既可以表示线性结构，也可以用于表示非线性结构，数据元素的逻辑顺序是通过链表中的指针链接次序实现的。
    链表由一系列结点（链表中每一个元素称为结点）组成，结点可以在运行时动态生成。
    每个结点包括两个部分：一个是存储数据元素的数据域，另一个是存储下一个结点地址的指针域。

栈 (Stack)
    是只能在某一端插入和删除的特殊线性表。
    它按照先进后出的原则存储数据，先进入的数据被压入栈底，最后的数据在栈顶，需要读数据的时候从栈顶开始弹出数据（最后一个数据被第一个读出来）。

队列 (Queue)
    一种特殊的线性表，它只允许在表的前端（front）进行删除操作，而在表的后端（rear）进行插入操作。
    进行插入操作的端称为队尾，进行删除操作的端称为队头。队列是按照"先进先出"或"后进后出"的原则组织数据的。队列中没有元素时，称为空队列。

树 (Tree)
    是包含 n（n>0）个结点的有穷集合K，且在K中定义了一个关系N，N满足 以下条件：
    有且仅有一个结点 K0，他对于关系N来说没有前驱，称K0为树的根结点。简称为根（root）。
    除K0外，K中的每个结点，对于关系N来说有且仅有一个前驱。
    K中各结点，对关系N来说可以有m个后继（m>=0）。
    - 二叉查找树 ▪ 堆 ▪ 线段树 ▪ 红黑树 ▪ AVL树

散列表 (Hash)
    若结构中存在关键字和K相等的记录，则必定在f(K)的存储位置上。
    由此，不需比较便可直接取得所查记录。称这个对应关系f为散列函数(Hash function)，按这个思想建立的表为散列表。

堆 (Heap)
    在计算机科学中，堆是一种特殊的树形数据结构，每个结点都有一个值。通常我们所说的堆的数据结构，是指二叉堆。堆的特点是根结点的值最小（或最大），且根结点的两个子树也是一个堆。

图 (Graph)
    图是由结点的有穷集合V和边的集合E组成。
    其中，为了与树形结构加以区别，在图结构中常常将结点称为顶点，边是顶点的有序偶对，若两个顶点之间存在一条边，就表示这两个顶点具有相邻关系。
    - 有向无环图 ▪ 二元决策图 ▪ 无向图
```
