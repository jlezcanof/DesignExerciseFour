//
//  HeroDetailViewData.swift
//  DesignExerciseFour
//
//  Created by Yomismista on 26/3/25.
//

import SwiftUI

private func poderesString(_ poderes: [PoderesSuperheroes]) -> String {
    poderes.map { "• \($0.rawValue)" }.joined(separator: "\n")}

struct HeroDetailView: View {
    let hero: Hero
    
    var detailDescription: AttributedString {
        var atribuido = AttributedString(stringLiteral: hero.descripcion)
        
        if (atribuido == "") {
            atribuido = "No hay descripcion"
            atribuido.foregroundColor = .red
        } else {
            atribuido.foregroundColor = .black
        }
        
        atribuido.font = .systemFont(ofSize: 17, weight: .light)
        atribuido.underlineStyle = .thick
        
        return atribuido
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text(hero.apodo)
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity)
                //.background{Color.green}
            Image(hero.imagen)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 12)
                .cornerRadius(30.0
                )
        }
        Form {//prueba
                Section {

                    LabeledContent("Nombre real", value:hero.nombreReal)
                    //Spacer(minLength: 1.0 )
                    LabeledContent("Edad", value:
                                    "\(hero.edad)")
                    //            LabeledContent("Descripción", value: "\(hero.descripcion)")
                    //Spacer(minLength: 4)
                    
                    LabeledContent("Descripción") {
                        Text(hero.descripcion)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .multilineTextAlignment(.trailing)
                    }
                    //Spacer()
                    
                    LabeledContent("Superpoderes", value:  poderesString(hero.poderes)
                    )

                } header: {
                    Text("Ficha técnica")
                } .padding(.horizontal, 12)
        }//fin form
    }
}

#Preview {
    HeroDetailView(hero: Hero.test)
}
