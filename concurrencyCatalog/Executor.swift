//
//  Executor.swift
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
//  Created by Barbara Rodeker on 2/22/16.
//

import Foundation

/**
Protocol that can execute a block in a queue of type `dispatch_queue_t`.
*/
protocol Executor {
    var queue : dispatch_queue_t { get }
    
    /**
     Executes the received block in the designated mode
     
     - mode:  Refer to `QueueExecutionMode` for possible values
     - block: `dispatch_block_t` to execute
     */
    func execute(mode: QueueExecutionMode, block: dispatch_block_t)
}

// MARK: - Extension on Executor to provide default implementation for execute function
extension Executor {

    /**
     Default implementation for executing a block in a queue
     
     - important: based on GCD `dispatch_async` and `dispatch_sync`
     
     - parameter mode:  Refer to `QueueExecutionMode` for possible values
     - parameter block: `dispatch_block_t` to execute
     */
    func execute(mode: QueueExecutionMode, block: dispatch_block_t) {
        switch mode {
        case .Async: dispatch_async(self.queue, block)
        case .Sync: dispatch_sync(self.queue, block)
        }
    }
}
