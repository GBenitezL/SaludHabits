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
    
    init(a : Bool, d : String, c : Bool, h : [DateComponents], n: Int, i: String) {
        self.activo = a
        self.descripcion = d
        self.completo = c
        self.horasNotificacion = h
        self.numHabito = n
        self.icon = i
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
    
    func mostrarDescripcion() {
        
    }
    
    func reiniciarEstado() {
        
    }
    
    func mostrarMensaje() {
        
    }

}
