//
//  FrutasVerduras.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class FrutasVerduras: Habito {
    var numRaciones : Int!
    
    init(activo : Bool, desc : String, completo : Bool,
         horas : [DateComponents], icon : String) {
        self.numRaciones = 0
        super.init(activo: activo, desc: desc, completo: completo,
                   horas: horas, numHabito: 5, icon: icon)
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

    func resetFrutasVerdurasHabit(){
        var habitos = [Habito]()
        do {
            let data = try Data(contentsOf: dataFileURLHabitos())
            habitos = try PropertyListDecoder().decode([Habito].self, from: data)
        }
        
        catch {
            print("Error al cargar el archivo")
        }
        habitos[4].completo = false
        do {
            let data = try PropertyListEncoder().encode(habitos)
                try data.write(to: dataFileURLHabitos())
        }
        catch {
            print("Error al escribir en el archivo")
        }
        
        let defaults = UserDefaults.standard
        defaults.set(0, forKey: "contador")
        
        
    }
}
