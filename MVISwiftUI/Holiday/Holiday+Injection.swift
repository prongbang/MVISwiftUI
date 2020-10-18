//
//  Holiday+Injection.swift
//  MVISwiftUI
//
//  Created by Endtry on 18/10/2563 BE.
//

import Resolver
import Moya

extension Resolver {
    
    public static func registerHoliday() {
        register{ MoyaProvider<HolidayService>() }
        register{ HttpHolidayApi(holidayProvider: resolve()) as HolidayApi }
        register(name: "HolidayRemoteDataSource") { HolidayRemoteDataSource(holidayApi: resolve()) as HolidayDataSource }
        register{
            DefaultHolidayRepository(
                holidayRemoteDataSource: resolve(name: "HolidayRemoteDataSource")
            ) as HolidayRepository
        }
        register{ DefaultGetHolidayUseCase(holidayRepository: resolve()) as GetHolidayUseCase }
        register{ HolidayViewModel() }
    }
}
