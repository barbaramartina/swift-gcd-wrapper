//
//  AsynchronousTests.swift
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

class QueueAsynchronousTests: XCTestCase {

    
    func testAsyncCallOnMain() {
        expectForExecutor(MainQueue(), usingMode: .Async) { print(__FUNCTION__) }
    }
    
    func testAsyncCallOnBackgroundUserInteractive() {
        expectForExecutor(BackgroundQueue(qos: .UserInteractive), usingMode: .Async) { print(__FUNCTION__) }
    }
    
    func testAsyncCallOnBackgroundUserInitiated() {
        expectForExecutor(BackgroundQueue(qos: .UserInitiated), usingMode: .Async) { print(__FUNCTION__) }
    }
    
    func testAsyncCallOnBackgroundUtility() {
        expectForExecutor(BackgroundQueue(qos: .Utility), usingMode: .Async) { print(__FUNCTION__) }
    }
    
    func testAsyncCallOnBackgroundBackground() {
        expectForExecutor(BackgroundQueue(qos: .Background), usingMode: .Async) { print(__FUNCTION__) }
    }
    
    func testAsyncCallOnCustomQueueSerial() {
        expectForExecutor(CustomQueue(name: "bmr.test.queue", kind: .Serial), usingMode: .Async) { print(__FUNCTION__) }
    }
    
    func testAsyncCallOnCustomQueueConcurrent() {
        expectForExecutor(CustomQueue(name: "bmr.test.queue", kind: .Serial), usingMode: .Async) { print(__FUNCTION__) }
    }
    
}
