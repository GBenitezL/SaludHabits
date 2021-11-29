//
//  Meditacion.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Meditacion: Habito {
    
    init(activo : Bool, desc : String, completo : Bool,
         horas : [DateComponents], icon : String) {
        super.init(activo: activo, desc: desc, completo: completo,
                   horas: horas, numHabito: 6, icon: icon)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
   
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
    
    func conectarSpotify() {
        
    }
    
    func resetMeditacionHabit(){
        var habitos = [Habito]()
        do {
            let data = try Data(contentsOf: dataFileURLHabitos())
            habitos = try PropertyListDecoder().decode([Habito].self, from: data)
        }
        
        catch {
            print("Error al cargar el archivo")
        }
        habitos[5].completo = false
        do {
            let data = try PropertyListEncoder().encode(habitos)
                try data.write(to: dataFileURLHabitos())
        }
        catch {
            print("Error al escribir en el archivo")
        }
    }
    
}
