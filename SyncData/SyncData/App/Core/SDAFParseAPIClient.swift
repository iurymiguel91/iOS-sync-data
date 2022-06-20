//
//  SDAFParseAPIClient.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

import Alamofire
import Foundation

protocol HasSDAFParseAPIClient: AnyObject {
    var parseAPIClient: SDAFParseAPIClientProtocol { get }
}

protocol SDAFParseAPIClientProtocol: AnyObject {
    func getRequestFor(class className: String, parameters: Parameters?) -> DataRequest
    func getRequestForAllRecords(ofClass className: String, updatedAfterDate updatedDate: Date?) -> DataRequest
}

class SDAFParseAPIClient: SDAFParseAPIClientProtocol {
    private let httpClient: HttpClientProtocol
    
    init(httpClient: HttpClientProtocol) {
        self.httpClient = httpClient
    }
    
    func getRequestFor(class className: String, parameters: Parameters?) -> DataRequest {
        httpClient.requestGet(urlSuffix: "classes/\(className)", parameters: parameters)
    }

    func getRequestForAllRecords(ofClass className: String, updatedAfterDate updatedDate: Date? = nil) -> DataRequest {
        var parameters: Parameters?
        if let updatedDate = updatedDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.'999Z'"
            dateFormatter.timeZone = TimeZone(identifier: "GMT")
            
            let jsonString = String(format: "{\"updatedAt\":{\"$gte\":{\"__type\":\"Date\",\"iso\":\"%@\"}}}",
                                    dateFormatter.string(from: updatedDate))
            
            parameters = ["where": jsonString]
        }
        return getRequestFor(class: className, parameters: parameters)
    }
}
