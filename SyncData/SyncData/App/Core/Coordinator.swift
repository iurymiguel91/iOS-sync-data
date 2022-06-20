//
//  Coordinator.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    func start()
}
