//
//  URLRequestBuilder.swift
//  MobileNOCTask
//
//  Created by Mohammed Elnaggar on 1/5/19.
//  Copyright © 2019 Mohammed Elnaggar. All rights reserved.
//

import Foundation
import Alamofire

protocol URLRequestBuilder: URLRequestConvertible, APIRequestHandler {
    
    var mainURL: URL { get }
    var requestURL: URL { get }
    // MARK: - Path
    var path: ServerPaths { get }
    
    // MARK: - Parameters
    var parameters: Parameters? { get }
    
    // MARK: - Methods
    var method: HTTPMethod { get }
    
    var encoding: ParameterEncoding { get }
    
    var urlRequest: URLRequest { get }
    
    var mobileNOCManager: Alamofire.SessionManager { get }
}

extension URLRequestBuilder {
    
    var mainURL: URL {
        return URL(string: "https://45.55.43.15:9090/api")!
    }
    
    var requestURL: URL {
        return mainURL.appendingPathComponent(path.rawValue)
    }

    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        return request
    }
    
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }
}

