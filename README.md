# swift-gcd-wrapper
A wrapper on Swift GCD to make use of queues, qos, synchronous and asynchronous execution easily.

In order to hide GCD specifics calls and avoid calling dispatch_async, dispatch_sync, creating customs queues or asking for the main or an specific background queue, I've created this wrapper.

This wrapper is also part of an effort to show how to use different kind of queues from GCD and is used as an explanatory example in my blog [Lady&Tech](http://ladyandtech.blogspot.de/).

Basic structure of the wrapper
==============================



There is a protocol *Executor* requiring the existence of a dispatch queue.
Executor defines a function to allow the execution of a block, specifying if the execution mode: **Async** or **Sync**.


An exetension on *Executor* defines a default implementation of the execute method.

There are three kind of queues, represented as structs, that you can use to execute your blocks:
- **MainQueue**
- **BackgroundQueue**
- **CustomQueue**

**MainQueue** is mapping to the system main queue. <br>
**BackgroundQueue** uses the system default provided background queues, according to the quality of service indicated. <br>
**CustomQueue** wraps a serial of concurrent queue with a given name. <br>



