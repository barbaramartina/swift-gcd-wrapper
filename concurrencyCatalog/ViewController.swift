//
//  ViewController.swift
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
//  Created by Barbara Rodeker on 1/29/16.
//

import UIKit

class ViewController: UITableViewController {
    
    private let sections = ["Synchronous GCD calls" : [ "On main thread" : synchronousGCDOnMainThread ,
                                                        "On background thread" : synchronousGCDBackgroundThread]
                            ]
    
    let rowNumbers = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func synchronousGCDOnMainThread() -> Void {

//        dispatch_once_t
    }
    

    
    func synchronousGCDBackgroundThread() -> Void {
    }
    
    // MARK: data source methods
  /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        guard (tableView == self.tableView) else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
    }
    
   // private func checkIsValid(tableView : UITableView, )

*/
}

