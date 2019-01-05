//
//  ServerDetailsResponse.swift
//  MobileNOCTask
//
//  Created by Mohammed Elnaggar on 1/5/19.
//  Copyright © 2019 Mohammed Elnaggar. All rights reserved.
//

import Foundation

struct ServerDetailsResponse: Codable, CodableInit {
    let content: [Content]
    let pageable: Pageable
    let totalPages, totalElements: Int
    let last, first: Bool
    let sort: Sort
    let numberOfElements, size, number: Int
    let empty: Bool
}

struct TargetMachine: Codable {
    let id, sourceMachineId: Int
    let targetMachine: Content
    let circuitStatusId: Int
}

struct Content: Codable {
    let id: Int
    let name: String
    let ipAddress: String?
    let ipSubnetMask: String?
    let model: Model
    let locationId: Int
    let status: Status
    let type: TypeClass
    let serialNumber, version: String?
    let communicationProtocols: [CommunicationProtocol]
    let targetMachines: [TargetMachine]
    let location: Int
    let serialNum: String?
}

struct CommunicationProtocol: Codable {
    let id: Int
    let name: String?
    let defaultPort: Int
}

struct Model: Codable {
    let id: Int
    let name: String
    let creationDate, expiryDate: String?
}

struct Status: Codable {
    let id: Int
    let statusValue, legacyValue: String
}

struct TypeClass: Codable {
    let id: Int
    let name: String
}

struct Pageable: Codable {
    let sort: Sort
    let pageSize, pageNumber, offset: Int
    let unpaged, paged: Bool
}

struct Sort: Codable {
    let sorted, unsorted, empty: Bool
}
