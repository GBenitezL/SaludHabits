//
//  Ejercicio.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Ejercicio: Habito {
    var tiempo : Int! // En minutos
    
    init(a : Bool, d : String, c : Bool, h : [DateComponents], t : Int!) {
        self.tiempo = t
        super.init(a: a, d: d, c: c, h: h, n: 1)
    }
    
    func completar() {
        
    }

}