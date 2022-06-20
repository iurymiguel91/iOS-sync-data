//
//  ParseAPIResult.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

struct ParseAPIGetResult<T: Decodable>: Decodable {
    let results: [T]
}
