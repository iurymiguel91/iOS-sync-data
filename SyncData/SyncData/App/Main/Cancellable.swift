//
//  Utilities.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

import Alamofire

protocol Cancellable: AnyObject {
    func cancelOperation()
}

extension DataRequest: Cancellable {
    func cancelOperation() {
        cancel()
    }
}
