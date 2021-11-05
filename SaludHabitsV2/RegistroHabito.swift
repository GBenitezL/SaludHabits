//
//  RegistroHabito.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class RegistroHabito: NSObject, Codable {
    var fecha : Date!
    var numHabito : Int!
    var completo : Bool!
    
    init(fecha : Date, numHabito : Int, completo : Bool) {
        self.fecha = fecha
        self.numHabito = numHabito
        self.completo = completo
    }
    
    private enum CodingKeys : String, CodingKey {
            case fecha
            case numHabito
            case completo
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fecha, forKey: .fecha)
        try container.encode(numHabito, forKey: .numHabito)
        try container.encode(completo, forKey: .completo)
    }
    
    func recopilarRegistros() {
        
    }
    
    func cuantificarRegistros() {
        
    }
    
    func obtenerDatosHabito() {
        
    }

}
