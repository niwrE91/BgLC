//
//  ContentView.swift
//  BgLC
//
//  Created by Erwin Warkentin on 29.12.23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        VStack(spacing: 150) {
            HStack(spacing: 40){
                VStack(spacing: 30){
                    Text("Spieler")
                    HStack(spacing: 15){
                        Button(action: {
                                  print("button pressed")

                                }) {
                                    Image(systemName: "minus.circle.fill")
                                    .renderingMode(.original)
                                }
                        Text("3")
                        Button(action: {
                                  print("button pressed")

                                }) {
                                    Image(systemName: "plus.circle.fill")
                                    .renderingMode(.original)
                                }
                    }
                }
                Image(systemName: "person.2")
            }.background(
                Image(systemName: "battery.0")
                .resizable()
                .scaledToFill()
                .frame(width: 300)
            )
            HStack(spacing: 40){
                VStack(spacing: 30){
                    Text("Gegner")
                    HStack(spacing: 15){
                        Button(action: {
                                  print("button pressed")

                                }) {
                                    Image(systemName: "minus.circle.fill")
                                    .renderingMode(.original)
                                }
                        Text("3")
                        Button(action: {
                                  print("button pressed")

                                }) {
                                    Image(systemName: "plus.circle.fill")
                                    .renderingMode(.original)
                                }
                    }
                }
                Image(systemName: "person.icloud")
            }
            .background(
                Image(systemName: "battery.0")
                .resizable()
                .scaledToFill()
                .frame(width: 300)
            )
            Button("Bestätigen") {
                print("Done")
            }
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
