+++
weight = 8
date = "2016-01-13T14:22:41+01:00"
tags = ["rust", "go"]
title = "Conclusion"

+++

_Rust_ and _Go_, both have their pros and cons.

They are promoted by _Mozilla_ resp. _Google_, are open source and have
large communities in background. This ensures progress for further development.

<!--more-->

Both don't invent the things new. Instead they borrow ideas from existing
languages and mix imperative (procedural) and functional principles.

Nevertheless _Rust_'s ownership and borrowing of values for memory safety is
unique. But it has its costs: A steep learning curve.

In contrast _Go_ leaves out well-known features like _Generics_ to stay simple.
Though statically typed and compiled it may feel like a dynamically typed,
interpreted language.

_Rust_ allows "bare metal" programming and could substitute C/C++ in future.
Its _Foreign Function Interface_ (FFI) allows the usage of other languages.

Against this _Go_ is not suitable for "bare metal" programming due to its
garbage collection. But _Go_ is more mature because it published the first
stable release, usable for production, three years before _Rust_.

As result _Go_ is already is used for programming serious software, like the
hyped [Docker](http://www.docker.com). But this another story! [^1]

[^1]: [Docker and Go: why did we decide to write Docker in Go?](http://de.slideshare.net/jpetazzo/docker-and-go-why-did-we-decide-to-write-docker-in-go)
