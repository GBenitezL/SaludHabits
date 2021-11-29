//
//  RecetarioViewController.swift
//  SaludHabitsV2
//
//  Created by Fernanda Sánchez on 28/11/21.
//

import UIKit

class RecetarioViewController: UIViewController {
    
    @IBOutlet weak var tvIngredientes: UITextView!
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var tvPasos: UITextView!
    
    let receta = Receta(id: 1, nombre: "Champiños rellenos veganos", ingredientes: ["250 gramos de champiñón, blanco","4 cucharadas de aceite de oliva","1 pizca de sal","1/4 tazas de cebolla morada, finamente picado","1/2 tazas de lenteja, cocidas y drenadas", "1/2 tazas de couscous, cocido"], pasos: [
        "Sobre una tabla con ayuda de un cuchillo limpia los champiñones , retira el tronco y ahueca, pica finamente el relleno y reserva.",
        "Calienta una sartén a fuego medio con aceite de oliva y cocina los champiñones boca abajo, durante 5 minutos. Voltea los champiñones, sazona a tu gusto con sal y pimienta, retira del sartén y reserva.",
        "En el misma sartén agrega un poco más de aceite de oliva y fríe el ajo, con la cebolla, la zanahoria, las lentejas, el cuscús, los pimientos de colores, el recorte de champiñones, el perejil, sazona con el jugo de limón, sal y pimienta a tu gusto.",
        "Sobre una tabla rellena los champiñones previamente cocinados, sirve en un plato y añade un poco de aceite de oliva. Disfruta."
    ], imagen: "receta1")

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvIngredientes.attributedText = bulletPointList(strings: receta.ingredientes)
        imgFoto.image = UIImage(named: receta.imagen)
        var pasos = ""
        
        for i in 0..<receta.pasos.count {
            pasos += String(i+1) + "- " + receta.pasos[i] + "\n"
        }
        
        tvPasos.text = pasos
    }
    
    func bulletPointList(strings: [String]) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = 15
        paragraphStyle.minimumLineHeight = 22
        paragraphStyle.maximumLineHeight = 22
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 15)]

        let stringAttributes = [
            NSAttributedString.Key.font: UIFont(name:"Helvetica",size: 15),
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]

        let string = strings.map({ "•\t\($0)" }).joined(separator: "\n")

        return NSAttributedString(string: string,
                                  attributes: stringAttributes as [NSAttributedString.Key : Any])
    }
    
    


}
