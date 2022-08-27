# Lambda Stream

> lambda表达式 和 流计算

## 资源

> [Java 8之流式计算](https://blog.csdn.net/qq_42013590/article/details/103088406)

> [](https://www.cnblogs.com/xxbiao/p/12048946.html)

## 简介


### 1. 流计算与函数接口

Java 8 引入了流式操作（Stream），通过该操作可以实现对集合（Collection）的并行处理和函数式操作。使用java.util.stream包中的Stream接口即可完成SQL中的计算、order by、where等操作。

根据操作返回的结果不同，流式操作分为中间操作和最终操作两种。最终操作返回一特定类型的结果，而中间操作返回流本身，这样就可以将多个操作依次串联起来。根据流的并发性，流又可以分为串行和并行两种。流式操作实现了集合的过滤、排序、映射等功能。

大部分函数式接口都不用我们自己写，Java 8都给我们写好了，这些接口都在java.util.function包里。主要包括四大函数式接口，分别是Function函数接口、Predicate函数式接口、Consumer函数式接口和Supplier函数式接口。

1. Function函数接口

Function接口为函数型接口，该接口的抽象方法接收一个参数并且做一些处理然后返回返回一个参数。其中T为接收参数类型，R为返回参数类型。

```java java.util.function.Function
@FunctionalInterface
interface Function<T, R>

- R apply(T t);
- default <V> Function<V, R> compose(Function<? super V, ? extends T> before)
- default <V> Function<T, V> andThen(Function<? super R, ? extends V> after)
- static <T> Function<T, T> identity()
```

2. Predicate函数式接口

Predicate 用于做判断操作，所以抽象方法返回的是Boolean。

```java java.util.function.Predicate
@FunctionalInterface
interface Predicate<T>

- boolean test(T t);
- default Predicate<T> and(Predicate<? super T> other)
- default Predicate<T> negate()
- default Predicate<T> or(Predicate<? super T> other)
- static <T> Predicate<T> isEqual(Object targetRef)
```

3. Consumer消费型函数式接口

Consumer 表示执行在单个参数上面的操作，但没有返回值。

```java java.util.function.Consumer
@FunctionalInterface
interface Consumer<T>

- void accept(T t);
- default Consumer<T> andThen(Consumer<? super T> after)
```

4. Supplier供给型函数式接口

Supplier 接口不接受任何参数，返回一个任意泛型的值。

```java java.util.function.Supplier
@FunctionalInterface
interface Supplier<T>

- T get();
```


### 2. Stream 描述

A sequence of elements supporting sequential and parallel aggregate operations. To perform a computation, stream operations are composed into a stream pipeline.

支持顺序和并行聚合操作的元素序列。为了执行计算，将流操作组合到流管道中。

A stream pipeline consists of a source (which might be an array, a collection, a generator function, an I/O channel, etc), zero or more intermediate operations (which stream into another stream, such astransform a Stream#filter(Predicate) , and a terminal operation (which produces a result or side-effect, such as Stream#count() or Stream#forEach(Consumer)。

流管道由一个源（可能是数组、集合、生成器函数、I/O通道等）、零个或多个中间操作（流到另一个流中，如转换为 Stream#filter(Predicate) ）和终端操作（产生结果或副作用，如 Stream#count() 或Stream#forEach(Consumer)。

Streams are lazy; computation on the source data is only performed when the terminal operation is initiated, and source elements are consumed only as needed.

流是懒惰的；仅当终端操作启动时才对源数据执行计算，并且仅在需要时使用源元素。

Collections and streams, while bearing some superficial similarities, have different goals.  Collections are primarily concerned with the efficient management of, and access to, their elements. 

集合和流虽然表面上有一些相似之处，但目标不同。集合主要涉及对其元素的有效管理和访问。

By contrast, streams do not provide a means to directly access or manipulate their elements, and are instead concerned with declaratively describing their source and the computational operations which will be performed in aggregate on that source.

相反，流不提供直接访问或操作其元素的方法，而是以声明方式描述其源以及将在该源上聚合执行的计算操作。

However, if the provided stream operations do not offer the desired functionality, the {@link #iterator()} and {@link #spliterator()} operations can be used to perform a controlled traversal.

但是，如果提供的流操作不提供所需的功能，则可以使用#iterator()和#spliterator()操作来执行受控遍历。

A stream should be operated on (invoking an intermediate or terminal stream operation) only once.

流只能操作一次（调用中间或终端流操作）。

### 3. java.util.stream.Stream

```java
interface Stream<T> extends BaseStream<T, Stream<T>>

- Stream<T> filter(Predicate<? super T> predicate);
- <R> Stream<R> map(Function<? super T, ? extends R> mapper);
- IntStream mapToInt(ToIntFunction<? super T> mapper);
- LongStream mapToLong(ToLongFunction<? super T> mapper);
- DoubleStream mapToDouble(ToDoubleFunction<? super T> mapper);
- <R> Stream<R> flatMap(Function<? super T, ? extends Stream<? extends R>> mapper);
- IntStream flatMapToInt(Function<? super T, ? extends IntStream> mapper);
- LongStream flatMapToLong(Function<? super T, ? extends LongStream> mapper);
- DoubleStream flatMapToDouble(Function<? super T, ? extends DoubleStream> mapper);
- Stream<T> distinct();
- Stream<T> sorted();
- Stream<T> sorted(Comparator<? super T> comparator);
- Stream<T> peek(Consumer<? super T> action);
- Stream<T> limit(long maxSize);
- Stream<T> skip(long n);
- void forEach(Consumer<? super T> action);
- void forEachOrdered(Consumer<? super T> action);
- Object[] toArray();
- <A> A[] toArray(IntFunction<A[]> generator);
- T reduce(T identity, BinaryOperator<T> accumulator);
- Optional<T> reduce(BinaryOperator<T> accumulator);
- <U> U reduce(U identity, BiFunction<U, ? super T, U> accumulator, BinaryOperator<U> combiner);
- <R> R collect(Supplier<R> supplier, BiConsumer<R, ? super T> accumulator, BiConsumer<R, R> combiner);
- <R, A> R collect(Collector<? super T, A, R> collector);
- Optional<T> min(Comparator<? super T> comparator);
- Optional<T> max(Comparator<? super T> comparator);
- long count();
- boolean anyMatch(Predicate<? super T> predicate);
- boolean allMatch(Predicate<? super T> predicate);
- boolean noneMatch(Predicate<? super T> predicate);
- Optional<T> findFirst();
- Optional<T> findAny();
- static<T> Builder<T> builder()
- static<T> Stream<T> empty()
- static<T> Stream<T> of(T t)
- static<T> Stream<T> of(T... values)
- static<T> Stream<T> iterate(final T seed, final UnaryOperator<T> f)
- static<T> Stream<T> generate(Supplier<T> s)
- static <T> Stream<T> concat(Stream<? extends T> a, Stream<? extends T> b)


- interface Builder<T> extends Consumer<T>
- void accept(T t)
- Builder<T> add(T t)
- Stream<T> build()
```

### 4. 常用流操作

- 筛选 (过滤, 提取字段)
- 排序
- 匹配
- 


