
![2024-06-30 17 28 54](https://github.com/YamamotoDesu/ObservableArchitecture/assets/47273077/e82ebf04-5f3b-4a05-8bc8-28f66b84db40)

```swift
//
//  ContentView.swift
//  SneakPeak
//
//  Created by Yamamoto Kyo on 2024/06/30.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct CounterFeature {
    @ObservableState
    struct State {
        var count = 0
        var isObservingCount = true
    }
    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
        case toggleIsObservingCount
    }
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1
                return .none
            case .incrementButtonTapped:
                state.count += 1
                return .none
            case .toggleIsObservingCount:
                state.isObservingCount.toggle()
                return .none
            }
        }
    }
}

struct ContentView: View {
    let store: StoreOf<CounterFeature>

    var body: some View {
        WithPerceptionTracking { // For iOS 15
            let _ = Self._printChanges()
            if self.store.isObservingCount {
                Text(self.store.count.description)
            }
            Button("Decrement") {
                self.store.send(.decrementButtonTapped)
            }
            Button("Increment") {
                self.store.send(.incrementButtonTapped)
            }
            Button("Toggle count observation") {
                self.store.send(.toggleIsObservingCount)
            }
        }
    }
}

#Preview {
  ContentView(
    store: Store(initialState: CounterFeature.State()) {
      CounterFeature()
    }
  )
}


```
