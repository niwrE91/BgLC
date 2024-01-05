//
//  Counter.swift
//  BgLC
//
//  Created by Erwin Warkentin on 29.12.23.
//

import SwiftUI

struct IndividuallCountSelectorView: View {
    @ObservedObject var counterViewModel: CounterModel
    var individual: IndividualsModel
    var batteryColor: Color = .green
    var buttonSize: Double = 40
    
    var body: some View {
        ZStack{
            Image(systemName: "battery.100")
                .resizable()
                .frame(minWidth: 230, maxWidth: 360, minHeight: 220, maxHeight: 180)
                .foregroundColor(batteryColor)
            
            HStack(spacing: 20){
                
                VStack(spacing: 5) {
                    Text(individual.name)
                        .font(
                            .system(size: 25, weight: .heavy, design: .default))
                    
                    HStack(spacing: -15) {
                        Button(action: {
                            self.counterViewModel.decrement()
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: buttonSize, height: buttonSize)
                        }
                        .padding()
                        .disabled(counterViewModel.count == 0)
                        .opacity(counterViewModel.count == 0 ? 0.4 : 1)
                        
                        Text("\(counterViewModel.count)")
                            .font(.title)
                            .frame(width: 50)
                        
                        Button(action: {
                            self.counterViewModel.increment()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: buttonSize, height: buttonSize)
                        }
                        .padding()
                        .disabled(counterViewModel.count == 6)
                        .opacity(counterViewModel.count == 6 ? 0.4 : 1)
                    }
                    .frame(minWidth: 180)
                }
                Image(systemName: individual.imageName ?? "person.2")
                    .font(.system(size: 30))
            }
            .padding([.trailing], 80)
            .padding([.top, .leading], 50)
            .padding(.bottom, 40)
            .offset(x: -15)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IndividuallCountSelectorView(counterViewModel: CounterModel(), individual: IndividualsModel(name: "Oponant", count: 0, imageName: "person.2"), batteryColor: .blue)
    }
}
