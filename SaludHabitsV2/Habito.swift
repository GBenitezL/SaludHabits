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
        self.creacion = Date().onlyDate
    }
    
    private enum CodingKeys : String, CodingKey {
            case activo
            case descripcion
            case completo
            case horasNotificacion
            case numHabito
            case icon
            case creacion
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(activo, forKey: .activo)
        try container.encode(descripcion, forKey: .descripcion)
        try container.encode(completo, forKey: .completo)
        try container.encode(horasNotificacion, forKey: .horasNotificacion)
        try container.encode(numHabito, forKey: .numHabito)
        try container.encode(icon, forKey: .icon)
        try container.encode(creacion, forKey: .creacion)
    }
    
    
    
    func reiniciarEstado() {
        
    }
    
    func mostrarMensaje() {
        
    }

}
