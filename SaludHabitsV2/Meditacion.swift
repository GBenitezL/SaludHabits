//
//  Meditacion.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Meditacion: Habito {
    
    init(a : Bool, d : String, c : Bool, h : [DateComponents], i : String) {
        super.init(a: a, d: d, c: c, h: h, n: 6, i: i)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
   
    override func encode(to encoder: Encoder) throws {
           try super.encode(to: encoder)
    }
    
    func conectarSpotify() {
        
    }
    
    func completar() {
        
    }

}
