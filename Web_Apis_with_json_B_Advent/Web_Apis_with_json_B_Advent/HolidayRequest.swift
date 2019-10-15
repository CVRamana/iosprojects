//
//  HolidatRequest.swift
//  Web_Apis_with_json_B_Advent
//
//  Created by Admin on 24/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation

enum HolidayError:Error{
    case NoDataAvailable
    case CannotProcessData
}


struct HolidayRequest {
    var resourceUrl:URL
    var apiKeys = "baa9dc110aa712sd3a9fa2a3dwb6c01d4c875950dc32vs"
  
    
    init(countryCode:String){
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from:date)
        let resourceString="https://calendarific.com/api/v2/holidays?&api_key=\(apiKeys)&country=\(countryCode)&year=\(currentYear)"
        guard let resourceUrl = URL(string: resourceString) else{
            fatalError()
        }
        self.resourceUrl=resourceUrl
        
    }
    
    
    func getHolidays(completion:@escaping (Result<[HolidayDetails],HolidayError>)->Void){
        let dataTask=URLSession.shared.dataTask(with: resourceUrl, completionHandler: { (data, _, _) in
            guard let jsondata = data else{
                completion(.failure(.NoDataAvailable))
                return
            }
            do {
                let decoder = try JSONDecoder().decode(HolidayResponse.self, from: data!)
            }
            catch{
               completion(.failure(.CannotProcessData))
            }
        })
        
        
        dataTask.resume()
        
        
}
}


