//
//  Agua.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Agua: Habito{
    var numVasos : Int!
    
    init(a : Bool, d : String, c : Bool, h : [DateComponents], i : String) {
        self.numVasos = 0
        super.init(a: a, d: d, c: c, h: h, n: 7, i: i)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        numVasos =  try values.decode(Int.self, forKey: .numVasos)
    
    }
    
    /* Necesario para Codable */
    private enum CodingKeys : String, CodingKey {
            case numVasos
    }

    override func encode(to encoder: Encoder) throws {
           try super.encode(to: encoder)
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(numVasos, forKey: .numVasos)
    }
    
    
    func completar() {
        
    }
}
