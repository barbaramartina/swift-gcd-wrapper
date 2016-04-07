# swift-gcd-wrapper
A wrapper on Swift [GCD](https://developer.apple.com/library/ios/documentation/Performance/Reference/GCD_libdispatch_Ref/) to make use of queues, qos, synchronous and asynchronous execution easily.

In order to hide GCD specifics logic and avoid calling dispatch_async, dispatch_sync, creating customs queues or asking for the main or an specific background queue, I've created this wrapper.

This wrapper is also part of an effort to show how to use different kind of queues from GCD and is used as an explanatory example in my blog [Lady&Tech](http://ladyandtech.blogspot.de/).

Basic structure of the wrapper
==============================

![basic structure](https://github.com/barbaramartina/swift-gcd-wrapper/blob/master/resources/basic-structure.png)

The protocol **Executor** requires the existence of a [dispatch queue](https://developer.apple.com/library/ios/documentation/Performance/Reference/GCD_libdispatch_Ref/#//apple_ref/c/tdef/dispatch_queue_t).  

Executor defines a function to allow the execution of a [block](https://developer.apple.com/library/ios/documentation/Performance/Reference/GCD_libdispatch_Ref/#//apple_ref/c/tdef/dispatch_block_t), specifying if the execution mode: **Async** or **Sync**.  


```Swift
        var queue : dispatch_queue_t { get }

        func execute(mode: QueueExecutionMode, block: dispatch_block_t)
```        

An extension on **Executor** defines a default implementation of the execute method.  


```Swift
        func execute(mode: QueueExecutionMode, block: dispatch_block_t) {
         switch mode {
         case .Async: dispatch_async(self.queue, block)
         case .Sync: dispatch_sync(self.queue, block)
         }
        }
```
There are three kind of queues, represented as structs, that you can use to execute your blocks:  

- **MainQueue**
- **BackgroundQueue**
- **CustomQueue**

![GCD queues](https://github.com/barbaramartina/swift-gcd-wrapper/blob/master/resources/GCD%20queues.png)  


**MainQueue** is mapping to the system serial main queue. <br>
**BackgroundQueue** uses the system default provided background concurrent queues, according to the quality of service indicated. <br>
**CustomQueue** wraps a serial or concurrent queue with a given name. <br>  
  
  
[Read more about QOS and energy efficiency guideline](https://developer.apple.com/library/mac/documentation/Performance/Conceptual/power_efficiency_guidelines_osx/PrioritizeWorkAtTheTaskLevel.html)




