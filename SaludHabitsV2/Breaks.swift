//
//  Breaks.swift
//  saludHabits
//
//  Created by David Garcia on 15/10/21.
//

import UIKit

class Breaks: Habito {
    var numBreaks : Int!
    
    init(a : Bool, d : String, c : Bool, h : [DateComponents]) {
        self.numBreaks = 0
        super.init(a: a, d: d, c: c, h: h, n: 4)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    func iniciarTimer() {
        
    }
    
    func completar() {
        
    }

}
