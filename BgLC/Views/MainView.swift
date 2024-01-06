//
//  ContentView.swift
//  BgLC
//
//  Created by Erwin Warkentin on 29.12.23.
//

import SwiftUI

struct MainView: View {
    @StateObject private var personIndividualModel = IndividualsModel(
        name: "Person",
        count: 1,
        imageName: "person.fill.badge.plus")
    @StateObject private var opponentIndividualModel = IndividualsModel(
        name: "Oponant",
        count: 1,
        imageName: "person.crop.circle.badge.exclamationmark")
    @State private var showingSettings = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Players")) {
                    ForEach(0..<personIndividualModel.count, id: \.self) { index in
                        
                        Text("Person \(index + 1)")
                        HeartView(lifeCount: 8)
                    }
                }
                
                Section(header: Text("Opponents")) {
                    ForEach(0..<opponentIndividualModel.count, id: \.self) { index in
                        
                        Text("Opponant \(index + 1)")
                        HeartView(lifeCount: 8)
                    }
                }
            }
            .navigationTitle("BgLC")
            .navigationBarTitleDisplayMode(.inline)
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
