# algorithm

> 算法

## 资源

> [百度百科-算法](https://baike.baidu.com/item/%E7%AE%97%E6%B3%95)
>
> [算法到底应该怎么学？](https://www.zhihu.com/question/25693637/answer/747872819)
>
> [常见数据结构与算法整理总结（上）](https://www.jianshu.com/p/230e6fde9c75)
> [常见数据结构与算法整理总结（下）](https://www.jianshu.com/p/42f81846c0fb)
>
> [算法](https://www.runoob.com/w3cnote_genre/algorithm)


> [百度百科-排序算法](https://baike.baidu.com/item/%E6%8E%92%E5%BA%8F%E7%AE%97%E6%B3%95/5399605)
>
>
> [](https://github.com/hustcc/JS-Sorting-Algorithm)
>
> [十大经典排序算法（动图演示）](https://www.cnblogs.com/onepixel/articles/7674659.html)
>
> [超详细十大经典排序算法总结（java代码）](https://blog.csdn.net/weixin_41190227/article/details/86600821)
>
> [图解十大经典排序算法](https://www.jianshu.com/p/1af509b2be08)
>
>
> [排序算法总结](https://www.runoob.com/w3cnote/sort-algorithm-summary.html)
>
> [很多高效排序算法的代价是 nlogn，难道这是排序算法的极限了吗？](https://www.zhihu.com/question/24516934)
>
> [数据结构的那些排序算法总是记不住，这个真的背的吗？](https://www.zhihu.com/question/51337272)


## 目录

1. 算法

2. 排序算法

  - 比较排序算法

    - 1. 交换排序算法

      - a. [冒泡排序]

      - b. [快速排序]

    - 2. 插入排序算法

      - c. [简单(直接)插入排序]

      - d. [希尔排序]

    - 3. 选择排序算法

      - e. [简单(直接)选择排序]

      - f. [堆排序]

    - 4. 归并排序算法

      - g. [二路归并排序]

      - h. [多路归并排序]

  - 非比较排序算法

    - i. [计数排序]

    - j. [桶排序]

    - k. [基数排序]
  
  - 

3. 查找算法

  - [顺序查找(线性查找)]

  - [二分查找(折半查找)]

4. 其他算法

## 概论

算法 (Algorithm), 指解题方案的准确而完整的描述，是一系列解决问题的清晰指令，算法代表着用系统的方法描述解决问题的策略机制。

数据结构是以某种形式将数据组织在一起的集合，它不仅存储数据，还支持访问和处理数据的操作。算法是为求解一个问题需要遵循的、被清楚指定的简单指令的集合。

不同的算法可能用不同的时间、空间或效率来完成同样的任务。一个算法的优劣可以用空间复杂度与时间复杂度来衡量。

特性 :

  1. 有穷性

  2. 确切性

  3. 输入

  4. 输出

  5. 可行性

度量 :

  1. 时间复杂度

  2. 空间复杂度

  3. 正确性

  4. 可读性

  5. 健壮性 (容错性)

思路 :

  1. 递推法

  2. 递归法

  3. 穷举法     : 对于要解决的问题，列举出它的所有可能的情况，逐个判断有哪些是符合问题所要求的条件，从而得到问题的解。

  4. 贪心算法   : 一种对某些求最优解问题的更简单、更迅速的设计技术。

  5. 分治法     : 把一个复杂的问题分成两个或更多的相同或相似的子问题，再把子问题分成更小的子问题……直到最后子问题可以简单的直接求解，原问题的解即子问题的解的合并。

  6. 动态规划法

  7. 迭代法

  8. 分支界限法

  9. 回溯法     : 是一种选优搜索法，按选优条件向前搜索，以达到目标。

## 算法分类

1. 基本算法

2. 数据结构的算法

3. 数论与代数算法

4. 计算几何的算法

5. 图论的算法

6. 动态规划以及数值分析

7. 加密算法

8. 排序算法

9. 检索算法

10. 随机化算法

11. 并行算法

12. 厄米变形模型

13. 随机森林算法

## 排序算法 (sorting-algorithm)

![](imgs/algorithm_思维导图.png)

排序，就是使一串记录，按照其中的某个或某些关键字的大小，递增或递减的排列起来的操作。

排序算法，就是如何使得记录按照要求排列的方法。通过特定的算法因式将一组或多组数据按照既定模式进行重新排序。这种新序列遵循着一定的规则，体现出一定的规律，因此，经处理后的数据便于筛选和计算，大大提高了计算效率。

排序(Sorting) 是计算机程序设计中的一种重要操作，它的功能是将一个数据元素（或记录）的任意序列，重新排列成一个关键字有序的序列。

排序就是把集合中的元素按照一定的次序排序在一起。一般来说有升序排列和降序排列2种排序。

![](imgs/algorithm_算法复杂度对比_01.png)
![](imgs/algorithm_算法复杂度对比.png)

> 稳定 :  如果a原本在b前面，而a=b，排序之后a仍然在b的前面。稳定性是不管考虑时间和空间必须要考虑的问题，往往也是非常重要的影响选择的因素。
>
> 不稳定： 如果a原本在b的前面，而a=b，排序之后 a 可能会出现在 b 的后面。
>
> 时间复杂度: 对排序数据的总的操作次数。反映当n变化时，操作次数呈现什么规律。
>
> 空间复杂度：是指算法在计算机内执行时所需存储空间的度量，它也是数据规模n的函数。 

### 01. 冒泡排序 (Bubble Sort)

冒泡排序，其重复地走访过要排序的数列，一次比较两个元素，如果它们的顺序错误就把它们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。

其，是一种简单的排序算法。

这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。 

> **算法描述**
>
> 1. 比较相邻的元素。如果第一个比第二个大，就交换它们两个;
>
> 2. 对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对，这样在最后的元素应该会是最大的数;
>
> 3. 针对所有的元素重复以上的步骤，除了最后一个;
>
> 4. 重复步骤 1~3，直到排序完成。


![](imgs/algorithm_冒泡排序_动态示意图.gif)

```js
function bubbleSort(arr) {
    var len = arr.length;

    for (var i = 0; i < (len - 1); i++) {
        for (var j = 0; j < (len - 1) - i; j++) {
            // 按趟遍历, 比较并交换相邻的元素 (最大的元素, 每趟都会移到到最后)
            if (arr[j] > arr[j + 1]) {
                var temp = arr[j + 1]; 
                arr[j + 1] = arr[j];
                arr[j] = temp;
            }
        }
    }
    
    return arr;
}
```

```java
public class Sort {
    /**
     * 冒泡排序
     * 
     * @param array
     * @return
     */
    public static int[] bubbleSort(int[] array) {
        if (array.length == 0)
            return array;

        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array.length - 1 - i; j++) {
                // 按趟遍历, 比较并交换相邻的元素 (最大的元素, 每趟都会移到到最后)
                if (array[j + 1] < array[j]) {
                    int temp = array[j + 1];
                    array[j + 1] = array[j];
                    array[j] = temp;
                }
            }
        }

        return array;
    }
}
```

### 02. 选择排序 (Selection Sort)

选择排序, 其原理是, 首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置; 然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾; 以此类推，直到所有元素均排序完毕。 

其，是一种简单直观的排序算法。

其，是表现最稳定的排序算法之一，因为无论什么数据进去都是O(n2)的时间复杂度，所以用到它的时候，数据规模越小越好。

其, 唯一的好处可能就是不占用额外的内存空间了吧。理论上讲，选择排序可能也是平时排序一般人想到的最多的排序方法了。


> **算法描述 (n个记录的直接选择排序可经过n-1趟直接选择排序得到有序结果)**
>
> 1. 初始状态：无序区为 R[1..n]，有序区为空;
>
> 2. 第 i 趟排序 (i=1,2,3…n-1) 开始时，当前有序区和无序区分别为 R[1..i-1] 和 R(i..n）。
> 该趟排序从当前无序区中, 选出关键字最小的记录 R[k]，将它与无序区的第1个记录R交换，使R[1..i]和R[i+1..n)分别变为记录个数增加1个的新有序区和记录个数减少1个的新无序区;
>
> 3. n-1 趟结束，数组有序化了。


![](imgs/algorithm_选择排序_动态示意图.gif)

```js
function selectionSort(arr) {
    var len = arr.length;

    for (var i = 0; i < (len - 1); i++) {
        // 1. 查找并记录下最小的一个元素
        var minIndex = i;

        for (var j = (i + 1); j < len; j++) {
            // 寻找最小的数, 并 将最小数的索引保存
            if (arr[j] < arr[minIndex]) {
                minIndex = j;
            }
        }

        // 2. 将查找到的最小元素, 交换到最前面
        var temp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = temp;
    }

    return arr;
} 
```

```java
public class Sort {
    /**
     * 选择排序
     * 
     * @param array
     * @return
     */
    public static int[] selectionSort(int[] array) {
        if (array.length == 0)
            return array;

        for (int i = 0; i < array.length; i++) {
            // 1. 查找并记录下最小的一个元素
            int minIndex = i;

            for (int j = i; j < array.length; j++) {
                // 寻找最小的数, 并 将最小数的索引保存
                if (array[j] < array[minIndex])
                    minIndex = j;
            }

            // 2. 将查找到的最小元素, 交换到最前面
            int temp = array[minIndex];
            array[minIndex] = array[i];
            array[i] = temp;
        }

        return array;
    }
}
```


### 03. 插入排序 (Insertion Sort)

插入排序, 其工作原理 是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。

其，是一种简单直观的排序算法。

其, 在实现上，通常采用in-place排序（即只需用到O(1)的额外空间的排序），因而在从后向前扫描过程中，需要反复把已排序元素逐步向后挪位，为最新元素提供插入空间。

> **算法描述 (一般来说，插入排序都采用in-place在数组上实现)**
>
> 1. 从第一个元素开始，该元素可以认为已经被排序;
>
> 2. 取出下一个元素，在已经排序的元素序列中从后向前扫描;
>
> 3. 如果该元素（已排序）大于新元素，将该元素移到下一位置;
>
> 4. 重复步骤 3，直到找到已排序的元素小于或者等于新元素的位置;
>
> 5. 将新元素插入到该位置后;
>
> 6. 重复步骤 2~5。


![](imgs/algorithm_插入排序_动态示意图.gif)

```js
function insertionSort(arr) {
    var len = arr.length;

    for (var i = 1; i < len; i++) {
        // 1. 记录当前要排序的元素
        var current = arr[i];

        // 2. 向前遍历已排序元素, 相邻比较并将比当前元素大的元素向后整体移动
        var preIndex = i - 1;
        while (preIndex >= 0 && arr[preIndex] > current) {
            arr[preIndex + 1] = arr[preIndex];
            //
            preIndex--;
        }

        // 3. 将当前元素, 插入到查找的位置
        arr[preIndex + 1] = current;
    }

    return arr;
}
```

```java
public class Sort {
    /**
     * 插入排序
     * 
     * @param array
     * @return
     */
    public static int[] insertionSort(int[] array) {
        if (array.length == 0)
            return array;

        for (int i = 0; i < array.length - 1; i++) {
            // 1. 记录当前要排序的元素
            int current = array[i + 1];

            // 2. 向前遍历已排序元素, 相邻比较并将比当前元素大的元素向后整体移动
            int preIndex = i;
            while (preIndex >= 0 && current < array[preIndex]) {
                array[preIndex + 1] = array[preIndex];
                preIndex--;
            }

            // 3. 将当前元素, 插入到查找的位置
            array[preIndex + 1] = current;
        }

        return array;
    }
}
```

### 04. 希尔排序 (Shell Sort)

希尔排序, 是 1959年Shell发明，第一个突破O(n2)的排序算法，是简单插入排序的改进版。它与插入排序的不同之处在于，它会优先比较距离较远的元素。希尔排序又叫缩小增量排序。

希尔排序的核心在于间隔序列的设定。既可以提前设定好间隔序列，也可以动态的定义间隔序列。

其, 把记录按下表的一定增量分组，对每组使用直接插入排序算法排序；随着增量逐渐减少，每组包含的关键词越来越多，当增量减至1时，整个文件恰被分成一组，算法便终止。

> 其, 先将整个待排序的记录序列分割成为若干子序列分别进行直接插入排序。
>
> 在此我们选择增量 gap=length/2，缩小增量继续以 gap = gap/2 的方式，这种增量选择我们可以用一个序列来表示，{n/2,(n/2)/2…1}，称为增量序列。
>
> 增量序列的选择与证明是个数学难题，我们选择的这个增量序列是比较常用的，也是希尔建议的增量，称为希尔增量，但其实这个增量序列不是最优的。


> **算法描述**
>
> 1. 选择一个增量序列 t1，t2，…，tk，其中 ti>tj，tk=1;
>
> 2. 按增量序列个数 k，对序列进行 k 趟排序;
>
> 3. 每趟排序，根据对应的增量ti，将待排序列分割成若干长度为 m 的子序列，分别对各子表进行直接插入排序。
> 仅增量因子为 1 时，整个序列作为一个表来处理，表长度即为整个序列的长度。

![](imgs/algorithm_希尔排序_动态示意图.gif)

![](imgs/algorithm_希尔排序_示意图.png)

```js
function shellSort(arr) {
    var len = arr.length;

    for (var gap = Math.floor(len / 2); gap > 0; gap = Math.floor(gap / 2)) {
        // 注意：这里和动图演示的不一样，动图是分组执行，实际操作是多个分组交替执行
        for (var i = gap; i < len; i++) {
            var current = arr[i];

            //
            var preIndex = i;
            while (preIndex - gap >= 0 && current < arr[preIndex - gap]) {
                arr[preIndex] = arr[preIndex - gap];
                preIndex = preIndex - gap;
            }

            arr[preIndex] = current;
        }
    }

    return arr;
}

// Math.floor() 返回, 一个表示小于或等于指定数字的最大整数的数字
```

```java
public class Sort {
    /**
     * 希尔排序
     * 
     * @param array
     * @return
     */
    public static int[] shellSort(int[] array) {
        int len = array.length;
        int gap = len / 2;
        while (gap > 0) {

            for (int i = gap; i < len; i++) {
                int current = array[i];

                int preIndex = i - gap;
                while (preIndex >= 0 && array[preIndex] > current) {
                    array[preIndex + gap] = array[preIndex];
                    preIndex = preIndex - gap;
                }

                array[preIndex + gap] = current;
            }

            gap /= 2;
        }

        return array;
    }
}
```


### 05. 归并排序 (Merge Sort)

归并排序, 其原理是 将已有序的子序列合并，得到完全有序的序列；即先使每个子序列有序，再使子序列段间有序。若将两个有序表合并成一个有序表，称为2-路归并。 

归并排序, 是建立在归并操作上的一种有效的排序算法。该算法是采用分治法（Divide and Conquer）的一个非常典型的应用。

归并排序, 是一种稳定的排序方法。和选择排序一样，归并排序的性能不受输入数据的影响，但表现比选择排序好的多，因为始终都是O(nlogn）的时间复杂度。代价是需要额外的内存空间。


> **算法描述**
>
> 1. 把长度为 n 的输入序列分成两个长度为 n/2 的子序列;
>
> 2. 对这两个子序列分别采用归并排序;
>
> 3. 将两个排序好的子序列合并成一个最终的排序序列。


![](imgs/algorithm_归并排序_动态示意图.gif)

```js
function mergeSort(arr) {
    var len = arr.length;
    if (len < 2) {
        return arr;
    }

    var middle = Math.floor(len / 2);
    var left = arr.slice(0, middle);
    var right = arr.slice(middle);

    return merge(mergeSort(left), mergeSort(right));
}

function merge(left, right) {
    var result = [];

    while (left.length > 0 && right.length > 0) {
        if (left[0] <= right[0]) {
            result.push(left.shift());
        } else {
            result.push(right.shift());
        }
    }

    while (left.length)
        result.push(left.shift());

    while (right.length)
        result.push(right.shift());

    return result;
}
```

```java
public class Sort {
    /**
     * 归并排序
     *
     * @param array
     * @return
     */
    public static int[] mergeSort(int[] array) {
        if (array.length < 2)
            return array;

        int mid = array.length / 2;
        int[] left = Arrays.copyOfRange(array, 0, mid);
        int[] right = Arrays.copyOfRange(array, mid, array.length);

        return merge(mergeSort(left), mergeSort(right));
    }

    /**
     * 归并排序 将两段排序好的数组结合成一个排序数组
     *
     * @param left
     * @param right
     * @return
     */
    public static int[] merge(int[] left, int[] right) {
        int[] result = new int[left.length + right.length];

        for (int index = 0, i = 0, j = 0; index < result.length; index++) {
            //
            if (i >= left.length)
                result[index] = right[j++];
            else if (j >= right.length)
                result[index] = left[i++];
            //
            else if (left[i] > right[j])
                result[index] = right[j++];
            else
                result[index] = left[i++];
        }

        return result;
    }
}
```


### 06. 快速排序 (Quick Sort)

快速排序, 其原理是 通过一趟排序将待排记录分隔成独立的两部分，其中一部分记录的关键字均比另一部分的关键字小，则可分别对这两部分记录继续进行排序，以达到整个序列有序。

其, 使用分治法来把一个串（list）分为两个子串（sub-lists）


> **算法描述**
>
> 1. 从数列中挑出一个元素，称为 “基准”（pivot）;
>
> 2. 重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作;
>
> 3. 递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序。


![](imgs/algorithm_快速排序_动态示意图.gif)

```js
function quickSort(arr, left, right) {
    var len = arr.length;
    var left = typeofleft != 'number' ? 0 : left;
    var right = typeofright != 'number' ? len - 1 : right;

    if (left < right) {
        var partitionIndex = partition(arr, left, right);
        quickSort(arr, left, partitionIndex - 1);
        quickSort(arr, partitionIndex + 1, right);
    }

    return arr;
}

// 分区操作
function partition(arr, left, right) {
    // 设定基准值
    var pivot = left;
    var index = pivot + 1;

    for (vari = index; i <= right; i++) {
        if (arr[i] < arr[pivot]) {
            swap(arr, i, index);
            index++;
        }
    }
    
    swap(arr, pivot, index - 1);
    
    return index - 1;
}

function swap(arr, i, j) {
    var temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}
```

```java
public class Sort {
    /**
     * 快速排序
     * 
     * @param array
     * @param start
     * @param end
     * @return
     */
    public static int[] quickSort(int[] array, int start, int end) {
        if (array.length < 1 || start < 0 || end >= array.length || start > end)
            return null;

        int smallIndex = partition(array, start, end);

        if (smallIndex > start)
            quickSort(array, start, smallIndex - 1);
        if (smallIndex < end)
            quickSort(array, smallIndex + 1, end);

        return array;
    }

    /**
     * 分区
     * 
     * @param array
     * @param start
     * @param end
     * @return
     */
    public static int partition(int[] array, int start, int end) {
        int pivot = (int) (start + Math.random() * (end - start + 1));
        int smallIndex = start - 1;

        swap(array, pivot, end);

        for (int i = start; i <= end; i++)
            if (array[i] <= array[end]) {
                smallIndex++;

                if (i > smallIndex)
                    swap(array, i, smallIndex);
            }

        return smallIndex;
    }

    /**
     * 交换数组内两个元素
     * 
     * @param array
     * @param i
     * @param j
     */
    public static void swap(int[] array, int i, int j) {
        int temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}
```

### 07. 堆排序 (Heap Sort)

堆排序, 是指利用堆这种数据结构所设计的一种排序算法。堆积是一个近似完全二叉树的结构，并同时满足堆积的性质：即子结点的键值或索引总是小于（或者大于）它的父节点。


> **算法描述**
>
> 1. 将初始待排序关键字序列 (R1,R2….Rn) 构建成大顶堆，此堆为初始的无序区;
>
> 2. 将堆顶元素 R[1] 与最后一个元素 R[n] 交换，此时得到新的无序区 (R1,R2,……Rn-1) 和新的有序区 (Rn) ,且满足 R[1,2…n-1]<=R[n] ;
>
> 3. 由于交换后新的堆顶 R[1] 可能违反堆的性质，因此需要对当前无序区 (R1,R2,……Rn-1) 调整为新堆，然后再次将 R[1] 与无序区最后一个元素交换，得到新的无序区(R1,R2….Rn-2) 和新的有序区 (Rn-1,Rn) 。
> 不断重复此过程直到有序区的元素个数为n-1，则整个排序过程完成。


![](imgs/algorithm_堆排序_动态示意图.gif)

```js
var len;    // 因为声明的多个函数都需要数据长度，所以把len设置成为全局变量

// 建立大顶堆
function buildMaxHeap(arr) {
    len = arr.length;
    for (var i = Math.floor(len / 2); i >= 0; i--) {
        heapify(arr, i);
    }
}

// 堆调整
function heapify(arr, i) {
    var left = 2 * i + 1;
    var right = 2 * i + 2;
    var largest = i;

    if (left < len && arr[left] > arr[largest]) {
        largest = left;
    }

    if (right < len && arr[right] > arr[largest]) {
        largest = right;
    }

    if (largest != i) {
        swap(arr, i, largest);
        heapify(arr, largest);
    }
}

function heapSort(arr) {
    buildMaxHeap(arr);
    
    for (var i = arr.length - 1; i > 0; i--) {
        swap(arr, 0, i);
        len--;
        heapify(arr, 0);
    }

    return arr;
}

function swap(arr, i, j) {
    var temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}
```

```java
public class Sort {

    // 声明全局变量，用于记录数组array的长度；
    static int len;

    /**
     * 堆排序
     *
     * @param array
     * @return
     */
    public static int[] heapSort(int[] array) {
        len = array.length;
        if (len < 1)
            return array;

        // 1. 构建一个最大堆
        buildMaxHeap(array);

        // 2. 循环将堆首位（最大值）与末位交换，然后在重新调整最大堆
        while (len > 0) {
            swap(array, 0, len - 1);
            len--;
            adjustHeap(array, 0);
        }
        return array;
    }

    /**
     * 建立最大堆
     *
     * @param array
     */
    public static void buildMaxHeap(int[] array) {
        // 从最后一个非叶子节点开始向上构造最大堆;
        // for循环这样写会更好一点：i的左子树和右子树分别2i+1和2(i+1)
        for (int i = (len / 2 - 1); i >= 0; i--) {
            adjustHeap(array, i);
        }
    }

    /**
     * 调整使之成为最大堆
     *
     * @param array
     * @param i
     */
    public static void adjustHeap(int[] array, int i) {
        int maxIndex = i;

        // 如果有左子树，且左子树大于父节点，则将最大指针指向左子树
        if (i * 2 < len && array[i * 2] > array[maxIndex])
            maxIndex = i * 2 + 1;

        // 如果有右子树，且右子树大于父节点，则将最大指针指向右子树
        if (i * 2 + 1 < len && array[i * 2 + 1] > array[maxIndex])
            maxIndex = i * 2 + 2;

        // 如果父节点不是最大值，则将父节点与最大值交换，并且递归调整与父节点交换的位置。
        if (maxIndex != i) {
            swap(array, maxIndex, i);
            adjustHeap(array, maxIndex);
        }
    }
}
```


### 08. 计数排序 (Counting Sort)

计数排序, 不是基于比较的排序算法，其核心在于将输入的数据值转化为键存储在额外开辟的数组空间中。

其, 作为一种线性时间复杂度的排序，计数排序要求输入的数据必须是有确定范围的整数。

计数排序, 是一个稳定的排序算法。当输入的元素是 n 个 0到 k 之间的整数时，时间复杂度是O(n+k)，空间复杂度也是O(n+k)，其排序速度快于任何比较排序算法。当k不是很大并且序列比较集中时，计数排序是一个很有效的排序算法。


> **算法描述**
>
> 1. 找出待排序的数组中最大和最小的元素;
>
> 2. 统计数组中每个值为i的元素出现的次数，存入数组C的第i项;
>
> 3. 对所有的计数累加(从C中的第一个元素开始，每一项和前一项相加);
>
> 4. 反向填充目标数组：将每个元素i放在新数组的第C(i)项，每放一个元素就将C(i)减去1。


![](imgs/algorithm_计数排序_动态示意图.gif)

```js
function countingSort(arr, maxValue) {
    var bucket = newArray(maxValue + 1);
    var sortedIndex = 0;

    var arrLen = arr.length;
    var bucketLen = maxValue + 1;

    for (var i = 0; i < arrLen; i++) {
        if (!bucket[arr[i]]) {
            bucket[arr[i]] = 0;
        }
        bucket[arr[i]]++;
    }

    for (var j = 0; j < bucketLen; j++) {
        while (bucket[j] > 0) {
            arr[sortedIndex++] = j;
            bucket[j]--;
        }
    }

    return arr;
}
```

```java
public class Sort {
    /**
     * 计数排序
     *
     * @param array
     * @return
     */
    public static int[] CountingSort(int[] array) {
        if (array.length == 0)
            return array;

        int min = array[0], max = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] > max)
                max = array[i];
            if (array[i] < min)
                min = array[i];
        }

        int bias = 0 - min;
        int[] bucket = new int[max - min + 1];
        Arrays.fill(bucket, 0);

        for (int i = 0; i < array.length; i++) {
            bucket[array[i] + bias]++;
        }

        int index = 0, i = 0;
        while (index < array.length) {
            if (bucket[i] != 0) {
                array[index] = i - bias;
                bucket[i]--;
                index++;
            } else
                i++;
        }

        return array;
    }
}
```


### 09. 桶排序 (Bucket Sort)

桶排序, 其原理是 假设输入数据服从均匀分布，将数据分到有限数量的桶里，每个桶再分别排序（有可能再使用别的排序算法或是以递归方式继续使用桶排序进行排）。

桶排序, 是计数排序的升级版。其, 利用了函数的映射关系，高效与否的关键就在于这个映射函数的确定。

其, 最好情况下使用线性时间O(n)，桶排序的时间复杂度，取决与对各个桶之间数据进行排序的时间复杂度，因为其它部分的时间复杂度都为O(n)。很显然，桶划分的越小，各个桶之间的数据越少，排序所用的时间也会越少。但相应的空间消耗就会增大。 


> **算法描述**
>
> 1. 设置一个定量的数组当作空桶;
>
> 2. 遍历输入数据，并且把数据一个一个放到对应的桶里去;
>
> 3. 对每个不是空的桶进行排序;
>
> 4. 从不是空的桶里把排好序的数据拼接起来。 


![](imgs/algorithm_桶排序_示意图.png)

```js
function bucketSort(arr, bucketSize) {
    if (arr.length === 0) {
        return arr;
    }

    var minValue = arr[0];
    var maxValue = arr[0];
    for (var i = 1; i < arr.length; i++) {
        if (arr[i] < minValue) {
            minValue = arr[i];                // 输入数据的最小值
        } else if (arr[i] > maxValue) {
            maxValue = arr[i];                // 输入数据的最大值
        }
    }

    // 桶的初始化
    var DEFAULT_BUCKET_SIZE = 5;            // 设置桶的默认数量为5
    bucketSize = bucketSize || DEFAULT_BUCKET_SIZE;
    var bucketCount = Math.floor((maxValue - minValue) / bucketSize) + 1;
    var buckets = newArray(bucketCount);

    for (var i = 0; i < buckets.length; i++) {
        buckets[i] = [];
    }

    // 利用映射函数将数据分配到各个桶中
    for (var i = 0; i < arr.length; i++) {
        buckets[Math.floor((arr[i] - minValue) / bucketSize)].push(arr[i]);
    }

    arr.length = 0;
    for (var i = 0; i < buckets.length; i++) {
        insertionSort(buckets[i]);                      // 对每个桶进行排序，这里使用了插入排序
        for (var j = 0; j < buckets[i].length; j++) {
            arr.push(buckets[i][j]);
        }
    }

    return arr;
}
```

```java
public class Sort {
    /**
     * 桶排序
     *
     * @param array
     * @param bucketSize
     * @return
     */
    public static ArrayList<Integer> BucketSort(ArrayList<Integer> array, int bucketSize) {
        if (array == null || array.size() < 2)
            return array;

        int max = array.get(0), min = array.get(0);
        // 找到最大值最小值
        for (int i = 0; i < array.size(); i++) {
            if (array.get(i) > max)
                max = array.get(i);
            if (array.get(i) < min)
                min = array.get(i);
        }

        int bucketCount = (max - min) / bucketSize + 1;
        ArrayList<ArrayList<Integer>> bucketArr = new ArrayList<>(bucketCount);
        ArrayList<Integer> resultArr = new ArrayList<>();
        for (int i = 0; i < bucketCount; i++) {
            bucketArr.add(new ArrayList<Integer>());
        }

        for (int i = 0; i < array.size(); i++) {
            bucketArr.get((array.get(i) - min) / bucketSize).add(array.get(i));
        }

        for (int i = 0; i < bucketCount; i++) {
            if (bucketSize == 1) { // 如果带排序数组中有重复数字时
                for (int j = 0; j < bucketArr.get(i).size(); j++)
                    resultArr.add(bucketArr.get(i).get(j));
            } else {
                if (bucketCount == 1)
                    bucketSize--;
                ArrayList<Integer> temp = BucketSort(bucketArr.get(i), bucketSize);
                for (int j = 0; j < temp.size(); j++)
                    resultArr.add(temp.get(j));
            }
        }

        return resultArr;
    }
}
```


### 10. 基数排序 (Radix Sort)

基数排序, 其原理是 按照低位先排序，然后收集；再按照高位排序，然后再收集；依次类推，直到最高位。有时候有些属性是有优先级顺序的，先按低优先级排序，再按高优先级排序。最后的次序就是高优先级高的在前，高优先级相同的低优先级高的在前。

基数排序, 其 基于分别排序，分别收集，所以是稳定的。

基数排序的性能比桶排序要略差，每一次关键字的桶分配都需要O(n)的时间复杂度，而且分配之后得到新的关键字序列又需要O(n)的时间复杂度。假如待排数据可以分为d个关键字，则基数排序的时间复杂度将是O(d*2n) ，当然d要远远小于n，因此基本上还是线性级别的。

其, 空间复杂度为O(n+k)，其中k为桶的数量。一般来说n>>k，因此额外空间需要大概n个左右。


> **算法描述**
>
> 1. 取得数组中的最大数，并取得位数;
>
> 2. arr为原始数组，从最低位开始取每个位组成radix数组;
>
> 3. 对radix进行计数排序（利用计数排序适用于小范围数的特点）。


![](imgs/algorithm_基数排序_动态示意图.gif)

```js
var counter = [];

function radixSort(arr, maxDigit) {
    var mod = 10;
    var dev = 1;

    for (var i = 0; i < maxDigit; i++ , dev *= 10, mod *= 10) {
        for (var j = 0; j < arr.length; j++) {
            var bucket = parseInt((arr[j] % mod) / dev);
            if (counter[bucket] == null) {
                counter[bucket] = [];
            }
            counter[bucket].push(arr[j]);
        }

        var pos = 0;
        for (var j = 0; j < counter.length; j++) {
            var value = null;
            if (counter[j] != null) {
                while ((value = counter[j].shift()) != null) {
                    arr[pos++] = value;
                }
            }
        }
    }

    return arr;
}
```

```java
public class Sort {
    /**
     * 基数排序
     * 
     * @param array
     * @return
     */
    public static int[] RadixSort(int[] array) {
        if (array == null || array.length < 2)
            return array;

        // 1.先算出最大数的位数
        int max = array[0];
        for (int i = 1; i < array.length; i++) {
            max = Math.max(max, array[i]);
        }

        int maxDigit = 0;
        while (max != 0) {
            max /= 10;
            maxDigit++;
        }

        int mod = 10, div = 1;
        ArrayList<ArrayList<Integer>> bucketList = new ArrayList<ArrayList<Integer>>();
        for (int i = 0; i < 10; i++)
            bucketList.add(new ArrayList<Integer>());

        for (int i = 0; i < maxDigit; i++, mod *= 10, div *= 10) {
            for (int j = 0; j < array.length; j++) {
                int num = (array[j] % mod) / div;
                bucketList.get(num).add(array[j]);
            }
            int index = 0;
            for (int j = 0; j < bucketList.size(); j++) {
                for (int k = 0; k < bucketList.get(j).size(); k++)
                    array[index++] = bucketList.get(j).get(k);
                bucketList.get(j).clear();
            }
        }

        return array;
    }
}
```
