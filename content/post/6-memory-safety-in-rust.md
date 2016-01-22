+++
weight = 6
date = "2016-01-05T00:00:00+01:00"
tags = ["rust"]
title = "Memory Safety in Rust"

+++

**Ownership**, **borrowing** and **lifetime** are the key concepts to
reach memory safety of programs. They are the selling points making _Rust_
unique to similiar programming languages like C/C++.

<!--more-->

Memory safety is enforced by language design to allow the detection of memory
problems at compile time (_borrow-checking_), which is the least expensive way
to identify and fix bugs.

The problems to be addressed by borrow-checking are:

- pointers used after freed memory (dangling pointers)
- _data races_ when two or more pointers access the same memory location at
the same time, where at least one of them is writing, and the operations are
not synchronized like iterating via a collection and removing or adding an
element (iterator invalidation)
- others ...

### Stack and heap

_Rust_ divides the program memory like other programmming languages in stack and
heap. While the stack is of limited size, the heap can grow as needed.

Primitive values are stored on the stack, while values of complex types are
stored on the heap. Heap values are referenced by variables on the stack.

In the variable binding (`let`)
~~~rust
let v: Vec<i32> = vec![1, 2, 3];
~~~
the variable `v` is a stack-allocated reference (pointer) to a
heap-allocated vector (`Vec<i32>`).
<a target="_blank" href="http://is.gd/RbCiss"><button class="playground">Rust</button></a>

### Immutable and mutable variables

In _Rust_ variables are by default **immutable**.
<a target="_blank" href="http://is.gd/Ulm9Cz"><button class="playground">Rust</button></a>

~~~rust
let v = vec![1, 2, 3];
v.push(4); // error: cannot borrow immutable local variable `v` as mutable
~~~

If you want to change the value of a variable, it must be declared explictly as
**mutable** with the keyword _mut_.
<a target="_blank" href="http://is.gd/LxevV5"><button class="playground">Rust</button></a>

~~~rust
let mut v2 = vec![1, 2, 3];
v2.push(4);
~~~

### Ownership

A variable binding has the _ownership_ [^1] of what it is bound to.

There can be only **one** owner at a time, which is **enforced** by the compiler.

Only the owner can change the object it points to.

When the owner goes out of scope, _Rust_ will clean up everything: in our example
the reference on the stack and the vector on the heap.

The owner can _move_ its ownership to another variable.
<a target="_blank" href="http://is.gd/gg0f9R"><button class="playground">Rust</button></a>

~~~rust
let v = vec![1, 2, 3];
let v2 = v; // move ownership to 'v2'
println!("{:?}", v); // error: use of moved value: `v`
~~~

If the ownerhship is moved to another variable the original owner can **not**
access the referenced value anymore.

The ownership is also moved when a variable is passed as argument to a function.
<a target="_blank" href="http://is.gd/W4wxCM"><button class="playground">Rust</button></a>

~~~rust
fn do_something(w: Vec<i32>) {
    println!("{:?}", w);
}
let v = vec![1, 2, 3];
do_something(v);
println!("{:?}", v); // use of moved value: `v`
~~~

With the _move_ semantic the reponsibility for freeing the memory is always
clear when going ot of scope.

Other languages use _garbage collection_ (Java) or left the problem to the
programmer (C/C++).

### Borrowing

_Borrowing_ [^2] deals with **references** (or pointers). Instead of taking over
the ownership like variables a reference _borrows_ the ownership only.
<a target="_blank" href="http://is.gd/PvdSRO"><button class="playground">Rust</button></a>

~~~rust
let v = vec![1, 2, 3];
let v2 = &v; // 'v2' borrows ownership of 'v'
println!("{:?}", v);
~~~

A binding that borrows something does not deallocate the resource when it goes
out of scope. This is left to the owner and enforced by the compiler.

Consequently any borrow must last for a scope no greater than that of the owner.

You may have as many references as you like, since **none** of them is writing.

If you are writing, you may have two or more references to the same memory, but
only **one** must be _mutable_ at the time.

And: If you have one mutable reference (`&mut`) you may **not** have any other
references to the same resource in the **same** scope.

The following example produces a compile error, because the parameter `v` of
the `println!` function (the truth is it is a macro with a function call behind)
is bound to an immutable reference.
<a target="_blank" href="http://is.gd/mHW1w5"><button class="playground">Rust</button></a>

~~~rust
let mut v = vec![1, 2, 3];
let v2 = &mut v; // mutable reference
v2.push(4);
println!("{:?}", v); // error: cannot borrow `v` as immutable because it is also borrowed as mutable
~~~
To ensure the _Rust_ rules the mutable reference `v2` must be scoped.
<a target="_blank" href="http://is.gd/4sacPk"><button class="playground">Rust</button></a>

~~~rust
let mut v = vec![1, 2, 3];
{
    let v2 = &mut v; // mutable reference
    v2.push(4);
}
println!("{:?}", v); // prints [1, 2, 3, 4]
~~~
Therefore _Rust_ requires a strong thinking in scopes.

<!--
You may have one or the other of these two kinds of borrows, but not both at
the same time:

- one or more references (`&T`) to a resource
- exactly one mutable reference (`&mut T`)
-->

### Lifetimes

A lifetime [^3] describes the scope that a reference is valid for.

The compiler inserts lifetime annotations implicitly to detect "use after free"
situations. Technically, every reference has a lifetime associated with it, but
the compiler allows you to omit it in common cases (_Lifetime Elision_).

In some cases the lifetime must be specified explictly.
<a target="_blank" href="http://is.gd/fMetHV"><button class="playground">Rust</button></a>

~~~rust
struct Person {
    age: &u32, // error: missing lifetime specifier
}
let a = 99u32;
let p = Person { age: &a };
~~~

With `<‘x>` we say that there is a lifetime named `x`. With `&'x` we say that the
reference `age` must have a lifetime of `x` or less. It is common to use single
letters to represent lifetimes, but you could use anything you want, e.g. also
`'life`.
<a target="_blank" href="http://is.gd/mBAJ82"><button class="playground">Rust</button></a>

~~~rust
struct Person<'x> {
    age: &'x u32,
}
let a = 99u32;
let p = Person { age: &a };
~~~

<a target="_blank" href="http://is.gd/H1J5od"><button class="playground">Rust</button></a>

~~~rust
struct Person<'x> {
    age: &'x u32,
}
let p;
{
    let a = 99u32;
    p = Person { age: &a }; // error: `a` does not live long enough
}
~~~

### Points left open

- copy trait

[^1]: [Ownership](https://doc.rust-lang.org/book/ownership.html)
[^2]: [References and Borrowing](https://doc.rust-lang.org/book/references-and-borrowing.html)
[^3]: [Lifetimes](https://doc.rust-lang.org/book/lifetimes.html)
