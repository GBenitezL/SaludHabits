//
//  FrutasVerduras.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class FrutasVerduras: Habito {
    var numRaciones : Int!
    
    init(a : Bool, d : String, c : Bool, h : [DateComponents], i : String) {
        self.numRaciones = 0
        super.init(a: a, d: d, c: c, h: h, n: 5, i: i)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        numRaciones =  try values.decode(Int.self, forKey: .numRaciones)
    }
    
   
    
    /* Necesario para Codable */
    private enum CodingKeys : String, CodingKey {
            case numRaciones
    }

    override func encode(to encoder: Encoder) throws {
           try super.encode(to: encoder)
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(numRaciones, forKey: .numRaciones)
    }
    
    func completar() {
        
    }
}
