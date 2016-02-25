//
//  QueueKind.swift
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
Wrapper on GCD queue types
 
- seealso: [GCD and Queue types](https://developer.apple.com/library/prerelease/mac/documentation/Performance/Reference/GCD_libdispatch_Ref/#//apple_ref/doc/constant_group/Dispatch_Queue_Types)
 
 - Serial:     map to DISPATCH_QUEUE_SERIAL
 - Concurrent: map to DISPATCH_QUEUE_CONCURRENT 
 
 */
enum QueueKind {
    case Serial
    case Concurrent
}

// MARK: - Extension for debug description
extension QueueKind : CustomDebugStringConvertible {
    var debugDescription : String {
        switch self {
        case .Serial: return "Serial Queue"
        case .Concurrent: return "Concurrent Queue"
        }
    }
}
