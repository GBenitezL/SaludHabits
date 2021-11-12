//
//  RegistroHabito.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class RegistroHabito: NSObject, Codable {
    var fecha : Date!
    var numHabito : Int!
    var completo : Bool!
    
    init(fecha : Date, numHabito : Int, completo : Bool) {
        self.fecha = fecha
        self.numHabito = numHabito
        self.completo = completo
    }
    
    private enum CodingKeys : String, CodingKey {
            case fecha
            case numHabito
            case completo
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fecha, forKey: .fecha)
        try container.encode(numHabito, forKey: .numHabito)
        try container.encode(completo, forKey: .completo)
    }
    
    func dataFileURLHabitos() -> URL {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let pathArchivo = documentsDirectory.appendingPathComponent("Habitos").appendingPathExtension("plist")
            return pathArchivo
    }
    
    func dataFileURLRegistros() -> URL {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let pathArchivo = documentsDirectory.appendingPathComponent("RegistroHabitos").appendingPathExtension("plist")
            return pathArchivo
    }
    
    func recopilarRegistros() {
        var habitos = [Habito]()
        
        do {
            let data = try Data(contentsOf: dataFileURLHabitos())
            habitos = try PropertyListDecoder().decode([Habito].self, from: data)
        }
        catch {
            print("Error al cargar el archivo")
        }
        
        let dateComponent = DateComponents(calendar: Calendar.current, year: 2018, month: 10, day: 10)
        let userCalendar = Calendar(identifier: .gregorian)
        let someDateTime = userCalendar.date(from: dateComponent)!
        
        var habitosRegistro = [RegistroHabito]()
        
        for i in 0...8{
            if habitos[i].activo {
                let registroHabit = RegistroHabito(fecha: someDateTime, numHabito: i+1, completo: true)
                
                habitosRegistro.append(registroHabit)
                
                let horas = habitos[i].horasNotificacion
                switch habitos[i].numHabito {
                    case 0:
                        habitos[i] = Ejercicio(activo: false, desc: "1 rutina de ejercicio", completo: false, horas: horas, time: 1, icon: "exercise")
                    case 1:
                        habitos[i] = SinCelular(activo: false, desc: "2 horas sin celular antes de dormir", completo: false, horas: horas, icon: "no-phone")
                    case 2:
                        habitos[i] = Comidas(activo: false, desc: "3 comidas completas", completo: false, horas: horas, icon: "restaurant")
                    case 3:
                        habitos[i] = Breaks(activo: false, desc: "4 breaks", completo: false, horas: horas, icon: "coffee-time")
                    case 4:
                        habitos[i] = FrutasVerduras(activo: false, desc: "5 raciones de frutas y verduras", completo: false, horas: horas, icon: "healthy-food")
                    case 5:
                        habitos[i] = Meditacion(activo: false, desc: "6 minutos de meditación", completo: false, horas: horas, icon: "meditation")
                    case 6:
                        habitos[i] = Agua(activo: false, desc: "7 vasos de agua", completo: false, horas: horas, icon: "water-bottle")
                    case 7:
                        habitos[i] = Dormir(activo: false, desc: "8 horas de sueño", completo: false, horas: horas, inicial: dateComponent, final: dateComponent, icon: "sleep")
                    case 8:
                        habitos[i] = Pasos(activo: false, desc: "9 mil pasos", completo: false, horas: horas, icon: "sneaker")
                    default:
                        print("not found")
                }
            }
        }
        
        do {
           let data = try PropertyListEncoder().encode(habitosRegistro)
                try data.write(to: dataFileURLRegistros())
        }
        catch {
            print("Error al escribir en el archivo")
        }
        
    }
    
    func cuantificarRegistros() {
        
    }
    
    func obtenerDatosHabito() {
        
    }

}
