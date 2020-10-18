//
//  HolidayViewModel.swift
//  MVISwiftUI
//
//  Created by Endtry on 18/10/2563 BE.
//

import Foundation
import Combine
import Resolver

class HolidayViewModel: ObservableObject {
    
    @Published var state: HolidayState = .Init
    
    @Injected var getHolidayUseCase: GetHolidayUseCase
    
    func process(intent: HolidayIntent) {
        switch intent {
        case HolidayIntent.GetHoliday(let year):
            self.state = .Loading
            getHolidayUseCase.execute(params: year).then { holiday in
                self.state = .Fetched(holiday)
            }.catch { (error) in
                self.state = .Error(error.localizedDescription)
            }
        }
    }
}
