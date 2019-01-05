//
//  ServerResponse.swift
//  MobileNOCTask
//
//  Created by Mohammed Elnaggar on 1/5/19.
//  Copyright © 2019 Mohammed Elnaggar. All rights reserved.
//

import Foundation

enum ServerResponse<T> {
    case success(T), failure(LocalizedError?)
}
