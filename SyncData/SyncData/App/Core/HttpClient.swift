//
//  HttpClient.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

import Alamofire

protocol HasHttpClient {
    var httpClient: HttpClientProtocol { get }
}

protocol HttpClientProtocol {
    func requestGet(urlSuffix: String, parameters: Parameters?) -> DataRequest
}

class HttpClient: HttpClientProtocol {
    private let baseUrl: URLConvertible
    private let encoding: ParameterEncoding
    private let headers: HTTPHeaders

    init(baseUrl: URLConvertible,
         encoding: ParameterEncoding,
         headers: HTTPHeaders) {
        self.baseUrl = baseUrl
        self.encoding = encoding
        self.headers = headers
    }

    func requestGet(urlSuffix: String,
                    parameters: Parameters?) -> DataRequest {
        AF.request("\(baseUrl)\(urlSuffix)",
                   method: .get,
                   parameters: parameters,
                   encoding: encoding,
                   headers: headers,
                   interceptor: nil)
    }
}
