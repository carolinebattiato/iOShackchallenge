//
//  CSCourse.swift
//  hackchallenge_schedulerapp
//
//  Created by Caroline Battiato on 11/21/19.
//  Copyright © 2019 Caroline Battiato. All rights reserved.
//

import Foundation
import UIKit

class CSCourse {
    
    var courseID: String
    var className: String
    var professor: String
    var semester: String
    
    init(courseID: String, className: String, professor: String, semester: String){
        self.courseID = courseID
        self.className = className
        self.professor = professor
        self.semester = semester
    }
}
