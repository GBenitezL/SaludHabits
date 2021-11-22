//
//  Habito.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Habito: NSObject, Codable {
    var activo : Bool!
    var descripcion : String!
    var completo : Bool!
    var horasNotificacion = [DateComponents]()
    var numHabito : Int!
    var icon : String!  //Nombre de la imagen
    var creacion : Date!
    
    init(activo : Bool, desc : String, completo : Bool,
         horas : [DateComponents], numHabito: Int, icon: String) {
        self.activo = activo
        self.descripcion = desc
        self.completo = completo
        self.horasNotificacion = horas
        self.numHabito = numHabito
        self.icon = icon
        self.creacion = Date()
    }
    
    private enum CodingKeys : String, CodingKey {
            case activo
            case descripcion
            case completo
            case horasNotificacion
            case numHabito
            case icon
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(activo, forKey: .activo)
        try container.encode(descripcion, forKey: .descripcion)
        try container.encode(completo, forKey: .completo)
        try container.encode(horasNotificacion, forKey: .horasNotificacion)
        try container.encode(numHabito, forKey: .numHabito)
        try container.encode(icon, forKey: .icon)
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
        //let userCalendar = Calendar(identifier: .gregorian)
        // let someDateTime = userCalendar.date(from: dateComponent)!
        
        // var habitosRegistro = [RegistroHabito]()
        
        for i in 0...8{
            if habitos[i].activo {
                
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
        
    }
    
    func reiniciarEstado() {
        
    }
    
    func mostrarMensaje() {
        
    }

}
