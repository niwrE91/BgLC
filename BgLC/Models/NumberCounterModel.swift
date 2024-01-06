//
//  CounterViewModel.swift
//  BgLC
//
//  Created by Erwin Warkentin on 29.12.23.
//

import SwiftUI

class NumberCounterModel: ObservableObject {
    
    func incrementByOne(number: Int) -> Int{
        var newNumber = number
        newNumber += 1
        
        return newNumber
    }
    
    func decrementByOne(number: Int) -> Int{
        var newNumber = number
        newNumber -= 1
        
        return newNumber
    }
}
