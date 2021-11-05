//
//  Receta.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Receta: NSObject {
    var id : Int!
    var receta : String!
    var link : URL!
    var tipoComida : Int!
    
    init (id : Int, receta : String, link : URL, tipoComida : Int) {
        self.id = id
        self.receta = receta
        self.link = link
        self.tipoComida = tipoComida
    }

}
