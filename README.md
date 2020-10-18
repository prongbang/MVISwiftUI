#  MVI SwiftUI

## Model

```swift
typealias Holiday = [String:[String:String]]
```

## View

```swift
import SwiftUI

struct HolidayView: View {
    
    @ObservedObject var viewModel = HolidayViewModel()
    
    var body: some View {
        NavigationView {
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
            .navigationBarTitle("BANK HOLIDAY TH")
        }
        .onAppear {
            self.viewModel.process(intent: .GetHoliday(2563))
        }
    }
}
```

## Intent

```swift
self.viewModel.process(intent: .GetHoliday(2563))
```

## Preview

![Image](/Screenshot/screenshot.png)

