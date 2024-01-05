//
//  SettingsView.swift
//  BgLC
//
//  Created by Erwin Warkentin on 31.12.23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var personIndividualModel: IndividualsModel
    @ObservedObject var opponentIndividualModel: IndividualsModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 50) {
                
                IndividuallCountSelectorView(individual: personIndividualModel)
                
                IndividuallCountSelectorView(individual: opponentIndividualModel)
                
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
        SettingsView(personIndividualModel: IndividualsModel(name: "Erwin", count: 0, imageName: "thermometer.snowflake.circle.fill"), opponentIndividualModel: IndividualsModel(name: "Oponant", count: 0, imageName: "target"))
    }
}
