//
//  ContentView.swift
//  BgLC
//
//  Created by Erwin Warkentin on 29.12.23.
//

import SwiftUI

struct MainView: View {
    @StateObject var personIndividualModel = IndividualsModel(name: "Person", count: 0, imageName: "person.fill.badge.plus")
    @StateObject var opponentIndividualModel = IndividualsModel(name: "Oponant", count: 0, imageName: "person.crop.circle.badge.exclamationmark")
    @State var showingSettings = false
    
    var body: some View {
        NavigationView {
            List {
                
                Text("\(personIndividualModel.count)")
                
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
