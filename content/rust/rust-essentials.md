+++
weight = 99
date = "2016-01-19T13:29:41+01:00"
tags = ["rust"]
title = "Rust Essentials"
url = "rust"

+++

Excerpts from the book [Rust Essentials: Discover how to use Rust to write fast, secure, and concurrent systems and applications](https://www.packtpub.com/application-development/rust-essentials).

<!--more-->

# 1 Starting with Rust

## Working with Cargo

~~~bash
cargo new <libname>       # create a new lib crate
cargo new <binname> --bin # create new binary crate
~~~
~~~
+-- Cargo.toml
|
+-- src
    |
    +-- main.rs
~~~

##### Cargo.toml

~~~toml
[package]
name = "libname"
version = "0.1.0"
authors = ["your name <you@example.com>"]
~~~

To build a binary add:

~~~toml
[[bin]]
name = "progname"
~~~

##### Build

~~~bash
cargo build
~~~
~~~
+-- Cargo.lock
|-- Cargo.toml
|
+-- src
|   |
|   +-- main.rs
|
+-- taget
    |
    +-- build
    |
    +-- deps
    |
    +-- examples
    |
    +-- native
    |
    +-- progname
~~~

##### Cargo.lock

Freezes packages the project depends on to ensure a repeatable build process.

##### Other cargo commands

~~~bash
cargo run
cargo test
cargo update              # update and build depending packages
cargo update -p log
~~~

## The developer tools

Central crates repository: [The Rust community’s crate host](https://crates.io).

## Other tools

- Eclipse Plugin: _RustDT_

# 2 Using Variables and Types

To be added.

# 3 Using Functions and Control Structures

To be added.

# 4 Structering Data and Matching Patterns

## Result and Option

A `Result` is a special kind of `enum` that is defined in the standard library.
It is used as type for return values and can either be `Ok` (success) or `Err`
(failed).

~~~rust
enum Result<T, E> {
  Ok(T),
  Err(E),
}
~~~

The `T` and `E` are type parameters and the term `<T, E>` introduces a _Generic_.
They are placeholders for concrete types to be filled in by the compiler.
<a target="_blank" href="http://is.gd/LgYMya"><button class="playground">Run</button></a>

~~~rust
fn myfunc(n: isize) -> Result<isize, String> {
    if n % 2 == 0 {
        return Result::Ok(n);
    }
    Result::Err(format!("odd number {}", n))
}
let r = match myfunc(2) {
    Ok(num) => num,
    Err(msg) => panic!(msg),
};
println!("{}", r);
~~~

Matching `Result<T, E>` is such a common pattern, so that there is a method
`Result::unwrap` in the standard library doing this.
<a target="_blank" href="http://is.gd/neJFUd"><button class="playground">Run</button></a>

~~~rust
let r = myfunc(4);
println!("{}", r.unwrap()); // unwrap() is doing the match
let r = myfunc(3);
println!("{}", r.unwrap()); // unwrap() and panic
~~~

# 5 Generalizing Code with High-order Functions and Parametrization

## High-order functions and Closures

~~~rust
fn triples(s: i32) -> i32 {
  3 * s
}
fn again<F: Fn(i32) -> i32>(f: F, s: i32) -> i32 {
  f(f(s))
}
r = again(triples, 2)       // high-order
r = again(|n| { 3 * n}, 2)  // closure
~~~

<a target="_blank" href="http://is.gd/ZWMyhv"><button class="playground">Run</button></a>

# 6 Pointers and Memory Safety

# 7 Organizing Code and Macros

## Building crates

Crates are compilation units to be distributed.

~~~bash
rustc --crate-type=lib structs.rs                       # creates libstructs.rlib
rustc --crate-type=lib --crate-name=mycrate structs.rs  # creates libmycrate.rlib
~~~

The same may be reached in source code with attributes:

~~~rust
#![crate_type = "lib"] // bin, lib, rlib, dylib, staticlib
#![crate_name = "mycrate"]
~~~

## Defining a module

Crate code is contained in an implicit _root_ module. Crate code can be splitted
to submodules under the _root_ module (hierachy).

Modules act as namespace. A module is defined with `mod modename { ... }`.

Modules can be defined in other modules (nested modules). Modules are **not**
compiled individually. Only crates compile.

For each source file the compiler defines a module implicitly. To import items
use `mod filname::item`.

## The visibility of items

By default an item is visible within its module only. To export it use `pub`.

If the module containg the item is part of hierarchy (nested), the modules on
the path must be also declared as public (`pub mod ...`).

Struct fields are by default private. To make them visible struct **and** fields
must be made public with `pub`.

## Importing modules and file hierachy

Importing a module is done with keyword the `use`. It is preferred to import
modules at the top of the source file.

Inside a module `self::` or `super::` can be prepended to a module path.

~~~rust
use module::item;             // import single item from another module
use module::item as shorter;  // rename imported item
use module::{item1,item2};    // import several items at once
use module::*;                // import all public items, not preferred
~~~

## Importing external crates

Importing all **public** items from an external crate is done with
`extern crate cratename`.

A crate creates an implicit module with the same name. An item is accessed with
`cratename::item` or it is imported with `use cratename::item` before.

## Adding external crates to a project

##### Cargo.toml

~~~
[dependencies]
log = "0.2.5"
mac = "*"
~~~

~~~rust
~~~

# 8 Concurrency and Parallism

To be added.

# 9 Programming at the Boundaries

To be added.
