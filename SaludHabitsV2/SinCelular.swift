//
//  SinCelular.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class SinCelular: Habito {
    
    init(activo : Bool, desc : String, completo : Bool,
         horas : [DateComponents], icon : String) {
        super.init(activo: activo, desc: desc, completo: completo,
                   horas: horas, numHabito: 2, icon: icon)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
   

    override func encode(to encoder: Encoder) throws {
           try super.encode(to: encoder)
    }
}
