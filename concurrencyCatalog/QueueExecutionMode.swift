//
//  QueueExecutionMode.swift
//  concurrency-catalog
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
 Describe two possibilities of executing tasks.
 
 - Sync:  caller will wait for the task to complete
 - Async: caller won't wait for the completion
 */
enum QueueExecutionMode {
    case Sync
    case Async
}

// MARK: - Extension for debug description
extension QueueExecutionMode : CustomDebugStringConvertible {
    var debugDescription : String {
        switch self {
        case .Sync: return "Synchronous execution mode"
        case .Async: return "Asynchronous execution mode"
        }
    }
}
