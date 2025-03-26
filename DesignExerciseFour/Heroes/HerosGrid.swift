//
//  SrollView.swift
//  DesignExerciseFour
//
//  Created by Yomismista on 23/3/25.
//

import SwiftUI

struct HerosGrid: View {
    let repository : DataRepository
    var heroes : [Hero]
    
    init(repository: DataRepository = Repository()) {
        self.repository = repository
        do {
            self.heroes = try repository.getHeroes()
            print("he cargado estos heroes:",self.heroes.count)
        } catch {
            self.heroes = []
        }
    }
    
    let fixedItems: [GridItem] = [GridItem(.fixed(90)), GridItem(.fixed(90)), GridItem(.fixed(90)), GridItem(.fixed(90))]
    
    var body: some View {
        NavigationStack {
            LazyVStack{// ScrollView..carga todos los elementos a la vez
                Spacer(minLength: CGFloat(48.0))
                LazyVGrid(columns: fixedItems) {
                    ForEach(heroes) { hero in
                        NavigationLink(value: hero) {
                            HeroAvatar(hero: hero)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .safeAreaPadding()
            .navigationTitle("Super Heros")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Hero.self) { hero in
                HeroDetailView(hero: hero)
                //HeroDetailViewData
            }
        }
    }
}


#Preview {
    NavigationView {
        HerosGrid()//repository: MockRepository()
    }
}
