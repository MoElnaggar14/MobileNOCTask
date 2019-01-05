//
//  APIRequestHandler.swift
//  MobileNOCTask
//
//  Created by Mohammed Elnaggar on 1/5/19.
//  Copyright © 2019 Mohammed Elnaggar. All rights reserved.
//

import Foundation
import Alamofire

typealias CallResponse<T> = ((ServerResponse<T>) -> Void)?

protocol APIRequestHandler: HandleAlamoResponse {
    
}

extension APIRequestHandler where Self: URLRequestBuilder {
    func send<T: CodableInit>(_ decoder: T.Type, progress: ((Progress) -> Void)? = nil, debug: ((DataResponse<Any>) -> Void)? = nil,completion: CallResponse<T>) {
        
        mobileNOCManager.request(self).authenticate(user: "admin@boot.com", password: "admin", persistence: .forSession).responseData {
            self.handleResponse($0, completion: completion)
            }.responseJSON { (results) in
                debug?(results)
                let res = results.result.value as? [String: Any]
                print(res?["status"] as Any)
            }
    }
}
