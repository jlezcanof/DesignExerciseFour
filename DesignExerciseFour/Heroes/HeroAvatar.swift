//
//  HeroAvatar.swift
//  DesignExerciseFour
//
//  Created by Yomismista on 23/3/25.
//

import SwiftUI

struct HeroAvatar: View {
    let hero: Hero
    
    var body: some View {
        VStack(spacing: 0) {
            Image(hero.imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 85, height: 85)
            Text(hero.apodo)
                .font(.footnote)
                .bold()
        }
        .padding(.vertical, 5)
        .background {
            Color.gray.opacity(0.4)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .primary.opacity(0.5), radius: 10, x: 0, y: 10)    }
}



#Preview {
    HeroAvatar(hero: .test)
}
