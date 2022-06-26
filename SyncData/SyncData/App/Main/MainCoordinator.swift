//
//  MainCoordinator.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

import UIKit

protocol MainFlowDelegate {
    func navigate()
}

class MainCoordinator: Coordinator {
    let navigationController: UINavigationController
    private let dependencies: AppDependencies

    init(navigationController: UINavigationController,
         dependencies: AppDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let viewController = HomeModule.makeHomeViewController(coordinator: self,
                                                               dependencies: dependencies)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension MainCoordinator: MainFlowDelegate {
    func navigate() {
        print("TODO")
    }
}
