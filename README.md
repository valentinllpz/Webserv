# Webserv

This [42](https://42.fr/en/homepage/) project's goal is to make us write our own HTTP/1.1 [web server](https://en.wikipedia.org/wiki/Web_server) from scratch in C++. I worked on this project with [Jehanne Dussert](https://github.com/JehanneDussert/) and [Melchior Maj](https://github.com/mmaj0708/).

We needed to master [socket programming](https://www.geeksforgeeks.org/socket-programming-cc/) to allow communication between our server and a client. Another important part of this project was to understand in depth what is the [HTTP protocol](https://developer.mozilla.org/en/docs/Web/HTTP) and respect it whilst handling [requests](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods) and sending [responses](https://developer.mozilla.org/fr/docs/Web/HTTP/Status), in order to let our server communicate with a modern browser. We based our configuration file syntax on a logic close to the one used by [Nginx](https://www.nginx.com/).

## ✨ Features

### *Methods implemented*

Method|Behavior
-----|------
GET| Requests data from a specified resource
POST| Sends data to a server to create/update a resource
DELETE| Deletes the specified resource on the server


### *Technical choice*

The subject gave us the choice between those 4 functions to handle I/O sockets operations:

Function|Description|OS
-----|-----|-----
[select()](https://man7.org/linux/man-pages/man2/select.2.html) | allows a program to monitor multiple file descriptors, waiting until one or more of the file descriptors become "ready" for some class of I/O operation (e.g., input possible).  A file descriptor is considered ready if it is possible to perform a corresponding I/O operation (e.g., [read(2)](https://man7.org/linux/man-pages/man2/read.2.html), or a sufficiently small [write(2)](https://man7.org/linux/man-pages/man2/write.2.html)) without blocking. |  MacOS & Linux
[poll()](https://man7.org/linux/man-pages/man2/poll.2.html)| performs a similar task to [select(2)](https://man7.org/linux/man-pages/man2/select.2.html): it waits for one of a set of file descriptors to become ready to perform I/O.  The Linux-specific [epoll(7)](https://man7.org/linux/man-pages/man7/epoll.7.html) API performs a similar task, but offers features beyond those found in poll(). | MacOS & Linux
[epoll()](https://man7.org/linux/man-pages/man7/epoll.7.html)| The epoll API performs a similar task to [poll(2)](https://man7.org/linux/man-pages/man2/poll.2.html): monitoring multiple file descriptors to see if I/O is possible on any of them.  The epoll API can be used either as an edge-triggered or a level-triggered interface and scales well to large numbers of watched file descriptors.| Linux
[kqueue()](https://www.freebsd.org/cgi/man.cgi?query=kqueue&sektion=2)| The kqueue() system call provides a generic method	of notifying the user when an event happens or a	condition holds, based on the results of small pieces of kernel code termed filters.  A kevent is	identified by the (ident, filter) pair; there may only be one unique	kevent per kqueue. | FreeBSD & Mac OS

After some researches, we have chosen to work with poll for the following reasons:
* works on both Linux and Mac OS
* more optimised and quicker than select
* easier to use than select
* a lot of documentation available

## 🧭 Usage

1. Clone this repo and access it with `cd`
2. Run `./build.sh` to build the project and automatically set the path in `example.conf`
3. Start the server with `./webserv example.conf`. Feel free to make your own configuration file!

## 📚 Ressources
- [An overview of HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)
- [Beej's Guide to Network Programming](https://beej.us/guide/bgnet/html/)
- [Socket Programming in C/C++](https://www.geeksforgeeks.org/socket-programming-cc/)
- [Program your own web server in C (video)](https://youtu.be/esXw4bdaZkc)
- [How to build a web client? (sockets)](https://www.youtube.com/watch?v=bdIiTxtMaKA)
- [HTTP Server: Everything you need to know to Build a simple HTTP server from scratch](https://medium.com/from-the-scratch/http-server-what-do-you-need-to-know-to-build-a-simple-http-server-from-scratch-d1ef8945e4fa)
- [How NGINX processes a request](http://nginx.org/en/docs/http/request_processing.html)
- [NGINX vs. Apache : comparaison des architectures et des possibilités de configuration et d’extension](https://www.ionos.fr/digitalguide/serveur/know-how/nginx-vs-apache/)
- [Status code definitions](https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html)
- [Simple C example of doing an HTTP POST and consuming the response](https://stackoverflow.com/questions/22077802/simple-c-example-of-doing-an-http-post-and-consuming-the-response/22135885#22135885)
- [HTTP and CGI explained](https://www.garshol.priv.no/download/text/http-tut.html)
- [RFC 7230 - Message Syntax and Routing](https://datatracker.ietf.org/doc/html/rfc7230)
- [RFC 7231 - Semantics and Content](https://datatracker.ietf.org/doc/html/rfc7231)

## 👨‍💻 Authors

- [Jehanne Dussert](https://github.com/JehanneDussert/)
- [Melchior Maj](https://github.com/mmaj0708/)
- [Valentin Lugand Lopez](https://github.com/valentinllpz)