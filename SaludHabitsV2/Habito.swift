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
    
    init(a : Bool, d : String, c : Bool, h : [DateComponents], n: Int) {
        self.activo = a
        self.descripcion = d
        self.completo = c
        self.horasNotificacion = h
        self.numHabito = n
    }
    
    private enum CodingKeys : String, CodingKey {
            case activo
            case descripcion
            case completo
            case horasNotificacion
            case numHabito
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(activo, forKey: .activo)
        try container.encode(descripcion, forKey: .descripcion)
        try container.encode(completo, forKey: .completo)
        try container.encode(horasNotificacion, forKey: .horasNotificacion)
        try container.encode(numHabito, forKey: .numHabito)
    }
    
    func mostrarDescripcion() {
        
    }
    
    func reiniciarEstado() {
        
    }
    
    func mostrarMensaje() {
        
    }

}
