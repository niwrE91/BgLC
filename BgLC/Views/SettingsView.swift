//
//  SettingsView.swift
//  BgLC
//
//  Created by Erwin Warkentin on 31.12.23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var personCounterViewModel = CounterViewModel()
    @StateObject private var opponentCounterViewModel = CounterViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 50) {
                
                CounterView(counterViewModel: personCounterViewModel, individual: IndividualsModel(name: "Player", count: 0, imageName: "person.2"), batteryColor: .indigo)
                
                CounterView(counterViewModel: opponentCounterViewModel, individual: IndividualsModel(name: "Oponant", count: 0, imageName: "person.crop.circle.badge.exclamationmark.fill"), batteryColor: .brown)
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Done")
                }
                .font(.system(size: 30))
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
