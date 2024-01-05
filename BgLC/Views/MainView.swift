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
    @State var showingSettings = false
    
    var body: some View {
        NavigationView {
            List {
                
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
                            SettingsView()
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
