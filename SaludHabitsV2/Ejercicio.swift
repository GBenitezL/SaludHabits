//
//  Ejercicio.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Ejercicio: Habito {
    var tiempo : Int! // En minutos
    
    init(a : Bool, d : String, c : Bool, h : [DateComponents], t : Int!, i : String) {
        self.tiempo = t
        super.init(a: a, d: d, c: c, h: h, n: 1, i: i)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        tiempo =  try values.decode(Int.self, forKey: .tiempo)
        
        
    }
    
   
    
    /* Necesario para Codable */
    private enum CodingKeys : String, CodingKey {
            case tiempo
    }

    override func encode(to encoder: Encoder) throws {
           try super.encode(to: encoder)
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(tiempo, forKey: .tiempo)
    }
    

    
    func completar() {
        
    }

}
