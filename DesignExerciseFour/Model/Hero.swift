//
//  Hero.swift
//  DesignExerciseFour
//
//  Created by Yomismista on 23/3/25.
//

import Foundation



//, Identifiable
//, Hashable, Equatable
struct Hero: Codable, Identifiable {
    let id = UUID()
    let nombreReal: String
    let apodo: String
    let description: String
    let edad: Int
    let poderes: [String]// StringPoderesSuperHeroes
    let imagen: String
    
    enum CodingKeys: String, CodingKey {
        case nombreReal, apodo, description, edad, poderes, imagen
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.nombreReal = try container.decode(String.self, forKey: .nombreReal)
        self.apodo = try container.decode(String.self, forKey: .apodo)
        self.description = try container.decode(String.self, forKey: .description)
        self.edad = try container.decode(Int.self, forKey: .edad)
        
        //let poderes = try container.decode([String].self, forKey: .poderes)
        //self.poderes = .init(rawValue: poderes)
        self.poderes = try container.decode([String].self, forKey: .poderes)
        self.imagen = try container.decode(String.self, forKey: .imagen)
    }
}
//
//extension Hero: Hashable, Equatable {
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//}

enum PoderesSuperheroes: String, Codable {
    case telepatia = "Telepatía"
    case vuelo = "Vuelo"
    case superFuerza = "Super Fuerza"
    case invisibilidad = "Invisibilidad"
    case teletransportacion = "Teletransportación"
    case manipulacionDelTiempo = "Manipulación del Tiempo"
    case controlElemental = "Control Elemental"
    case duplicacion = "Duplicación"
    case imitacionDeSonido = "Imitación de Sonido"
    case amplificacionDelSonido = "Amplificación del Sonido"
    case generacionDeVibraciones = "Generación de Vibraciones"
    case controlDeVibraciones = "Control de Vibraciones"
    case manipulacionDeLaLuz = "Manipulación de la Luz"
    case emisionDeLuz = "Emisión de Luz"
    case giroRapido = "Giro Rápido"
    case creacionDeTornados = "Creación de Tornados"
    case manipulacionDeLaTierra = "Manipulación de la Tierra"
    case creacionDeRocas = "Creación de Rocas"
    case manipulacionDelClima = "Manipulación del Clima"
    case manipulacionMental = "Manipulación Mental"
    case invulnerabilidad = "Invulnerabilidad"
    case pielMetalica = "Piel Metálica"
    case manipulacionDelAgua = "Manipulación del agua"
    case comunicacionConVidaMarina = "Comunicación con vida marina"
    case transformacionEnFormaAcuatica = "Transformación en forma acuática"
    case manipulacionDeSombras = "Manipulación de sombras"
    case teletransportacionATravesDeSombras = "Teletransportación a través de sombras"
    case regeneracion = "Regeneración"
    case manipulacionDelFuego = "Manipulación del fuego"
}
