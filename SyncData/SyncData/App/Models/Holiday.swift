//
//  Holidays.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

import Foundation

struct Holiday: Codable {
    let id: String
    let createdAt: String
    let updatedAt: String
    let name: String
    let observedBy: [String]
    let image: Data?
    let wikipediaLink: String
    let details: String
//    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case id = "objectId"
        case createdAt
        case updatedAt
        case name
        case observedBy
        case image
        case wikipediaLink
        case details
//        case date
    }
}
