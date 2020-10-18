//
//  HolidayApi.swift
//  MVISwiftUI
//
//  Created by Endtry on 18/10/2563 BE.
//

import Foundation
import Promises
import Moya

protocol HolidayApi {
    func getHoliday(year: Int) -> Promise<Holiday>
}

class HttpHolidayApi: HolidayApi {
    
    private let holidayProvider: MoyaProvider<HolidayService>
    
    init(holidayProvider: MoyaProvider<HolidayService>) {
        self.holidayProvider = holidayProvider
    }
    
    func getHoliday(year: Int) -> Promise<Holiday> {
        
        return Promise { (resolve, reject) in
            self.holidayProvider.request(.getHoliday(year: year)) { result in
                switch result {
                case .success(let response):
                    switch response.statusCode {
                    case 200...299:
                        let json: Holiday = try! JSONDecoder().decode(Holiday.self, from: response.data)
                        resolve(json)
                    default:
                        reject(NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey : response.description]))
                    }
                case .failure(let error):
                    reject(NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey : error.localizedDescription]))
                }
            }
        }
    }
}
