//
//  ConcurrecyCatalogTests.swift
//  concurrencyCatalog
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
//  Created by Barbara Rodeker on 2/23/16.
//

import XCTest
@testable import concurrencyCatalog

class QueueSynchronousTests: XCTestCase {
    
    func testSyncCallOnBackgroundUserInteractive() {
        BackgroundQueue(qos: .UserInteractive).execute(.Sync) { print(__FUNCTION__) }
    }
    
    func testSyncCallOnBackgroundUserInitiated() {
        BackgroundQueue(qos: .UserInitiated).execute(.Sync) { print(__FUNCTION__) }
    }
    
    func testSyncCallOnBackgroundUtility() {
        BackgroundQueue(qos: .Utility).execute(.Sync) { print(__FUNCTION__) }
    }
    
    func testSyncCallOnBackgroundBackground() {
        BackgroundQueue(qos: .Background).execute(.Sync) { print(__FUNCTION__) }
    }
    
    /**
     In this case a synchronous call is made to a serial queue, but it's not the same queue in which the tests are
     being executed, so there is no risk of deadlock.
     If we were calling execute SYNC from the same QUEUE there will be a deadlock.
     */
    func testSyncCallOnCustomQueueSerial() {
        CustomQueue(name: "bmr.test.queue", kind: .Serial).execute(.Sync) { print(__FUNCTION__) }
    }
    
    func testSyncCallOnCustomQueueConcurrent() {
        CustomQueue(name: "bmr.test.queue", kind: .Concurrent).execute(.Sync) { print(__FUNCTION__) }
    }
}
