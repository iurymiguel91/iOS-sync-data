//
//  HomePresenter.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 19/06/22.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
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
        let date = Date()
        holidayService.getHolidays(after: date) { result in
            switch result {
            case .success(let data):
                print(data.results)
            case .failure(let error):
                print(error)
            }
        }
    }
}
