//
//  Pasos.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Pasos: Habito {
    var pasosDia : Int!
    
    init(a : Bool, d : String, c : Bool, h : [DateComponents], i : String) {
        self.pasosDia = 0
        super.init(a: a, d: d, c: c, h: h, n: 9,i: i)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        pasosDia =  try values.decode(Int.self, forKey: .pasosDia)
    }
    
   
    
    /* Necesario para Codable */
    private enum CodingKeys : String, CodingKey {
            case pasosDia
    }

    override func encode(to encoder: Encoder) throws {
           try super.encode(to: encoder)
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(pasosDia, forKey: .pasosDia)
    }
    
    func registrarPasos(pasos: Int) {
        
    }
    
    func completar() {
        
    }
}
