//
//  CSCourse.swift
//  hackchallenge_schedulerapp
//
//  Created by Caroline Battiato on 11/21/19.
//  Copyright © 2019 Caroline Battiato. All rights reserved.
//

import Foundation
import UIKit

class Course {
    
    var courseID: String
    var className: String
    var professor: String
    var semester: String
    var taken: Bool
    
    init(courseID: String, className: String, professor: String, semester: String, taken: Bool){
        self.courseID = courseID
        self.className = className
        self.professor = professor
        self.semester = semester
        self.taken = taken
    }
}
