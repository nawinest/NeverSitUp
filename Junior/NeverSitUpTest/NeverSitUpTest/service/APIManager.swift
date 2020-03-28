//
//  APIManager.swift
//  NeverSitUpTest
//
//  Created by Nawin Phunsawat on 28/3/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import Foundation
import Alamofire

public class APIManager {
    static var shared: APIManager = APIManager()
    func login(password: String,
                        username: String,
                        aSuccess: @escaping (TokenResponse) -> (),
                        aFailure: @escaping (_ error: String?) -> ()) {
        let params: [String: AnyObject] = [
            "username": username as AnyObject,
            "password": password as AnyObject
        ]
        
        AF.request("http://neversitup.pythonanywhere.com/login", method: .post,  parameters: params, encoding: JSONEncoding.default).responseData { (response) in
            if let data = response.data {
                let jsonData = data
                do {
                    let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: jsonData)
                    aSuccess(tokenResponse)
                } catch {
                    print("JSONSerialization error:", error)
                }
            }
        }
    }
    
    func getDetailCustomer(token: String, customerId: String,
                        aSuccess: @escaping (DetailModel) -> (),
                        aFailure: @escaping (_ error: String?) -> ()) {
        let params: [String: AnyObject] = [
            "token": token as AnyObject,
            "customerId": customerId as AnyObject
        ]
        
        AF.request("http://neversitup.pythonanywhere.com/getCustomerDetail", method: .post,  parameters: params, encoding: JSONEncoding.default).responseData { (response) in
            if let data = response.data {
                let jsonData = data
                do {
                    let detailModel = try JSONDecoder().decode(DetailModel.self, from: jsonData)
                    aSuccess(detailModel)
                } catch {
                    print("JSONSerialization error:", error)
                }
            }
        }
    }
}
