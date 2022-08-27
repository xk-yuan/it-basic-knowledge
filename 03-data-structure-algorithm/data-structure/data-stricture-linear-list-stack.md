# data-stricture-linear-list-stack

> 栈 (特殊线性表)

## 资源

> [百度百科-栈](https://baike.baidu.com/item/%E6%A0%88/12808149)
> [百度百科-堆栈](https://baike.baidu.com/item/%E5%A0%86%E6%A0%88/1682032)
>
> [栈（链式栈）----C语言](https://www.cnblogs.com/lanhaicode/p/10463156.html)
>
> [栈的作用](https://blog.csdn.net/yu132563/article/details/51598185)
>
> [栈的顺序存储及实现（一）](https://blog.csdn.net/qq_29542611/article/details/78882939)

## 概述

### 定义

栈 (stack, 又名堆栈), 是一种运算受限的线性表, 其限定仅在表尾进行插入和删除操作, 操作得一端称为栈顶(top), 另一端称为栈底(bottom)。

向一个栈插入新元素又称作进栈、入栈或压栈，把新元素放到栈顶元素的上面，使之成为新的栈顶元素;从一个栈删除元素又称作出栈或退栈，它是把栈顶元素删除掉, 使其相邻的元素成为新的栈顶元素。

栈作为一种数据结构，是一种只能在一端进行插入和删除操作的特殊线性表。它按照先进后出的原则存储数据，先进入的数据被压入栈底，最后的数据在栈顶，需要读数据的时候从栈顶开始弹出数据（最后一个数据被第一个读出来）。栈具有记忆作用，对栈的插入与删除操作中，不需要改变栈底指针。


### 栈操作

- 栈的初始化

- 入栈（PUSH）

- 出栈（POP）

- 判断栈是否为空

- 清空栈

### 栈实现 : 链式栈

```c++
/**
 * 链式栈 - 单向链表实现栈
 * 
 * @author xknower
 */
#include <stdio.h>
#include <stdlib.h>

#define Empty 0 /* 栈空 */
#define Avail 1 /* 栈可用 */

typedef struct SNode
{
    int data;
    struct SNode *next;
} StackNode;

typedef struct LStack
{
    StackNode *top;    /* 栈顶指针 */
    StackNode *bottom; /* 栈底指针 */
    int height;        /* 链式栈高度 */
} LinkStack;

LinkStack InitStack(LinkStack pStack);  /* 栈顶指针、栈底指针、栈高度初始化*/
LinkStack Push(LinkStack pStack);       /* 入栈 */
LinkStack Pop(LinkStack pStack);        /* 出栈 */
int StackEmpty(LinkStack pStack);       /* 判断栈是否为空 */
LinkStack DeletStack(LinkStack pStack); /* 清空栈 */
void DisplyStack(LinkStack pStack);     /* 遍历栈----自顶至底*/

//

/* Function: 初始化栈顶、栈底、栈高度*/
LinkStack InitStack(LinkStack pStack)
{
    pStack.top = pStack.bottom = NULL;
    pStack.height = 0;

    return pStack;
}

/* Function: 判断栈是否为空 */
int StackEmpty(LinkStack pStack)
{
    if (pStack.top == NULL && pStack.bottom == NULL)
    {
        return Empty;
    }
    else
    {
        return Avail;
    }
}

/* Function: 入栈 */
LinkStack Push(LinkStack pStack)
{
    int data;
    StackNode *temp;

    if ((temp = (StackNode *)malloc(sizeof(StackNode))) == NULL)
    {
        printf("内存空间不足\n");
        return pStack;
    }
    if (StackEmpty(pStack) == Empty) /* 如果栈为空 */
    {
        pStack.top = pStack.bottom = temp; /* 栈顶、栈底指针都指向新建节点 */
        temp->next = NULL;                 /* 节点指针域为空 */
        printf("Please input data");
        scanf("%d", &data);
        pStack.top->data = data;
        pStack.height++;

        return pStack;
    }
    else /* 栈不为空 */
    {
        temp->next = pStack.top; /* 新建节点指向原来的栈顶 */
        pStack.top = temp;       /* 栈顶指针指向新建节点 */
        printf("Please input data");
        scanf("%d", &data);
        pStack.top->data = data;
        pStack.height++;

        return pStack;
    }
}

/* Function: 出栈 */
LinkStack Pop(LinkStack pStack)
{
    StackNode *Second;

    if (StackEmpty(pStack) == Empty) /* 判断栈是否为空 */
    {
        printf("栈为空，无法出栈\n");
        return pStack;
    }
    if (pStack.top == pStack.bottom) /* 如果出栈的元素为最后一个元素 */
    {
        printf("出栈元素为%d\n", pStack.top->data);
        free(pStack.top);
        pStack.top = pStack.bottom = NULL; /* 栈顶、栈底都指针都置为空 */
        pStack.height--;

        return pStack;
    }
    printf("出栈元素为%d\n", pStack.top->data);
    Second = pStack.top->next; /* 指向栈顶的前一个元素*/

    free(pStack.top);    /* 释放栈顶节点 */
    pStack.top = Second; /* 将头指针移动到新的栈顶节点 */
    pStack.height--;

    return pStack;
}

/* Function: 遍历栈 自顶到底*/
void DisplyStack(LinkStack pStack)
{
    if (StackEmpty(pStack) == Empty)
    {
        printf("栈为空，无法遍历\n");
        return;
    }
    printf("栈中元素[");
    while (pStack.top != NULL)
    {
        printf("%d->", pStack.top->data);
        pStack.top = pStack.top->next;
    }
    printf("]\n");
}

/* Function: 清空栈 */
LinkStack DeletStack(LinkStack pStack)
{
    StackNode *del;

    while (pStack.top != NULL)
    {
        del = pStack.top->next; /* 栈顶节点的前一个节点 */
        free(pStack.top);       /* 释放节点 */
        pStack.top = del;       /* 栈顶指针移动到新栈顶 */
    }

    return pStack;
}

//
int main()
{
    LinkStack p;
    char ch;

    p.height = 0;     /* 栈高度初始化为零 */
    p = InitStack(p); /* 栈初始化 */
    printf("Do you want to push stack(Y/N)?");
    scanf(" %c", &ch);
    while (ch == 'Y' || ch == 'y')
    {
        p = Push(p);    /* 入栈 */
        DisplyStack(p); /* 遍历栈 */
        printf("Do you want to push stack(Y/N)?");
        scanf(" %c", &ch);
    }
    printf("Do you want to pop stack(Y/N)?");
    scanf(" %c", &ch);
    while (ch == 'Y' || ch == 'y')
    {
        p = Pop(p);     /* 出栈 */
        DisplyStack(p); /* 遍历栈 */
        printf("Do you want to pop stack(Y/N)?");
        scanf(" %c", &ch);
    }

    return 0;
}
```
