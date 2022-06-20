//
//  HomeModule.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

struct HomeModule {
    static func makeHomeViewController(coordinator: MainFlowDelegate,
                                       dependencies: AppDependencies) -> HomeViewController {
        let holidayService = HolidayService(parseAPIClient: dependencies.parseAPIClient)
        let presenter = HomePresenter(coordinator: coordinator, holidayService: holidayService)
        return HomeViewController(presenter: presenter)
    }
}
