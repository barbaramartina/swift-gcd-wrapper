//
//  QueueQuality.swift
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
 Wrapper for QOS classes
 
 - seealso: QOS in Swift
 [Learn more about QOS](https://developer.apple.com/library/mac/documentation/Performance/Conceptual/power_efficiency_guidelines_osx/PrioritizeWorkAtTheTaskLevel.html)
 
 - UserInteractive: map to QOS_CLASS_USER_INTERACTIVE
 - UserInitiated:   map to QOS_CLASS_USER_INITIATED
 - Utility:         map to QOS_CLASS_UTILITY
 - Background:      map to QOS_CLASS_BACKGROUND
 */
enum QueueQuality {
    case UserInteractive
    case UserInitiated
    case Utility
    case Background
    case Unspecified
    case Default
    
    static func systemQOS(qos: QueueQuality) -> qos_class_t {
        switch qos {
        case .UserInteractive: return QOS_CLASS_USER_INTERACTIVE
        case .UserInitiated: return QOS_CLASS_USER_INITIATED
        case .Utility: return QOS_CLASS_UTILITY
        case .Background: return QOS_CLASS_BACKGROUND
        case .Unspecified: return QOS_CLASS_UNSPECIFIED
        case .Default: return QOS_CLASS_DEFAULT
        }
    }
}

// MARK: - Extension for debug description
extension QueueQuality : CustomDebugStringConvertible {
    var debugDescription : String {
        switch self {
        case .UserInitiated: return "User initiated quality of service"
        case.UserInteractive: return  "User interactive quality of service"
        case .Utility: return  "Utility quality of service"
        case .Background: return  "Background quality of service"
        case .Unspecified: return "Quality of service not specified"
        case .Default: return "Default quality of service"
        }
    }
}
