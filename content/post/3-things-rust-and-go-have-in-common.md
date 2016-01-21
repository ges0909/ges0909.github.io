+++
weight = 3
date = "2016-01-03T00:00:00+01:00"
tags = ["rust", "go"]
title = "Things Rust and Go have in common"

+++

<!--more-->

- Claim to be a _Systems Programming Language_: Hardware-related, performance-critical
software like operating systems. etc. [^1]
- Cross platform: Compiler generates native code for different target platforms
(no VM as for Java).
- Strict compilation checkings. Unused packages and variables will prevent
compilation in _Go_. And _Rust_ users experience "fighting with the borrow checker",
where the  compiler refuses to compile a program that the author thinks is valid.
- Strong, open source standard libraries.
- Useful tools ("batteries included"):
 - Build tool with package manager and dependency control
 - Unit test support
 - Code formatter
 - Documentation tool: For example in _Rust_ with doc comments code examples may
 be run as tests.
- Language features:
 - Well-known datatypes like primitive, string, array, vector, slice, struct,
    enum, pointers (reference)
 - Well-known control structures like condition, loop and switch (Rust: _match_)
 - Statically typed
 - Automatic type inference
 - Multiple return values (in _Rust_ as tuples)
 - Functional programming constructs (closures, etc.)
 - No real object-orientation: no classes and no inheritance
 - Interfaces
 - Organizing code in packages (Rust: _crates_)
 - Reflection (ability of a program to examine its own structure, particulary its types)
 - _C_-binding
 - etc.
- The Computer Language Benchmarks Game: [Rust programs versus Go](http://benchmarksgame.alioth.debian.org/u64q/compare.php?lang=rust&lang2=go)

[^1]: [Wikipedia: System programming](https://en.wikipedia.org/wiki/System_programming)
