//
//  IndividualsModel.swift
//  BgLC
//
//  Created by Erwin Warkentin on 29.12.23.
//

import Foundation

// MARK: - IndividualsCounter
class IndividualsModel: ObservableObject {
    @Published var name: String = ""
    @Published var count: Double = 0.0
    @Published var imageName: String = ""
    
    init(name: String, count: Double, imageName: String) {
        self.name = name
        self.count = count
        self.imageName = imageName
    }
}
