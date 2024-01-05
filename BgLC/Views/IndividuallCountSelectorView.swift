//
//  Counter.swift
//  BgLC
//
//  Created by Erwin Warkentin on 29.12.23.
//

import SwiftUI

struct IndividuallCountSelectorView: View {
    
    @State private var individual: IndividualsModel
    
    init(individual: IndividualsModel) {
        self.individual = individual
    }
    
    private var counterViewModel = NumberCounterModel()
    private var buttonSize: Double = 40
    
    var body: some View {
        ZStack{
            Image(systemName: "battery.100")
                .resizable()
                .frame(minWidth: 230, maxWidth: 360, minHeight: 180, maxHeight: 220)
                .foregroundColor(Color(red: getRandomNumber(), green: getRandomNumber(), blue: getRandomNumber()))
            
            HStack(spacing: 20){
                
                VStack(spacing: 5) {
                    Text(individual.name)
                        .font(
                            .system(size: 25, weight: .heavy, design: .default))
                    
                    HStack(spacing: -15) {
                        Button(action: {
                            individual.count = counterViewModel.decrementByOne(number: individual.count)
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: buttonSize, height: buttonSize)
                        }
                        .padding()
                        .disabled(individual.count == 0)
                        .opacity(individual.count == 0 ? 0.4 : 1)
                        
                        Text(String(format: "%.0f",individual.count))
                            .font(.title)
                            .frame(width: 50)
                        
                        Button(action: {
                            individual.count = counterViewModel.incrementByOne(number: individual.count)
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: buttonSize, height: buttonSize)
                        }
                        .padding()
                        .disabled(individual.count == 6)
                        .opacity(individual.count == 6 ? 0.4 : 1)
                    }
                    .frame(minWidth: 180)
                }
                Image(systemName: individual.imageName )
                    .font(.system(size: 30))
            }
            .padding([.trailing], 80)
            .padding([.top, .leading], 50)
            .padding(.bottom, 40)
            .offset(x: -15)
        }
        
    }
    
    private func getRandomNumber() -> Double {
        return Double.random(in: 0...1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IndividuallCountSelectorView(individual: IndividualsModel(name: "Erwin", count: 0, imageName: "internaldrive.fill"))
    }
}
