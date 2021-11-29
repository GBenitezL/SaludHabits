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
    
    init(activo : Bool, desc : String, completo : Bool, horas : [DateComponents],
         inicial : DateComponents, final : DateComponents, icon : String) {
        self.horarioInicial = inicial
        self.horarioFinal = final
        super.init(activo: activo, desc: desc, completo: completo,
                   horas: horas, numHabito: 8, icon: icon)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        horarioInicial =  try values.decode(DateComponents.self, forKey: .horarioInicial)
        horarioFinal = try values.decode(DateComponents.self, forKey: .horarioFinal)
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
    
    func resetDormir(){
        var habitos = [Habito]()
        do {
            let data = try Data(contentsOf: dataFileURLHabitos())
            habitos = try PropertyListDecoder().decode([Habito].self, from: data)
        }
        
        catch {
            print("Error al cargar el archivo")
        }
        habitos[7].completo = false
        do {
            let data = try PropertyListEncoder().encode(habitos)
                try data.write(to: dataFileURLHabitos())
        }
        catch {
            print("Error al escribir en el archivo")
        }
        
        let defaults = UserDefaults.standard
        defaults.set(0, forKey: "contadorDormir")
    }
}
