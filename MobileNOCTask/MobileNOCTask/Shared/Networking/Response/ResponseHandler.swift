//
//  ResponseHandler.swift
//  MobileNOCTask
//
//  Created by Mohammed Elnaggar on 1/5/19.
//  Copyright © 2019 Mohammed Elnaggar. All rights reserved.
//

import Foundation
import Alamofire

protocol HandleAlamoResponse {
    func handleResponse<T: CodableInit>(_ response: DataResponse<Data>, completion: CallResponse<T>)
}

extension HandleAlamoResponse {
    
    func handleResponse<T: CodableInit>(_ response: DataResponse<Data>, completion: CallResponse<T>) {
        switch response.result {
        case .failure(let error):
            completion?(ServerResponse<T>.failure(error as? LocalizedError))
        case .success(let value):
            do {
                let modules = try T(data: value)
                completion?(ServerResponse<T>.success(modules))
            } catch {
                completion?(ServerResponse<T>.failure(error as? LocalizedError))
            }
        }
    }
}
