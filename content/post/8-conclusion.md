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

Both don't invent the wheel new. Instead they borrow ideas from existing
languages and mix imperative (procedural) and functional principles.

Nevertheless _Rust_'s ownership and borrowing of values for memory safety is
unique. But it has its costs: A steep learning curve.

In contrast _Go_ leaves out well-known features like _Generics_ to stay simple.
Though statically typed and compiled it often may feel like a dynamically typed,
interpreted language.

_Rust_ allows "bare metal" programming and could substitute C/C++ in future.
Its _Foreign Function Interface_ (FFI) allows the usage of other languages.

Against this _Go_ is not suitable for "bare metal" programming due to its
garbage collection. It has its strength for programming backend systems, where
typically _Java Enterprise_ is used today. 

And that said: _Go_ is more mature than _Rust_ because it has published its first
stable release three years before the competitor of Mozilla. As result _Go_ has
reached a wider adoption: It is already used by firms like _Facebook_, _Twitter_,
_SoundCloud_, _Dropbox_, _Booking.com_ and of course _Google_. [^1]

It is also used by the hyped [Docker](http://www.docker.com). But this is another
story! [^2]

![Docker Container Engine Logo](/img/docker_container_engine_logo.png)

[^1]: [Google Go: Why Google’s programming language can rival Java in the enterprise](http://www.techworld.com/apps/why-googles-go-programming-language-could-rival-java-in-enterprise-3626140/)
[^2]: [Docker and Go: why did we decide to write Docker in Go?](http://de.slideshare.net/jpetazzo/docker-and-go-why-did-we-decide-to-write-docker-in-go)
