//
//  HolidayRepository.swift
//  MVISwiftUI
//
//  Created by Endtry on 18/10/2563 BE.
//

import Promises

protocol HolidayRepository {
    func getHoliday(year: Int) -> Promise<Holiday>
}

class DefaultHolidayRepository : HolidayRepository {
    
    private let holidayRemoteDataSource: HolidayDataSource
    
    init(holidayRemoteDataSource: HolidayDataSource) {
        self.holidayRemoteDataSource = holidayRemoteDataSource
    }
    
    func getHoliday(year: Int) -> Promise<Holiday> {
        
        return holidayRemoteDataSource.getHoliday(year: year)
    }
}
