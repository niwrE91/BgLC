//
//  CounterViewModel.swift
//  BgLC
//
//  Created by Erwin Warkentin on 29.12.23.
//

import SwiftUI

class CounterModel: ObservableObject {
    @Published var count = 0

    func increment() {
        if count < 6 {
            count += 1
        }
    }

    func decrement() {
        if count > 0 {
            count -= 1
        }
    }
}
