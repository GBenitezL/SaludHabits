//
//  Breaks.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Breaks: Habito {
    var numBreaks : Int!
    
    init(activo : Bool, desc : String, completo : Bool,
         horas : [DateComponents], icon : String) {
        self.numBreaks = 0
        super.init(activo: activo, desc: desc, completo: completo,
                   horas: horas, numHabito: 4, icon: icon)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        numBreaks =  try values.decode(Int.self, forKey: .numBreaks)
    }
    
   
    /* Necesario para Codable */
    private enum CodingKeys : String, CodingKey {
            case numBreaks
    }

    override func encode(to encoder: Encoder) throws {
           try super.encode(to: encoder)
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(numBreaks, forKey: .numBreaks)
    }
    
    func iniciarTimer() {
        
    }
    
    func completar() {
        
    }

}
