//
//  CSCourse.swift
//  hackchallenge_schedulerapp
//
//  Created by Caroline Battiato on 11/21/19.
//  Copyright © 2019 Caroline Battiato. All rights reserved.
//

import Foundation
import UIKit

struct Course: Codable {
    
    var courseID: String
//    var className: String
    var semester: String
//    var taken : Bool
    
}

struct CourseSearchResponse: Codable {
    var results: [Course]
}
