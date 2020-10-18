//
//  HolidayDataSource.swift
//  MVISwiftUI
//
//  Created by Endtry on 18/10/2563 BE.
//

import Promises

protocol HolidayDataSource {
    func getHoliday(year: Int) -> Promise<Holiday>
}
