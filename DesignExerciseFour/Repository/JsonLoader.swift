//
//  JsonLoader.swift
//  DesignExerciseFour
//
//  Created by Yomismista on 23/3/25.
//

import Foundation

protocol JsonLoader {
    
}

extension JsonLoader {
    func load<T>(url: URL, type: T.Type) throws -> T where T:Codable {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(type, from: data)
    }
}
