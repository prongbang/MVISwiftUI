//
//  GetHolidayUseCase.swift
//  MVISwiftUI
//
//  Created by Endtry on 18/10/2563 BE.
//

import Foundation
import Promises

protocol GetHolidayUseCase {
    func execute(params: Int) -> Promise<Holiday>
}

class DefaultGetHolidayUseCase: GetHolidayUseCase {
    
    private let holidayRepository: HolidayRepository
    
    init(holidayRepository: HolidayRepository) {
        self.holidayRepository = holidayRepository
    }
    
    func execute(params: Int) -> Promise<Holiday> {
        return holidayRepository.getHoliday(year: params)
    }
}
