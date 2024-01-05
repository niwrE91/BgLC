//
//  Counter.swift
//  BgLC
//
//  Created by Erwin Warkentin on 29.12.23.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject var counterViewModel: CounterViewModel
    var individual: IndividualsModel
    var batteryColor: Color = .green
    var buttonSize: Double = 40
    
    var body: some View {
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
            }
            Image(systemName: individual.imageName ?? "person.2").font(.system(size: 40))
        }
        .padding([.trailing], 80)
        .padding([.top, .leading], 50)
        .padding(.bottom, 40)
        .background(
            Image(systemName: "battery.100")
                .resizable()
                .aspectRatio(16/9, contentMode: .fit)
                .foregroundColor(batteryColor)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(counterViewModel: CounterViewModel(), individual: IndividualsModel(name: "Oponant", count: 0, imageName: "person.2"), batteryColor: .blue)
    }
}
