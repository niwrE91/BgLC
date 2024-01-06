//
//  HeartView.swift
//  BgLC
//
//  Created by Erwin Warkentin on 06.01.24.
//

import SwiftUI

struct Heart: Identifiable {
    var id: Int
    var isFilled: Bool
}

struct HeartView: View {
    @State private var lifeCount: Int
    @State private var hearts: [Heart]
    
    init(lifeCount: Int) {
        self.lifeCount = lifeCount
        self.hearts = (0..<lifeCount).map { Heart(id: $0, isFilled: true) }
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(hearts) { heart in
                Image(systemName: self.heartImageName(isFilled: heart.isFilled))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
                    .onTapGesture {
                        self.toggleHeart(heart: heart)
                    }
            }
        }
        .padding()
    }
    
    private func heartImageName(isFilled: Bool) -> String {
        return isFilled ? "heart.fill" : "heart"
    }
    
    private func toggleHeart(heart: Heart) {
        if let index = hearts.firstIndex(where: { $0.id == heart.id }) {
            hearts[index].isFilled.toggle()
            hearts.sort(by: { $0.isFilled && !$1.isFilled })
        }
    }
}

struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartView(lifeCount: 6)
    }
}
