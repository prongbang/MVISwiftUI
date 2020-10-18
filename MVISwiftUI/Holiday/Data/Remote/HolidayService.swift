//
//  HolidayApi.swift
//  MVISwiftUI
//
//  Created by Endtry on 18/10/2563 BE.
//

import Foundation
import Promises
import Moya

enum HolidayService {
    case getHoliday(year: Int)
}

extension HolidayService: TargetType {
    var baseURL: URL {
        return URL(string: "https://financial-holiday.prongbang.now.sh")!
    }
    
    var path: String {
        switch self {
        case .getHoliday(_):
            return "v1/financial-holiday"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getHoliday(_):
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getHoliday(_):
            return "{\"january\": { \"1\": \"วันขึ้นปีใหม่\" }}".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .getHoliday(let year):
            return .requestParameters(parameters: ["year": year], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}
