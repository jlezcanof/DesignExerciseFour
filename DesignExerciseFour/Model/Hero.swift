//
//  Hero.swift
//  DesignExerciseFour
//
//  Created by Yomismista on 23/3/25.
//

import Foundation

enum PoderesSuperheroes: String, Codable, CaseIterable {
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


// Hashable, Equatable
struct Hero: Codable, Identifiable {
    let id = UUID()
    let nombreReal: String
    let apodo: String
    let descripcion: String
    let edad: Int
    let poderes: [PoderesSuperheroes]
    let imagen: String
    private let historia: String
    
    enum CodingKeys: String, CodingKey {
        case nombreReal, apodo, descripcion, edad, poderes, imagen, historia
    }
    
    init(nombreReal: String, apodo: String, descripcion: String, edad: Int, poderes: [PoderesSuperheroes], imagen: String) {
        self.nombreReal = nombreReal
        self.apodo = apodo
        self.descripcion = descripcion
        self.edad = edad
        self.poderes = poderes
        self.imagen = imagen
        self.historia = ""
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.nombreReal = try container.decode(String.self, forKey: .nombreReal)
        self.apodo = try container.decode(String.self, forKey: .apodo)
        
        let historia = try container.decodeIfPresent(String.self, forKey: .historia)
        self.historia = historia == nil ? "" : historia!
        
        let descripcion = try container.decodeIfPresent(String.self, forKey: .descripcion)
        
        if let descripcion = descripcion {
            self.descripcion = descripcion
        } else if let historia = historia {
            self.descripcion = historia
        } else {
            self.descripcion = ""
        }
        
        self.edad = try container.decode(Int.self, forKey: .edad)
        let poderes = try container.decode([String].self, forKey: .poderes)
        self.poderes = try poderes.map {
            guard let poder = PoderesSuperheroes(rawValue: $0) else {
                throw DecodingError.dataCorruptedError(forKey: .poderes, in: container, debugDescription: "Poder inválido: \($0)")
            }
            return poder
        }
        self.imagen = try container.decode(String.self, forKey: .imagen)
    }

}



extension Hero: Hashable{//, Equatable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Hero {
    static let test = Hero(nombreReal: "Juan teclado", apodo: "Anacleto", descripcion: "Después de un accidente en un laboratorio de neurociencia, Juan adquirió la capacidad de leer y manipular pensamientos.", edad: 40, poderes: [.telepatia], imagen: "telemente")
}

//
