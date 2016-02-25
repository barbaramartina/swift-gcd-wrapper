//
//  Queues.swift
//  concurrency-catalog
//
//
//  Copyright © 2016 Barbara Martina Rodeker.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  Created by Barbara Rodeker on 2/19/16.
//

import Foundation

/**
Wrapper for main queue in GCD
- seealso: Main queue and GCD documentation
 [Main Queues](https://developer.apple.com/library/ios/documentation/Performance/Reference/GCD_libdispatch_Ref/#//apple_ref/doc/uid/TP40008079-CH2-SW66)
*/
struct MainQueue: Executor {
    internal let queue : dispatch_queue_t
    
    /**
     Initializer will create a reference to the main system queue
     
     - returns: MainQueue
     */
    init() {
        queue = dispatch_get_main_queue()
    }
    
    /**
     Executes a block on the main queue. 
     
     - attention: Deadlock prevention will be executed.
     This method will check if you are running on the main queue and
     you're intending to execute syncrhnously.
     
     - precondition: Current thread should not be the main thread when `QueueExecutionMode` is SYNC
     
     - important: based on GCD `dispatch_async` and `dispatch_sync`
     
     - parameter mode:  Refer to `QueueExecutionMode` for possible values
     - parameter block: `dispatch_block_t` to execute
     */
    func execute(mode: QueueExecutionMode, block: dispatch_block_t) {
        precondition(mode == .Async ||
            (dispatch_queue_get_label(self.queue) != dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL)))
        
        switch mode {
        case .Async: dispatch_async(self.queue, block)
        case .Sync: dispatch_sync(self.queue, block)
        }
    }

}

/**
Wrapper for Background global queues provided by the system
 - seealso: Global queues and GCD documentation
 [Global background queues](https://developer.apple.com/library/ios/documentation/Performance/Reference/GCD_libdispatch_Ref/#//apple_ref/doc/uid/TP40008079-CH2-SW66)
*/
struct BackgroundQueue: Executor {
    internal let queue : dispatch_queue_t
  
    /**
     Initializer with a defined QOS
     
     - seealso: QOS in Swift
     [Learn more about QOS](https://developer.apple.com/library/mac/documentation/Performance/Conceptual/power_efficiency_guidelines_osx/PrioritizeWorkAtTheTaskLevel.html)
     
     - parameter qos: quality of the service required
     
     - returns: BackgroundQueue
     */
    init(qos: QueueQuality) {
        queue = dispatch_get_global_queue(QueueQuality.systemQOS(qos),0)
    }
}

/**
Wrapper for GCD custom queues
*/
struct CustomQueue : Executor {
    internal let queue : dispatch_queue_t
    private let kind : QueueKind
    
    /**
     Initializer for a custom queue with a defined name and kind.
     
     - precondition: name must not be empty.
     
     - parameter name: Name of the queue. Recommended DNS reverse naming.
     - parameter kind: Kind of the queue. See `QueueKind` for possible values.
     
     - returns: CustomQueue
     */
    init(name: String, kind: QueueKind) {
        precondition(name.characters.count > 0)
        
        self.kind = kind
        queue = dispatch_queue_create(name, kind == .Serial ? DISPATCH_QUEUE_SERIAL : DISPATCH_QUEUE_CONCURRENT)
    }

    /**
     Executes a block on the main queue.
     
     - attention: Deadlock prevention will be executed.
     This method will check if you are running on the main queue and
     you're intending to execute syncrhnously.
     
     - precondition: Current queue should not be the same in which this 
     executor is being called when `QueueExecutionMode` is SYNC

     - important: based on GCD `dispatch_async` and `dispatch_sync`
     
     - parameter mode:  Refer to `QueueExecutionMode` for possible values
     - parameter block: `dispatch_block_t` to execute
     */
    func execute(mode: QueueExecutionMode, block: dispatch_block_t) {
        precondition(mode == .Async ||
            (dispatch_queue_get_label(self.queue) != dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL)))

        switch mode {
        case .Async: dispatch_async(self.queue, block)
        case .Sync: dispatch_sync(self.queue, block)
        }
    }
}

