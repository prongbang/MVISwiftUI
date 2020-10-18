//
//  HolidayView.swift
//  MVISwiftUI
//
//  Created by Endtry on 18/10/2563 BE.
//

import SwiftUI

struct HolidayView: View {
    
    @ObservedObject var viewModel = HolidayViewModel()
    
    var body: some View {
        Group { () -> AnyView in
            switch viewModel.state {
            case .Init:
                return AnyView(Spacer())
            case .Loading:
                return AnyView(ActivityIndicator(isAnimating: .constant(true), style: .large))
            case .Fetched(let holiday):
                return AnyView(
                    List {
                        ForEach(Array(holiday.keys), id: \.self) { key in
                            VStack(alignment: .leading) {
                                Group {
                                    Text("\(key.uppercased())")
                                        .bold()
                                    ForEach(Array(holiday[key]!.keys), id: \.self) { k in
                                        Text(" \(k)  \(holiday[key]![k]!)")
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                    }
                )
            case .Error(let error):
                return AnyView(Text(error.description))
            }
        }
        .onAppear {
            self.viewModel.process(intent: .GetHoliday(2563))
        }
    }
}

struct HolidayView_Previews: PreviewProvider {
    static var previews: some View {
        HolidayView()
    }
}
