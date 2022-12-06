//
//  Class.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 24/06/22.
//

import Foundation
import CoreData

typealias Entity = NSManagedObject & Codable & Identifiable

class Class: Entity {
    @NSManaged var id: String?
    @NSManaged var createdAt: Date?
    @NSManaged var updatedAt: Date?

    enum CodingKeys: String, CodingKey {
        case id = "objectId", createdAt, updatedAt
    }

    required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        self.init(context: context)
        try decode(from: decoder)
    }

    func decode(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        let createdAtString = try container.decode(String.self, forKey: .createdAt)
        let updatedAtString = try container.decode(String.self, forKey: .updatedAt)
        createdAt = createdAtString.convertToDate()
        updatedAt = updatedAtString.convertToDate()
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }
}
