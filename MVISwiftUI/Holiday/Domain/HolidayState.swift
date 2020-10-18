//
//  HolidayState.swift
//  MVISwiftUI
//
//  Created by Endtry on 18/10/2563 BE.
//

import Foundation

enum HolidayState {
    case Init
    case Loading
    case Fetched(Holiday)
    case Error(String)
}
