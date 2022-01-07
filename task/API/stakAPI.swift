//
//  stakAPI.swift
//  task
//
//  Created by Mohamed Alfakharany on 06/01/2022.
//

import Foundation
import Alamofire

class stackData: NSObject {
    
    class func getStackData(tagged: String,min: String, completion: @escaping(_ error: Error?,_ success: Bool,_ stakeModle: stakeModle?)-> Void){
        let url = "https://api.stackexchange.com/2.2/questions/no-answers"
        
        let parameters = [
            "min": min,
            "tagged": tagged,
            "fromdate": "1601617341",
            "todate": "1604209341",
            "order": "asc",
            "sort": "votes",
            "site": "stackoverflow"
            
        ] as [String: String]
        
       // These all query parameter -- Print your URL //api.stackexchange.com/2.2/questions/no-answers? it is work 

        print(parameters)
        
        let header: HTTPHeaders = [
            "Username": "stackexchange",
            "Password": "admin@123456",
            "Content-Type": "application/json",
            "Lang": "en",
            "DeviceType": "IOS"
        ]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString , headers: header).responseJSON { (response) in
            switch response.result
            {
            case .failure(let error):
                completion(error,false,nil)
                print(error)
                print(url)
            case .success:
                do{
                    print(response)
                    let stakData = try JSONDecoder().decode(stakeModle.self, from: response.data!)
                    completion(nil,true,stakData)
                }catch {
                    completion(nil,true,nil)
                }
            }
        }
    }
    
}

/// What is the issue?
///JSONParameterEncoder.default new al
