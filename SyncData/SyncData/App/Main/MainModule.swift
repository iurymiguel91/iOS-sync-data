//
//  MainModule.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

import Alamofire
import CoreData

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
    
    static func makePersistentContainer() -> PersistentContainer {
        let container = PersistentContainer(name: "SyncData")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }
}
