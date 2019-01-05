//
//  HomeRequest.swift
//  MobileNOCTask
//
//  Created by Mohammed Elnaggar on 1/5/19.
//  Copyright © 2019 Mohammed Elnaggar. All rights reserved.
//

import Foundation
import Alamofire

enum HomeRequest: URLRequestBuilder {

    case machine(page: Int)
    
    var mobileNOCManager: Alamofire.SessionManager {
        
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "45.55.43.15": .disableEvaluation
        ]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        
        return manager
    }
    
    // MARK:- Paths
    internal var path: ServerPaths {
        switch self {
        case .machine:
            return .machine
        }
    }
    
    // MARK:- Paramters
    internal var parameters: Parameters? {
        var param = Parameters.init()
        
        switch self {
        case let .machine(page):
            param["page"] = page
            param["size"] = 10
        }
        return param
    }
    
    // MARK:- Methods
    internal var method: HTTPMethod {
        return .get
    }
    
    // MARK:- Encoding
    internal var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
}
