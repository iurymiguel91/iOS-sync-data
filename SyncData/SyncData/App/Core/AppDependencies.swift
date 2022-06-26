//
//  AppDependencies.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

import CoreData

typealias GeneralDependencies = HasHttpClient & HasSDAFParseAPIClient

final class AppDependencies: GeneralDependencies {
    let httpClient: HttpClientProtocol
    let parseAPIClient: SDAFParseAPIClientProtocol
    let persistentContainer: PersistentContainerProtocol
    var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.managedObjectContext] = persistentContainer.containerViewContext
        return decoder
    }

    init(httpClient: HttpClientProtocol,
         parseAPIClient: SDAFParseAPIClientProtocol,
         persistentContainer: PersistentContainerProtocol) {
        self.httpClient = httpClient
        self.parseAPIClient = parseAPIClient
        self.persistentContainer = persistentContainer
    }
}
