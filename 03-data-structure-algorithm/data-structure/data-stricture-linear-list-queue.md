# data-stricture-linear-list-queue

> 队列 (特殊线性表)

## 资源

> [百度百科-队列](https://baike.baidu.com/item/%E9%98%9F%E5%88%97/14580481)
> [百度百科-循环队列](https://baike.baidu.com/item/%E5%BE%AA%E7%8E%AF%E9%98%9F%E5%88%97/3685773)
>
> [数据结构-队列](https://www.cnblogs.com/TimVerion/p/11194552.html)
>
> [队列（链队列）](https://www.jianshu.com/p/9cc7c7a53524)
>
> [Java队列（Queue）了解及使用](https://www.jianshu.com/p/7a86c56c632b)
>
> [数据结构系列－队列的基本操作](https://blog.csdn.net/lin20044140410/article/details/79617397)
>
> [队列基本操作](https://blog.csdn.net/zhang21722668/article/details/82155301)

> [队列与优先队列的总结](https://blog.csdn.net/lee371042/article/details/81135007)


## 概述

### 定义

队列 (queue), 是一种运算受限的线性表, 其限定仅在表的前端(front)进行删除操作，而在表的后端(rear)进行插入操作。进行插入操作的端称为队尾，进行删除操作的端称为队头。

队列中没有元素时，称为空队列。在队列中插入一个队列元素称为入队，从队列中删除一个队列元素称为出队。队列又称为先进先出（FIFO—first in first out）线性表。

队列是只允许在一端进行插入操作，而在另一端进行删除操作的线性表。队列是一种先进先出（First in First Out）的线性表，简称FIFO。允许插入的一端称为队尾，允许删除的一端称为队头。

### 操作

- 初始化队列

- 入队操作

- 出队操作

- 读队头元素

- 判队空操作

### 存储结构划分

> 队列可以用数组Q来存储，数组的上界即是队列所容许的最大容量。队列也可以用链表实现。

1. 顺序队列

2. 循环队列 (Circular Queue)

循环队列是把顺序队列首尾相连，把存储队列元素的表从逻辑上看成一个环，成为循环队列。就是将队列存储空间的最后一个位置绕到第一个位置，形成逻辑上的环状空间，供队列循环使用。可以更简单防止伪溢出的发生，但队列大小是固定的。

```c++
#include "stdio.h"
#include "stdlib.h"
#include "io.h"
#include "math.h"
#include "time.h"

#define OK 1
#define ERROR 0
#define TRUE 1
#define FALSE 0
#define MAXSIZE 11 // 初始容量

typedef int Status;
typedef int QElemType; // 定义数据类型

// 循环队列的顺序存储结构
typedef struct
{
    QElemType data[MAXSIZE];
    int front; // 头指针
    int rear;  // 尾指针，队列非空时，指向队尾元素的下一个位置
} SqQueue;

Status visit(QElemType item)
{
    printf("%d", item);
    return OK;
}

// 初始化空队列
Status InitQueue(SqQueue *sQ)
{
    sQ->front = 0;
    sQ->rear = 0;
    return OK;
}

// 将队列清空
Status ClearQueue(SqQueue *Q)
{
    Q->front = Q->rear = 0;
    return OK;
}

// 判断队列是否为null
Status QueueEmpty(SqQueue Q)
{
    if (Q.front == Q.rear)
        return TRUE;
    else
        return FALSE;
}

// 返回队列中的元素个数
int QueueLength(SqQueue Q)
{
    return (Q.rear - Q.front + MAXSIZE) % MAXSIZE;
}

// 返回队头元素
Status GetHead(SqQueue Q, QElemType *e)
{
    if (Q.front == Q.rear) //是否为空队列
        return ERROR;
    *e = Q.data[Q.front];
    return OK;
}

// 在队尾插入元素
Status EnQueue(SqQueue *Q, QElemType e)
{
    if ((Q->rear + 1) % MAXSIZE == Q->front) // 队列已满
        return ERROR;

    Q->data[Q->rear] = e;              // 插入队尾
    Q->rear = (Q->rear + 1) % MAXSIZE; // 尾部指针后移，如果到最后则转到头部
    return OK;
}

// 元素出队
Status DeQueue(SqQueue *Q, QElemType *e)
{
    if (Q->front == Q->rear) //队列空
        return ERROR;
    *e = Q->data[Q->front];              // 返回队头元素
    Q->front = (Q->front + 1) % MAXSIZE; // 队头指针后移，如到最后转到头部
    return OK;
}

// 遍历队列元素
Status QueueTraverse(SqQueue Q)
{
    int i = Q.front;
    while ((i + Q.front) != Q.rear)
    {
        visit(Q.data[i]);
        i = (i + 1) % MAXSIZE;
    }
    printf("\n");
    return OK;
}

int main()
{

    Status j;
    int i = 0, l;
    QElemType d;
    SqQueue Q;
    InitQueue(&Q);

    // 入队10个元素
    for (int i = 0; i < MAXSIZE - 1; i++)
    {
        EnQueue(&Q, i);
    }
    QueueTraverse(Q);

    printf("依次出队:");
    for (l = 1; l <= MAXSIZE; l++)
    {
        DeQueue(&Q, &d);
        printf("d= %d,", d);
    }

    return 0;
}
```

```c++

#include "stdio.h"
#include "stdlib.h"
#include "io.h"
#include "math.h"
#include "time.h"

#define OK 1
#define ERROR 0
#define TRUE 1
#define FALSE 0
#define MAXSIZE 20

typedef int Status;
typedef int QElemType;

// 结点结构
typedef struct QNode
{
    QElemType data;
    struct QNode *next;
} QNode, *QueuePtr;

// 队列的链表结构
typedef struct
{
    QueuePtr front; // 队头
    QueuePtr rear;  // 对尾
} LinkQueue;

Status visit(QElemType e)
{
    printf("%d ", e);
    return OK;
}

// 初始化空的队列
Status InitQueue(LinkQueue *Q)
{
    Q->front = Q->rear = (QueuePtr)malloc(sizeof(QNode));
    if (!Q->front)
        exit(OVERFLOW);
    Q->front->next = NULL;
    return OK;
}

// 销毁队列
Status DestroyQueue(LinkQueue *Q)
{
    while (Q->front)
    {
        Q->rear = Q->front->next; //从队头开始销毁
        free(Q->front);
        Q->front = Q->rear;
    }
    return OK;
}

// 清空队列，队头指针还在
Status ClearQueue(LinkQueue *Q)
{
    QueuePtr p, q;
    Q->rear = Q->front; // 跟初始状态相同，Q->rear指向头结点
    p = Q->front->next; // 开始销毁队头元素，队头，对尾依然保留
    Q->front->next = NULL;
    while (p)
    {
        q = p;
        p = p->next;
        free(q);
    }
    return OK;
}

// 队列是否空
Status QueueEmpty(LinkQueue Q)
{
    if (Q.front == Q.rear)
        return TRUE;
    else
        return FALSE;
}

// 取队列长度
int QueueLength(LinkQueue Q)
{
    int i = 0;
    QueuePtr p = Q.front;
    while (Q.rear != p)
    {
        i++;
        p = p->next;
    }
    return i;
}

// 获取队头元素
Status GetHead(LinkQueue Q, QElemType *e)
{
    QueuePtr p;
    if (Q.front == Q.rear) //队空
        return ERROR;
    p = Q.front->next;
    *e = p->data;
    return OK;
}

// 对尾插入元素
Status EnQueue(LinkQueue *Q, QElemType e)
{
    QueuePtr s = (QueuePtr)malloc(sizeof(QNode));
    if (!s)
        exit(OVERFLOW);
    s->data = e;
    s->next = NULL;
    Q->rear->next = s; //原来对尾的next指向新的元素
    Q->rear = s;       //将新元素变为对尾
    return OK;
}

// 队头元素出队
Status DeQueue(LinkQueue *Q, QElemType *e)
{
    QueuePtr p;
    if (Q->front == Q->rear)
        return ERROR;
    p = Q->front->next; //ｐ指向队头元素
    *e = p->data;
    Q->front->next = p->next; //头结点的后继指向队头的下一个元素
    if (Q->rear == p)
    {                       //队头等于对尾了
        Q->rear = Q->front; //对尾指向头结点
    }
    free(p);
    return OK;
}

// 遍历元素
Status QueueTraverse(LinkQueue Q)
{
    QueuePtr p;
    p = Q.front->next;
    while (p)
    {
        visit(p->data);
        p = p->next;
    }
    printf("\n");
    return OK;
}

int main()
{
    int i;
    QElemType d;
    LinkQueue q;
    i = InitQueue(&q);

    // 入队10个元素
    for (int index = 0; index < MAXSIZE; index++)
    {
        EnQueue(&q, index);
    }
    QueueTraverse(q);

    DestroyQueue(&q);
    printf("队列已经销毁,q.front=%p q.rear=%p\n", q.front, q.rear);

    return 0;
}
```
```c++
// 队列（链队列）
#include <stdio.h>
#include <malloc.h>
#include <math.h>

#define OK 1    // 执行成功
#define ERROR 0 // 执行失败
#define TRUE 1  // 返回值为真
#define FALSE 0 // 返回值为假

typedef int Status;   // 函数返回结果类型
typedef int ElemType; // 元素类型

// 队列节点
typedef struct QNode
{
    ElemType data;      // 元素值
    struct QNode *next; // 指向下一个节点的指针
} QNode, *QueuePtr;

// 链队列结构
typedef struct
{
    QueuePtr front, rear; // 队头指针、队尾指针
} LinkQueue;

/**
 * 初始化队列
 * @param Q 队列
 * @return 执行状态
 */
Status InitQueue(LinkQueue *Q)
{
    // 为队头和队尾指针分配内存
    Q->front = Q->rear = (QueuePtr)malloc(sizeof(QNode));

    // 内存分配失败，结束程序
    if (!Q->front || !Q->rear)
    {
        exit(OVERFLOW);
    }

    Q->front->next = NULL; // 队头节点指向NULL
    return OK;
}

/**
 * 销毁队列
 * @param Q 队列
 * @return 执行状态
 */
Status DestroyQueue(LinkQueue *Q)
{
    // 当队列中还有元素
    while (Q->front)
    {
        Q->rear = Q->front->next; // 队尾指针指向队头指针的下一个元素
        free(Q->front);           // 释放队头指针所在节点
        Q->front = Q->rear;       // 队头指针指向队尾指针（即原来的下一个元素）
    }
    return OK;
}

/**
 * 清空队列
 * @param Q 队列
 * @return 执行状态
 */
Status ClearQueue(LinkQueue *Q)
{
    QueuePtr p, q; // p用来遍历队列节点，q用来指向被删除的节点

    Q->rear = Q->front;    // 队尾指针指向队头指针
    p = Q->front->next;    // p指向队头指针的下一个节点
    Q->front->next = NULL; // 队头指针的下一个节点指向NULL（表示删除之后的所有元素）

    // 当队列中还有元素，释放头节点之后的所有节点
    while (p)
    {
        q = p;       // q节点指向被删除节点
        p = p->next; // p指向队列的下一个节点
        free(q);     // 释放q节点
    }
    return OK;
}

/**
 * 判断队列是否为空
 * @param Q 队列
 * @return 队列是否为空
 */
Status QueueEmpty(LinkQueue Q)
{
    // 头指针和尾指针位置相等，队列为空
    if (Q.front == Q.rear)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

/**
 * 获取队列长度
 * @param Q 队列
 * @return 队列长度
 */
int QueueLength(LinkQueue Q)
{
    int i = 0;   // 用于统计队列长度的计数器
    QueuePtr p;  // 用于遍历队列的元素
    p = Q.front; // p指向队头节点

    // 当p没有移动到队尾指针位置
    while (p != Q.rear)
    {
        i++;         // 计数器加1
        p = p->next; // p移动到队列的下一个节点
    }
    return i; // 返回队列长度
}

/**
 * 获取队列头元素
 * @param Q 队列
 * @param e 存储头元素值
 * @return 执行状态
 */
Status GetHead(LinkQueue Q, ElemType *e)
{
    QueuePtr p;

    // 队列为空，获取失败
    if (Q.front == Q.rear)
    {
        return ERROR;
    }

    p = Q.front->next; // p指向队列的第一个元素
    *e = p->data;      // 将队列头元素的值赋值给e元素
    return OK;
}

/**
 * 在队列的队尾处插入元素
 * @param Q 队列
 * @param e 插入元素值
 * @return 执行状态
 */
Status EnQueue(LinkQueue *Q, ElemType e)
{
    // 给新节点分配空间
    QueuePtr s = (QueuePtr)malloc(sizeof(QNode));

    // 分配空间失败，结束程序
    if (!s)
    {
        exit(OVERFLOW);
    }

    s->data = e;       // 将值赋值给新节点
    s->next = NULL;    // 新节点指向NULL
    Q->rear->next = s; // 队尾指针的下一个元素指向新节点
    Q->rear = s;       // 队尾指针指向新节点（新节点成为队尾指针的指向的节点）
    return OK;
}

/**
 * 删除队头元素
 * @param Q 队列
 * @param e 存储出队元素的值
 * @return 执行状态
 */
Status DeQueue(LinkQueue *Q, ElemType *e)
{
    QueuePtr p; // 用于指向被删除节点

    // 队列为空，出队失败
    if (Q->front == Q->rear)
    {
        return ERROR;
    }

    p = Q->front->next;       // p指向队列的第一个元素
    *e = p->data;             // 将队列头节点的值赋值给元素e
    Q->front->next = p->next; // 头指针的下一个节点指向下下个节点（跳过头节点）

    // 如果被删除节点是队尾指针指向的节点（删除后队列为空）
    if (Q->rear == p)
    {
        Q->rear = Q->front; // 队尾指针指向队头指针
    }
    free(p); // 释放队头节点
    return OK;
}

/**
 * 打印单个元素
 * @param e 元素值
 * @return 执行状态
 */
Status visit(ElemType e)
{
    printf("%d ", e);
    return OK;
}

/**
 * 遍历队列中的元素
 * @param Q 队列
 * @return 执行状态
 */
Status QueueTravel(LinkQueue Q)
{
    QueuePtr p; // 用于遍历队列中的节点

    p = Q.front->next; // p指向头节点

    printf("[ ");
    // 当队列中还有元素
    while (p)
    {
        visit(p->data); // 打印当前节点的值
        p = p->next;    // p移动到队列下一个位置
    }
    printf("]\n");
    return OK;
}

int main()
{
    Status status; // 执行状态
    int j;         // j用来遍历
    ElemType e;    // 元素值
    LinkQueue Q;   // 队列

    /*** 初始化队列 ***/
    InitQueue(&Q); // 初始化队列
    printf("初始化队列后，队列是否为空？%s\n", QueueEmpty(Q) == TRUE ? "是" : "否");

    /*** 向队列中插入10个元素 ***/
    for (j = 1; j <= 10; ++j)
    {
        EnQueue(&Q, j); // 将元素j插入队列
    }
    printf("插入10个元素后队列的值为：");
    QueueTravel(Q);                               // 遍历队列
    printf("队列的长度为：%d\n", QueueLength(Q)); // 获取队列长度
    printf("插入10个元素后，队列是否为空？%s\n", QueueEmpty(Q) == TRUE ? "是" : "否");

    /*** 删除队列中的五个元素，并打印对应的值 ***/
    printf("开始删除元素：\n");
    for (j = 0; j < 5; ++j)
    {
        DeQueue(&Q, &e); // 删除队头元素，将值存到e中
        printf("元素%d出队\n", e);
    }
    printf("5个元素出队后，队列中的值为：");
    QueueTravel(Q);                               // 遍历队列
    printf("队列的长度为：%d\n", QueueLength(Q)); // 获取队列长度

    /*** 获取队列头元素的值 ***/
    status = GetHead(Q, &e); // 获取队列头元素
    if (status)
    {
        printf("队列头元素为：%d\n", e);
    }

    /*** 清空队列元素 ***/
    ClearQueue(&Q); // 清空队列元素
    printf("清空队列后，队列是否为空：%s\n", QueueEmpty(Q) == TRUE ? "是" : "否");
    printf("队列中的元素为：");
    QueueTravel(Q); // 遍历元素
    return 0;
}
```
