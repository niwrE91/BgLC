//
//  ContentView.swift
//  BgLC
//
//  Created by Erwin Warkentin on 29.12.23.
//

import SwiftUI

struct MainView: View {
    @StateObject private var personIndividualModel = IndividualsModel(name: "Person", count: 0, imageName: "person.fill.badge.plus")
    @StateObject private var opponentIndividualModel = IndividualsModel(name: "Oponant", count: 0, imageName: "person.crop.circle.badge.exclamationmark")
    @State private var showingSettings = false
    
    var body: some View {
        NavigationView {
            List {
                
                Text("\(personIndividualModel.count)")
                HeartView(lifeCount: 8)
                
                VStack(spacing: 50) {
                    
                }
                .navigationTitle("BgLC")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            self.showingSettings.toggle()
                        }) {
                            Image(systemName: "gearshape")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        .sheet(isPresented: $showingSettings) {
                            SettingsView(personIndividualModel: personIndividualModel, opponentIndividualModel: opponentIndividualModel)
                        }
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
