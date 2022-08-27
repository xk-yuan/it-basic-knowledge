# JVM

> 

## 学习思路 - 结合《如何阅读一本书 @ 郝明义 202103》

- 检视阅读

1. 主题概括及分类

  - 通过快速阅读, 封面, 书名, 扉页, 提要, 索引页,  荐序, 序言, 前言, 后记, 等页面 用简短话语概括处主旨及分类

2. 脉络纲要

  - 通过阅读分析 目录也 及 快速阅读 章节, 对基础架构做概括性的理解, 并划分出纲要和各部分重点, 了解那部分时重点及层级

3. 正文摘要

  - 在快速通读及跳读的过程中, 抓住并记录 重点关键词及关键句子, 段落等; 并随手记录下疑问和理解笔记
  - 划底线, 对重点句子和词划出底线
  - 圈重点, 对重点关键词以圈出来
  - 空白处做笔记, 在空白处记录疑问或相应理解和想法

- 分析阅读

- 主题阅读

## 资源

> <Java 虚拟机规范 SE7 @ 周志明 201107>
> <Java 虚拟机规范 SE8 @ 周志明 201505>

> <深入理解 Java虚拟机 第二版 @ 周志明 201306>

> <Java 语言规范 SE8 @ 陈昊鹏 201601>

> <大话JAVA性能优化 @ 周明耀 201604>

> <深入理解 JVM & G1 GC @ 周明耀 201706>

> <Java 性能调优指南 @ 李源 201704>

## 简介

### JAVA进程查看

> jps 

> ps aux | grep java

### java jvm 命令

> java -version

java version "1.8.0_181"
Java(TM) SE Runtime Environment (build 1.8.0_181-b13)
Java HotSpot(TM) 64-Bit Server VM (build 25.181-b13, mixed mode)

### GC 查看

> jstat -gc {PID} # 实时gc

```sh
[root@java ~]# jstat -gc 19703
 S0C    S1C    S0U    S1U      EC       EU        OC         OU       MC     MU    CCSC   CCSU   YGC     YGCT    FGC    FGCT     GCT   
42496.0 87040.0 42485.1  0.0   3697664.0 3481163.6 2796544.0   62699.2   85080.0 79394.2 10880.0 9885.8     14    0.618   3      0.281    0.899

> jstat -gc {PID} 1000 10 # 间隔1s，打印10s

```

### 线程栈查看

> jstack {PID}

```sh
[root@java ~]# jstack 19703
Full thread dump Java HotSpot(TM) 64-Bit Server VM (25.181-b13 mixed mode):

"Keep-Alive-Timer" #1885 daemon prio=8 os_prio=0 tid=0x00007f892801f000 nid=0x47a1 waiting on condition [0x00007f882dfa3000]
   java.lang.Thread.State: TIMED_WAITING (sleeping)
	at java.lang.Thread.sleep(Native Method)
	at sun.net.www.http.KeepAliveCache.run(KeepAliveCache.java:172)
	at java.lang.Thread.run(Thread.java:748)

...

"commons-pool-evictor-thread" #1095 daemon prio=5 os_prio=0 tid=0x00007f8a81d9e000 nid=0x5192 waiting on condition [0x00007f8a0816b000]
   java.lang.Thread.State: TIMED_WAITING (parking)
	at sun.misc.Unsafe.park(Native Method)
	- parking to wait for  <0x00000004c13e1148> (a java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject)
	at java.util.concurrent.locks.LockSupport.parkNanos(LockSupport.java:215)
	at java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject.awaitNanos(AbstractQueuedSynchronizer.java:2078)
	at java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(ScheduledThreadPoolExecutor.java:1093)
	at java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(ScheduledThreadPoolExecutor.java:809)
	at java.util.concurrent.ThreadPoolExecutor.getTask(ThreadPoolExecutor.java:1074)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1134)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at java.lang.Thread.run(Thread.java:748)

"Log4j2-TF-5-Scheduled-4" #25 daemon prio=5 os_prio=0 tid=0x00007f8a807ac800 nid=0x4d2a waiting on condition [0x00007f89ca703000]
   java.lang.Thread.State: TIMED_WAITING (parking)
	at sun.misc.Unsafe.park(Native Method)
	- parking to wait for  <0x00000004c0aaadc0> (a java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject)
	at java.util.concurrent.locks.LockSupport.parkNanos(LockSupport.java:215)
	at java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject.awaitNanos(AbstractQueuedSynchronizer.java:2078)
	at java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(ScheduledThreadPoolExecutor.java:1093)
	at java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(ScheduledThreadPoolExecutor.java:809)
	at java.util.concurrent.ThreadPoolExecutor.getTask(ThreadPoolExecutor.java:1074)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1134)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at java.lang.Thread.run(Thread.java:748)

"Service Thread" #17 daemon prio=9 os_prio=0 tid=0x00007f8a802d6000 nid=0x4d16 runnable [0x0000000000000000]
   java.lang.Thread.State: RUNNABLE

...

"Signal Dispatcher" #4 daemon prio=9 os_prio=0 tid=0x00007f8a802b1000 nid=0x4d09 runnable [0x0000000000000000]
   java.lang.Thread.State: RUNNABLE

"Finalizer" #3 daemon prio=8 os_prio=0 tid=0x00007f8a8027e000 nid=0x4d08 in Object.wait() [0x00007f8a1c1d8000]
   java.lang.Thread.State: WAITING (on object monitor)
	at java.lang.Object.wait(Native Method)
	at java.lang.ref.ReferenceQueue.remove(ReferenceQueue.java:144)
	- locked <0x00000004c001bb88> (a java.lang.ref.ReferenceQueue$Lock)
	at java.lang.ref.ReferenceQueue.remove(ReferenceQueue.java:165)
	at java.lang.ref.Finalizer$FinalizerThread.run(Finalizer.java:216)

"Reference Handler" #2 daemon prio=10 os_prio=0 tid=0x00007f8a8027b800 nid=0x4d07 in Object.wait() [0x00007f8a1c2d9000]
   java.lang.Thread.State: WAITING (on object monitor)
	at java.lang.Object.wait(Native Method)
	at java.lang.Object.wait(Object.java:502)
	at java.lang.ref.Reference.tryHandlePending(Reference.java:191)
	- locked <0x00000004c0031d08> (a java.lang.ref.Reference$Lock)
	at java.lang.ref.Reference$ReferenceHandler.run(Reference.java:153)

"VM Thread" os_prio=0 tid=0x00007f8a80271800 nid=0x4d06 runnable 

"GC task thread#0 (ParallelGC)" os_prio=0 tid=0x00007f8a8001e800 nid=0x4cf9 runnable 

...

"VM Periodic Task Thread" os_prio=0 tid=0x00007f8a802db000 nid=0x4d17 waiting on condition 

JNI global references: 2475
```

### DUMP 分析

> jmap -dump:live,format=b,file=app.bin {PID} # 生成dump文件

> jhat -J-mx512m app.bin                      # jhat启动分析web服务

```sh
[root@java ~]# jmap -dump:live,format=b,file=apigwsvc.bin 19703

[root@java ~]# jhat -J-mx512m apigwsvc.bin  # 访问 http://localhost:7000
Reading from apigwsvc.bin...
Dump file created Mon Sep 06 14:10:40 CST 2021
Snapshot read, resolving...
Resolving 973104 objects...
Chasing references, expect 194 dots..................................................................................................................................................................................................
Eliminating duplicate references..................................................................................................................................................................................................
Snapshot resolved.
Started HTTP server on port 7000
Server is ready.
```

### jvisualvm 可视化工具


### Java Thread Dumps

thread dumps 线程转储, 用来帮助 判断 CPU 峰值、死锁、内存异常、应用反应迟钝、响应时间变长和其他系统问题。

其，主要保存的是java应用中各线程在某一时刻的运行的位置，即执行到哪一个类的哪一个方法哪一个行上。

单个的thread dump文件一般来说是没有什么用处的，因为它只是记录了某一个绝对时间点的情况。比较有用的是，线程在一个时间段内的执行情况。

1. jstack

是一个抓取 thread dump 文件的有效的命令行工具，它位于 JDK 目录里的 bin 文件夹下（JDK_HOME\bin）

jstack -l  <pid> > <file-path>

2. kill -3

kill -3 <pid> # 当使用 kill -3 生成 dump 文件时，dump 文件会被输出到标准错误流。


## 故障排查过程

### linux 系统排查, java cpu 占用高问题

jstat -gcutil {PID} 1s  # 每隔1秒打印GC

jmap -heap PID}


1.  top -p {PID} -H

2. 抓取 DUMP

```sh  java-dump.sh  PID
#!/bin/sh
PID=$1
DATE_DIR=`date "+%Y%m%d%H%M"`
mkdir $DATE_DIR

jstack $PID > $DATE_DIR/jstack-$PID.dump 2>&1
jinfo  $PID > $DATE_DIR/jinfo-$PID.dump 2>&1
jstat -gcutil $PID > $DATE_DIR/jstat-gcutil-$PID.dump 2>&1
jstat -gccapacity $PID > $DATE_DIR/jstat-gccapacity-$PID.dump 2>&1
jmap $PID > $DATE_DIR/jmap-$PID.dump 2>&1
jmap -heap $PID > $DATE_DIR/jmap-heap-$PID.dump 2>&1
jmap -histo $PID > $DATE_DIR/jmap-histo-$PID.dump 2>&1
```


Q: tomcat jvm 大量线程waiting on condition，如何解决？[](https://www.imooc.com/wenda/detail/553088)



