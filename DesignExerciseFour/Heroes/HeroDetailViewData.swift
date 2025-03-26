//
//  HeroDetailViewData.swift
//  DesignExerciseFour
//
//  Created by Yomismista on 23/3/25.
//

import SwiftUI

private func poderesString(_ poderes: [PoderesSuperheroes]) -> [String] {
    poderes.map{$0.rawValue}
}

struct HeroDetailViewData: View {
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
        
        VStack {//ScrollView
            VStack {
                Text(hero.apodo)//"Detail info hero"
                    .font(.largeTitle)
                    .bold()
                    .padding()
            }
            HStack(alignment: .top, spacing: 0.0) {
                
//                Section {
//                    LabeledContent("Nombre real", value: hero.nombreReal)
//                    LabeledContent("Edad", value: "\(hero.edad)")
//                } header: {
//                    Text("Información General")
//                }
                
                VStack {// (alignment: .leading)
                    HStack(alignment: .firstTextBaseline)  {
                        Text("Nombre real:")
                            .font(.title)
                            .bold()
                            //.padding(15.0)
                        Text(hero.nombreReal)
                            .font(.title)
                            //.bold()
                            //.padding()
                    }//campos nombre real
                    HStack(alignment: .top) {
                        Text("Edad:")
                            .font(.headline)
                            .bold()
                            .padding()
                        Text("\(hero.edad)")
                            .font(.headline)
                            .bold()
                            .padding()
                    }// campo edad
                    
                }//Esto cubrirá los campos nombre real y edad
//                VStack {
//                    Image(hero.imagen)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 150, height: 150 )
//                    //.clipShape(RoundedRectangle(cornerRadius: 10))
//                        .clipShape(Circle())
//                        .shadow(color: .primary.opacity(0.5), radius: 10, x: 0, y: 10)
////                        Text(hero.apodo)
////                        .font(.footnote)
////                        .bold()
//                }
                }//Esto cubre los campos imagen y apodo
                
            }//fin hstack de todo los campos nombre real, edad, imagen y apodo
        VStack (alignment: .leading, spacing: 8) {
            Spacer(minLength: 15.0)
            Text("Superpoderes")
                .font(.headline)
                .fontWeight(.heavy)
                .fontWidth(.expanded)
                .bold()
            ForEach(poderesString(hero.poderes), id: \.self) { poder in
                  Text("• \(poder)")
                      .font(.body)
              }
            Spacer(minLength: 30.0)
            Text("Descripcion")
                .font(.headline)
                .fontWeight(.heavy)
                .fontWidth(.expanded)
                .bold()
            Text(detailDescription)
                .font(.body)
            Spacer(minLength: 20.0)
        }
            
            }
            //.navigationTitle(hero.apodo)
            //.navigationBarTitleDisplayMode(.large)
        }
    
    //}
//}

#Preview {
    HeroDetailViewData(hero: .test)
}

//VStack(alignment: .trailing) {//spacing: 20
//    Image(hero.imagen)
//        .resizable()
//        .scaledToFit()
//        .frame(width: 150 , height: 150)
//    Text(hero.apodo)
//        .font(.footnote)
//        .bold()
//    
//                Text("Detail info hero")
//                    .font(.largeTitle)
//                    .bold()
//                    .padding()
////                Text(hero.nombreReal)
//                    .font(.largeTitle)
//                    .bold()
//                    .padding()
//                    .background(.green.opacity(0.2))
//                    .background(in: .rect(cornerRadius: 10))
//                HeroAvatar(hero: hero)
//                .padding()
//                .background(.purple.opacity(0.2))
//                .background(in: .capsule)
//                NavigationLink(value: "navegacion link") {
//                    Text("navegacion link")
//                }
    
    
