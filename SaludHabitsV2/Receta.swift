//
//  Receta.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Receta: NSObject, Codable{
    var id : Int!
    var nombre_platillo : String!
    var ingredientes = [String]()
    var pasos = [String]()
    var imagen : String!
    
    init (id : Int, nombre : String, ingredientes : [String], pasos : [String], imagen : String) {
        self.id = id
        self.nombre_platillo = nombre
        self.ingredientes = ingredientes
        self.pasos = pasos
        self.imagen = imagen
    }

}
