//
//  Date+Extensions.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 26/06/22.
//

import Foundation

extension String {
    func convertToDate(with format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
