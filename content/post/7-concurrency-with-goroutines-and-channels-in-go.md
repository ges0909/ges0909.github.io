+++
weight = 7
date = "2016-01-07T00:00:00+01:00"
tags = ["go"]
title = "Concurrency with Goroutines and Channels in Go"

+++

_Go_ has inbuilt primitives for concurrency called _Goroutines_ and _Channels_.

<!--more-->

### Goroutines

A _Goroutine_ is a function (or: method, closure) running concurrently with other
groutines in the same address space.[^1] Goroutines may be thought as a _Unix_
command running in background with `&`.

_Goroutines are a bit like threads, but they are are much cheaper_[^2]. _It is
practical to create hundreds of thousands of goroutines._[^3] They are multiplexed
by the Go runtime onto multiple OS threads so if one should block, e.g. while
waiting for I/O, others continue to run.

Prefix a function call with the **go** keyword to run it in a new goroutine. When
the call completes, the goroutine exits, silently.
<a target="_blank" href="http://play.golang.org/p/aPgFvX4az7"><button class="playground">Go</button></a>

~~~go
func writer() {
	fmt.Println("function")
}
go writer() // function
go func() { // closure
	fmt.Println("closure")
}()
~~~

### Channels

Goroutines exchange values through _channels_. Channels may be thought as a
_Unix_ pipe, except the data are **typed values** and not an unstructured
stream of bytes (type-safe communication).

The sending goroutine blocks until the receiving goroutine has taken the value.
If both communicate through a buffered channel the same is true when the buffer
is full. Thefore channels synchronize running goroutines also.

A channel is allocated with the **make** keyword.

<a target="_blank" href="http://play.golang.org/p/Brd0bxSeOn"><button class="playground">Go</button></a>

~~~go
func writer(ch chan int) {
	for i := 1; i <= 10; i++ {
		ch <- i
	}
	close(ch)
}
ch := make(chan int)
go writer(ch)
go func() { // reader
	n, more := <-ch
	for more {
		fmt.Println(n)
		n, more = <-ch
	}
}()
~~~

For advanced concurrency patterns see [Go Concurrency Patterns: Pipelines and cancellation](https://blog.golang.org/pipelines).

[^1]: [Effective Go](https://golang.org/doc/effective_go.html#goroutines)
[^2]: [Goroutines are not threads](http://talks.golang.org/2012/waza.slide#32)
[^3]: [Frequently Asked Questions (FAQ)](https://golang.org/doc/faq#goroutines)

