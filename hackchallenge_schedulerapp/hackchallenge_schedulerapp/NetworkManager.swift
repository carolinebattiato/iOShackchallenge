//
//  NetworkManager.swift
//  hackchallenge_schedulerapp
//
//  Created by Nithish Kalpat on 12/8/19.
//  Copyright © 2019 Caroline Battiato. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    private static let url = "http://35.185.121.122/api/CS/requirements"
    
    static func getClasses(didGetClasses: @escaping ([Course]) -> Void) {
        Alamofire.request(url, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let courseData = try?jsonDecoder.decode(CourseSearchResponse.self, from: data) {
                    let courses = courseData.results
                    didGetClasses(courses)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
    }
    
}
}
