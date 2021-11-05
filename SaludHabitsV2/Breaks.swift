//
//  Breaks.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Breaks: Habito {
    var numBreaks : Int!
    
    init(a : Bool, d : String, c : Bool, h : [DateComponents], i : String) {
        self.numBreaks = 0
        super.init(a: a, d: d, c: c, h: h, n: 4, i: i)
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
