//
//  HomePresenter.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

import Foundation

protocol HomePresenterProtocol {
    func getHolidays()
}

class HomePresenter: HomePresenterProtocol {
    private let coordinator: MainFlowDelegate
    private let holidayService: HolidayServiceProtocol

    init(coordinator: MainFlowDelegate,
         holidayService: HolidayServiceProtocol) {
        self.coordinator = coordinator
        self.holidayService = holidayService
    }

    func getHolidays() {
        holidayService.getHolidays(parameters: nil) { result in
            switch result {
            case .success(let data):
                print(data.results)
            case .failure(let error):
                print(error)
            }
        }
    }
}
