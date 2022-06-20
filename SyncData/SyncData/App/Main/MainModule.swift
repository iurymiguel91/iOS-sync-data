//
//  MainModule.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

import Alamofire

struct MainModule {
    static func makeHttpClient() -> HttpClientProtocol {
        HttpClient(baseUrl: "https://parseapi.back4app.com/parse/",
                   encoding: URLEncoding.default,
                   headers: [
                    "X-Parse-Application-Id": "rVqzDm1yeWsztX4RNVGeDTAR4MbTIzUIBibbYmWL",
                    "X-Parse-REST-API-Key": "dISp72IBdo5oH1EwKyMbn9hVa6lzU5OtZbdh0Dq8"
                   ])
    }

    static func makeParseAPIClient(httpClient: HttpClientProtocol) -> SDAFParseAPIClientProtocol {
        SDAFParseAPIClient(httpClient: httpClient)
    }
}
