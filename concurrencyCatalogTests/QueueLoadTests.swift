//
//  QueueLoadTests.swift
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
//  Created by Barbara Rodeker on 2/24/16.
//

import XCTest
@testable import concurrencyCatalog

class QueueLoadTests: XCTestCase {


    func testExtremeLoadBackgroundQueue() {
        let expectation = expectationWithDescription("All the calls finished")
        var  callCount = 0
        let totalCalls = 500000
        
        let queue = BackgroundQueue(qos: .Utility)
        
        for i in 0...totalCalls {
            queue.execute(.Async) {
                print("\(i)")
                callCount++
                if callCount == totalCalls { expectation.fulfill() }
            }
        }
        
        waitForExpectationsWithTimeout(30) { error in
            if let error = error {
                XCTFail("Calls did not finish on time. \(error)")
            }
        }
    }
    
}
