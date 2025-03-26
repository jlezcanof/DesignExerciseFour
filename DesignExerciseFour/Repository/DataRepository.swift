//
//  DataRepository.swift
//  DesignExerciseFour
//
//  Created by Yomismista on 23/3/25.
//

import Foundation


struct Repository: DataRepository {}


protocol DataRepository: JsonLoader, Sendable {
    
    var url: URL { get }
    
    func getHeroes() throws -> [Hero]
    
}

extension DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "SuperHeroes", withExtension: "json")!
    }
    
    func getHeroes() throws -> [Hero] {
        print("url es: ",url)

        //if FileManager.default.fileExists(atPath: url.path()) {
        return try load(url: url, type: [Hero].self)
    }
}

//} else {
//    print("no existe el fichero indicado")
//}
//return []

//        let heroes = try load(url: url, type: [Hero].self)
//        print("numero de heroes: \(heroes.count)")
//        return heroes
//}

struct MockRepository: DataRepository {
    func getHeroes() throws -> [Hero] {
        return [Hero(nombreReal: "Mock", apodo: "Test", descripcion: "Descripción de prueba", edad: 30, poderes: [.telepatia], imagen: "telemente")]
    }
}
