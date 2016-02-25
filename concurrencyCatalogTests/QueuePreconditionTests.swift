//
//  QueuePreconditionTests.swift
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

/// This class containts all the tests that check that preconditions are working and deadlocks
/// are prevented. The tests won't suceed, the test running will be stopped by the preconditions
class QueuePreconditionTests: XCTestCase {

    /**
     A deadlock is deliberately generated so we can test the precondition on the MainQueue and confirm
     that calling a block synchronously on the main thread
     in which the test is running will cause a deadlock
     
     - attention: your tests will just crash
     
     - summary, this will happen is there were no precondition:
         1. We are on the main thread.
         2. We call a task on the main thread SYNChronously
         3. The test waits for the task
         4. The task is waiting for the test to use the thread
     */
    func testSyncCallOnMainFromMainThreadDEADLOCK() {
        MainQueue().execute(.Sync) { print(__FUNCTION__) }
    }
    
    /**
     Here we create a cyclic deadlock. By calling execute on BackgroundQueue from the main thread that is running the test,
     and later that thread dispatch SYNC to the main queue, that was already waiting for the BackgroundQueue to finish.
     
     - attention: Execute this tests alone and XCode will just hang waiting.
     
     - summary:
         1. We call the test on the main thread.
         2. The test call BackgroundQueue which calls SYNChronously on a background queue
         3. The backgroundQueue calls SYNChronously print on the main thread.
         4. print is waiting to get the main thread.
         5. The BackgroundQueue is waiting for print.
         6. The main thread is waiting for the BackgroundQueue.
     */
    func testSyncCallOnMainFromBackgroundQueueDEADLOCK() {
        BackgroundQueue(qos: .Utility).execute(.Sync) {
            MainQueue().execute(.Sync) {
                print(__FUNCTION__)
            }
        }
    }
    
    /**
     Testing that the preconditions added to the class CustomQueue are working to prevent a deadlock when a sync
     call is made on the same queue from the same queue

     - attention: your tests will just crash
     
     - summary: this will happen if there were no precondition checked:
         1. We call the test on the main thread.
         2. The test creates a custom background serial queue.
         3. The queue calls SYNChronously and waits for the print on the same queue.
         4. The print is waiting to get the custom queue.
         5. The custom queue is controlled by the execute call waiting for the print.
         6. The main thread is waiting for the execute to finish
     */
    func testSyncCallCustomQueueSerialFromTheSameQueueDEADLOCK() {
        let queue = CustomQueue(name: "the.deadlock.queue", kind: .Serial)
        
        queue.execute(.Sync) { queue.execute(.Sync){
            print(__FUNCTION__)
            }
        }
    }
    
}
