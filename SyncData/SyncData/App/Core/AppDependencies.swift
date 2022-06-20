//
//  AppDependencies.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

typealias GeneralDependencies = HasHttpClient & HasSDAFParseAPIClient

final class AppDependencies: GeneralDependencies {
    let httpClient: HttpClientProtocol
    let parseAPIClient: SDAFParseAPIClientProtocol

    init(httpClient: HttpClientProtocol,
         parseAPIClient: SDAFParseAPIClientProtocol) {
        self.httpClient = httpClient
        self.parseAPIClient = parseAPIClient
    }
}
