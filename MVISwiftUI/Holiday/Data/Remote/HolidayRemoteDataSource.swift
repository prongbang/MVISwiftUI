//
//  HolidayRemoteDataSource.swift
//  MVISwiftUI
//
//  Created by Endtry on 18/10/2563 BE.
//

import Promises
import Moya

class HolidayRemoteDataSource: HolidayDataSource {
    
    private let holidayApi: HolidayApi
    
    init(holidayApi: HolidayApi) {
        self.holidayApi = holidayApi
    }
    
    func getHoliday(year: Int) -> Promise<Holiday> {
        return holidayApi.getHoliday(year: year)
    }
}
