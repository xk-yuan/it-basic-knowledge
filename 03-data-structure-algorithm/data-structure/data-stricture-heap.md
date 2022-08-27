# data-stricture-heap

> 堆 (完全二叉树)

## 资源

> [百度百科-堆](https://baike.baidu.com/item/%E5%A0%86/20606834)
> [百度百科-堆排序](https://baike.baidu.com/item/%E5%A0%86%E6%8E%92%E5%BA%8F/2840151)
>
>
> [基本数据结构――堆的基本概念及其操作](https://www.cnblogs.com/JVxie/p/4859889.html)
>
> [数据结构-堆的实现](https://blog.csdn.net/tuke_tuke/article/details/50357939)
>
> [数据结构中堆、栈和队列的理解](https://www.jianshu.com/p/5f148c3e4f7d)
>
> [数据结构：堆（Heap）](https://www.jianshu.com/p/6b526aa481b1)
>
> [深入理解堆（最大堆，最小堆及堆排序）](https://blog.csdn.net/summerlq/article/details/82747940)
>
> [关于堆结构的详解](https://www.cnblogs.com/sxkgeek/p/9662491.html)
>
> [数据结构-堆(Heap)](https://blog.csdn.net/szu_crayon/article/details/81812946)
>
> [数据结构------堆(二、堆的实现)](https://blog.csdn.net/qq_41535967/article/details/81021374)
>

> [堆排序](https://blog.csdn.net/qq_28063811/article/details/93034625)
> [堆排序算法](https://blog.csdn.net/u010452388/article/details/81283998)
>
> [数据结构—堆排序](https://www.cnblogs.com/wkfvawl/p/9798561.html)
>
> [浅谈堆排序](https://www.jianshu.com/p/938789fde325)

> [堆和树有什么区别？堆为什么要叫堆，不叫树呢？](https://www.zhihu.com/question/36134980)


## 概述

### 定义 (堆、堆排序)

完全二叉树 ：若设二叉树的深度为h，除第 h 层外，其它各层 (1～h-1) 的结点数都达到最大个数，第 h 层所有的结点都连续集中在最左边，这就是完全二叉树。


堆, n个元素的序列 {k1,k2,ki,…,kn} 当且仅当满足下关系时 [ (ki <= k2i,ki <= k2i+1)或者(ki >= k2i,ki >= k2i+1), (i = 1,2,3,4...n/2) ]，称之为堆。

  - 堆中某个节点的值总是不大于或不小于其父节点的值。

  - 堆总是一棵完全二叉树。

通常是一个可以被看做一棵完全二叉树的数组对象。堆是非线性数据结构，相当于一维数组，有两个直接后继。堆仅仅使用一个数据来存储数组，且不使用指针。

将根节点最大的堆叫做最大堆或大根堆，根节点最小的堆叫做最小堆或小根堆。每个结点的值都大于其左孩子和右孩子结点的值，称之为大根堆；每个结点的值都小于其左孩子和右孩子结点的值，称之为小根堆

其利用完全二叉树的结构来维护一组数据，然后进行相关操作，一般的操作进行一次的时间复杂度在O(1)~O(logn)之间。


堆排序（Heapsort）, 是指利用堆这种数据结构所设计的一种排序算法。堆是一个近似完全二叉树的结构，并同时满足堆积的性质：即子结点的键值或索引总是小于（或者大于）它的父节点。

### 堆分类

1. 堆

2. 二叉堆 (binary heap)

3. d-堆

4. 左式堆 (leftist heap)

5. 斜堆 (skew heap)

6. 斐波那契堆 (Fibonacci heap)
