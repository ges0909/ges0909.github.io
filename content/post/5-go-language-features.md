+++
weight = 5
date = "2016-01-06T00:00:00+01:00"
tags = ["go"]
title = "Go Language Features"

+++

<!--more-->

- Simplicity as principle for the language design.
 - (simple) exception handling with `panic` and `recover`
 - delay function with `defer` until surrounding function returns
<a target="_blank" href="https://play.golang.org/p/It_BOFsQ8l"><button class="playground">Go</button></a>
 - etc.
- Compiler produces a single, statically linked executable.
- Concurrency is baked into the language to scale well on multiple core.
- No _Generics_ (parameter types `<T, ...>`) [^1]
- No full memory control due to garbage collection.
- Strong for:
  - Web development: The standard library provides everything to build a web
server, do routing, html templates, file serving, res/req handling, databases, etc.

"_Fast build times, small binaries, one file, built in formatting, great tooling,
built in test framework, profilers, a nice concurrency model? Wow, sold!_" [^2]

[^1]: [Generic programming](https://en.wikipedia.org/wiki/Generic_programming)
[^2]: [Moving a team from Scala to Golang](http://jimplush.com/talk/2015/12/19/moving-a-team-from-scala-to-golang/)
