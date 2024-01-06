//
//  HeartView.swift
//  BgLC
//
//  Created by Erwin Warkentin on 06.01.24.
//

import SwiftUI

struct HeartView: View {
    @State private var lifeCount: Int
    
    init(lifeCount: Int) {
        self.lifeCount = lifeCount
    }

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<lifeCount) { index in
                Image(systemName: self.heartImageName(index: index))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
                    .onTapGesture {
                        self.toggleHeart(index: index)
                    }
            }
        }
        .padding()
    }

    private func heartImageName(index: Int) -> String {
        return index < lifeCount ? "heart.fill" : "heart"
    }

    private func toggleHeart(index: Int) {
        if index < lifeCount {
            lifeCount -= 1
        } else if index >= lifeCount {
            lifeCount += 1
        }
    }
}

struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartView(lifeCount: 6)
    }
}
