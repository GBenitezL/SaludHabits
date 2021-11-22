//
//  Comidas.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Comidas: Habito {
    var tipoComida : [Int] = [1, 2, 3]
    
    init(activo : Bool, desc : String, completo : Bool,
         horas : [DateComponents], icon : String) {
        super.init(activo: activo, desc: desc, completo: completo,
                   horas: horas, numHabito: 3, icon: icon)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        tipoComida =  try values.decode([Int].self, forKey: .tipoComida)
    }

    
    /* Necesario para Codable */
    private enum CodingKeys : String, CodingKey {
            case tipoComida
    }

    override func encode(to encoder: Encoder) throws {
           try super.encode(to: encoder)
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(tipoComida, forKey: .tipoComida)
    }
    
    
    func completarComida(tipoComida : Int) {
        
    }
    
    func mostrarReceta(tipoComida : Int) {
        
    }

}
