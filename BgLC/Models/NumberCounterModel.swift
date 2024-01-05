//
//  CounterViewModel.swift
//  BgLC
//
//  Created by Erwin Warkentin on 29.12.23.
//

import SwiftUI

class NumberCounterModel: ObservableObject {

    func incrementByOne(number: Double) -> Double{
        var newNumber = number
            newNumber += 1
        
        return newNumber
    }

    func decrementByOne(number: Double) -> Double{
        var newNumber = number
            newNumber -= 1
        
        return newNumber
    }
}
