//
//  HolidayServices.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

import Alamofire

typealias Dependencies = HasSDAFParseAPIClient & HasJsonDecoder
typealias GetHolidaysCompletionHandler = (Result<ParseAPIGetResult<Holiday>, AFError>) -> Void

protocol HolidayServiceProtocol {
    @discardableResult
    func getHolidays(parameters: Parameters?, completion: @escaping GetHolidaysCompletionHandler) -> Cancellable
    @discardableResult
    func getHolidays(after date: Date, completion: @escaping GetHolidaysCompletionHandler) -> Cancellable
}

class HolidayService: HolidayServiceProtocol {
    private let parseAPIClient: SDAFParseAPIClientProtocol
    private let className = String(describing: Holiday.self)
    private let jsonDecoder: JSONDecoder
    
    init(dependencies: Dependencies) {
        self.parseAPIClient = dependencies.parseAPIClient
        self.jsonDecoder = dependencies.jsonDecoder
    }
    
    func getHolidays(parameters: Parameters?, completion: @escaping GetHolidaysCompletionHandler) -> Cancellable {
        let request =  parseAPIClient.getRequestFor(class: className, parameters: parameters)
            .responseDecodable(of: ParseAPIGetResult<Holiday>.self, decoder: jsonDecoder) { response in
                completion(response.result)
            }
        return request
    }
    
    func getHolidays(after date: Date, completion: @escaping GetHolidaysCompletionHandler) -> Cancellable {
        let request = parseAPIClient.getRequestForAllRecords(ofClass: className, updatedAfterDate: date)
            .responseDecodable(of: ParseAPIGetResult<Holiday>.self, decoder: jsonDecoder) { response in
                completion(response.result)
            }
        return request
    }
}
