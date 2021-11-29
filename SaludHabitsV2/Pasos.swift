//
//  Pasos.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Pasos: Habito {
    var pasosDia : Int!
    
    init(activo : Bool, desc : String, completo : Bool,
         horas : [DateComponents], icon : String) {
        self.pasosDia = 0
        super.init(activo: activo, desc: desc, completo: completo,
                   horas: horas, numHabito: 9, icon: icon)
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
    
    func resetPasos(){
        let defaults = UserDefaults.standard
        defaults.set(0, forKey: "pasos")
        defaults.set(0, forKey: "objPasos")
    }
}
