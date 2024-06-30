//
//  SneakPeakApp.swift
//  SneakPeak
//
//  Created by Yamamoto Kyo on 2024/06/30.
//

import SwiftUI
import ComposableArchitecture

@main
struct SneakPeakApp: App {
    var body: some Scene {
       WindowGroup {
         ContentView(
           store: Store(
             initialState: CounterFeature.State()
           ) {
             CounterFeature()
           }
         )
       }
     }
}
