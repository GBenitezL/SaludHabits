//
//  Agua.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Agua: Habito{
    var numVasos : Int!
    
    init(activo : Bool, desc : String, completo : Bool,
         horas : [DateComponents], icon : String) {
        self.numVasos = 0
        super.init(activo: activo, desc: desc, completo: completo,
                   horas: horas, numHabito: 7, icon: icon)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        numVasos =  try values.decode(Int.self, forKey: .numVasos)
    
    }
    
    /* Necesario para Codable */
    private enum CodingKeys : String, CodingKey {
            case numVasos
    }

    override func encode(to encoder: Encoder) throws {
           try super.encode(to: encoder)
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(numVasos, forKey: .numVasos)
    }
    
    func resetAgua(){
             var habitos = [Habito]()
             do {
                 let data = try Data(contentsOf: dataFileURLHabitos())
                 habitos = try PropertyListDecoder().decode([Habito].self, from: data)
             }

             catch {
                 print("Error al cargar el archivo")
             }
             habitos[6].completo = false
             do {
                 let data = try PropertyListEncoder().encode(habitos)
                     try data.write(to: dataFileURLHabitos())
             }
             catch {
                 print("Error al escribir en el archivo")
             }

             let defaults = UserDefaults.standard
             defaults.set(0, forKey: "contadorAgua")
        
        defaults.setValue(true, forKey: "agua1")
        defaults.setValue(true, forKey: "agua2")
        defaults.setValue(true, forKey: "agua3")
        defaults.setValue(true, forKey: "agua4")
        defaults.setValue(true, forKey: "agua5")
        defaults.setValue(true, forKey: "agua6")
        defaults.setValue(true, forKey: "agua7")
         }

}
