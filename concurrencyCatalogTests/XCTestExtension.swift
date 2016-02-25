//
//  XCTestExtension.swift
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

extension XCTestCase {

    func expectForExecutor(executor : Executor, usingMode: QueueExecutionMode, toExecute: dispatch_block_t) {
        let expectation = expectationWithDescription("I hope this finishes :)")
        
        executor.execute(usingMode) {
            toExecute();
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5.0) { error in
            if (error != nil) {
                XCTFail("\(__FUNCTION__) did not finish on time")
            }
        }
    }

}
