//
//  ContentView.swift
//  BgLC
//
//  Created by Erwin Warkentin on 29.12.23.
//

import SwiftUI

struct MainView: View {
    @StateObject private var personCounterViewModel = CounterViewModel()
    @StateObject private var opponentCounterViewModel = CounterViewModel()
    
    var body: some View {
        NavigationView {
            List {

                VStack(spacing: 50) {
                    
                    CounterView(counterViewModel: personCounterViewModel, individual: IndividualsModel(name: "Spieler", count: 0, imageName: "person.2"))
                    
                    CounterView(counterViewModel: opponentCounterViewModel, individual: IndividualsModel(name: "Gegner", count: 0, imageName: "person.crop.circle.badge.exclamationmark.fill"), batteryColor: .red)
                    
                }
                .padding()
                .navigationTitle("BgLC")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("Gear")
                        }) {
                            Image(systemName: "gearshape")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                }
            }
            .frame(alignment: .center)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
