//
//  Holiday+CoreDataClass.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 24/06/22.
//
//

import Foundation
import CoreData

class Holiday: Class {
    @NSManaged var details: String?
    @NSManaged var image: Data?
    @NSManaged var name: String?
    @NSManaged var observedBy: Array<String>?
    @NSManaged var wikipediaLink: String?

    @nonobjc class func fetchRequest() -> NSFetchRequest<Holiday> {
        return NSFetchRequest<Holiday>(entityName: "Holiday")
    }

    enum CodingKeys: CodingKey {
        case name,
             observedBy,
             details,
             wikipediaLink
    }

    override func decode(from decoder: Decoder) throws {
        try super.decode(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        observedBy = try container.decode([String].self, forKey: .observedBy)
        details = try container.decode(String.self, forKey: .details)
        wikipediaLink = try container.decodeIfPresent(String.self, forKey: .wikipediaLink)
    }

    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(observedBy, forKey: .observedBy)
        try container.encode(details, forKey: .details)
        try container.encode(wikipediaLink, forKey: .wikipediaLink)
    }
}
