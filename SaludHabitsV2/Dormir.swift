//
//  Dormir.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Dormir: Habito {
    var horarioInicial : DateComponents!
    var horarioFinal : DateComponents!
    
    init(a : Bool, d : String, c : Bool, h : [DateComponents], i : DateComponents, f : DateComponents, icon : String) {
        self.horarioInicial = i
        self.horarioFinal = f
        super.init(a: a, d: d, c: c, h: h, n: 8, i: icon)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        horarioInicial =  try values.decode(DateComponents.self, forKey: .horarioInicial)
        horarioFinal   =  try values.decode(DateComponents.self, forKey: .horarioFinal)
        
        
    }
    
   
    
    /* Necesario para Codable */
    private enum CodingKeys : String, CodingKey {
            case horarioInicial
            case horarioFinal
    }

    override func encode(to encoder: Encoder) throws {
           try super.encode(to: encoder)
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(horarioInicial, forKey: .horarioInicial)
           try container.encode(horarioFinal, forKey: .horarioFinal)
    }
    
    
    func cambiarHorario (inicio : DateComponents, final : DateComponents) {
        
    }
    
    func completar() {
        
    }
}
