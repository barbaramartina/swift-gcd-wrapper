//
//  PerformanceQueueSyncTests.swift
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

class PerformanceQueueSyncTests: XCTestCase {

    func testPerformanceSyncCallOnBackgroundUserInitiated() {
        self.measureBlock { [weak self] in
            self!.expectForExecutor(BackgroundQueue(qos: .UserInitiated), usingMode: .Sync) { print(__FUNCTION__) }
        }
    }
    
    func testPerformanceSyncCallOnBackgroundUserInteractive() {
        self.measureBlock { [weak self] in
            self!.expectForExecutor(BackgroundQueue(qos: .UserInteractive), usingMode: .Sync) { print(__FUNCTION__) }
        }
    }
    
    func testPerformanceSyncCallOnBackgroundUtility() {
        self.measureBlock { [weak self] in
            self!.expectForExecutor(BackgroundQueue(qos: .Utility), usingMode: .Sync) { print(__FUNCTION__) }
        }
    }
    
    func testPerformanceSyncCallOnBackgroundBackground() {
        self.measureBlock { [weak self] in
            self!.expectForExecutor(BackgroundQueue(qos: .Background), usingMode: .Sync) { print(__FUNCTION__) }
        }
    }
    func testPerformanceSyncCallOnCustomQueueSerial() {
        self.measureBlock { [weak self] in
            self!.expectForExecutor(CustomQueue(name: "bmr.test.queue", kind: .Serial), usingMode: .Sync) { print(__FUNCTION__) }
        }
    }
    func testPerformanceSyncCallOnCustomQueueConcurrent() {
        self.measureBlock { [weak self] in
            self!.expectForExecutor(CustomQueue(name: "bmr.test.queue", kind: .Concurrent), usingMode: .Sync) { print(__FUNCTION__) }
        }
    }
    
}
