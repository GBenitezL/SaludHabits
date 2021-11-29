//
//  RecetarioIngredientesViewController.swift
//  SaludHabitsV2
//
//  Created by Fernanda Sánchez on 28/11/21.
//

import UIKit

class RecetarioIngredientesViewController: UIViewController {
    
    
    @IBOutlet weak var lbNombrePlatillo: UILabel!
    
    
    let recetas = [
        
        Receta(id: 1, nombre: "Champiños rellenos veganos", ingredientes: ["250 gramos de champiñón, blanco","4 cucharadas de aceite de oliva","1 pizca de sal","1/4 tazas de cebolla morada, finamente picado","1/2 tazas de lenteja, cocidas y drenadas", "1/2 tazas de couscous, cocido"], pasos: [
        "Sobre una tabla con ayuda de un cuchillo limpia los champiñones , retira el tronco y ahueca, pica finamente el relleno y reserva.",
        "Calienta una sartén a fuego medio con aceite de oliva y cocina los champiñones boca abajo, durante 5 minutos. Voltea los champiñones, sazona a tu gusto con sal y pimienta, retira del sartén y reserva.",
        "En el misma sartén agrega un poco más de aceite de oliva y fríe el ajo, con la cebolla, la zanahoria, las lentejas, el cuscús, los pimientos de colores, el recorte de champiñones, el perejil, sazona con el jugo de limón, sal y pimienta a tu gusto.",
        "Sobre una tabla rellena los champiñones previamente cocinados, sirve en un plato y añade un poco de aceite de oliva. Disfruta."
    ], imagen: "receta1"),
        Receta(id: 2, nombre: "Rollos de Ensalada de Atún", ingredientes: ["2 tazas de atún en lata, drenado","1/4 tazas de apio, finamente picado","1/2 tazas de cebolla morada, en tiritas","1/2 tazas de jitomate, en cubos","1/4 tazas de grano de elote amarillo, drenado", "1/2 tazas de pepino, en cubos", "1/4 tazas de queso cheddar, rallado", "1 lechuga romana, hojas", "3 chiles jalapeños en escabeche, cortado en cubitos", "2 cucharadas de vinagre, o escabeche del chile jalapeño"], pasos: [
           "En un bowl mezcla el atún en lata junto con el apio, la cebolla morada, el jitomate, el elote amarillo, el pepino, el queso cheddar, el perejil, la mayonesa, los chiles jalapeños, el vinagre de chile y la ralladura de limón. Sazona con sal y pimienta e integra.",
           "Separa las hojas de lechuga romana, procura no romperlas. Con ayuda de un cuchillo, corta los excesos de la lechuga y forma un cuadrado. Rellena cada hoja con la ensalada de atún y enrolla. Refrigera por unos minutos.",
           "Sirve acompañado de papas cambray salteadas."
       ], imagen: "receta2"),
        Receta(id: 3, nombre: "Pan de Plátano con Almendras", ingredientes: ["2 tazas de avena","2 tazas de harina integral", "1/2 tazas de azúcar morena", "1 cucharadita de polvo para hornear", "2 cucharaditas de canela", "1/4 tazas de chispa de chocolate", "2 tazas de leche de almendras Plant Revolution® original", "2 plátanos, machacado","1 huevo", "1 cucharadita de vainilla líquida", "3 cucharadas de mantequilla, o aceite de coco derretidos", "1/2 tazas de almendra, fileteada"], pasos: ["Precalienta el horno a 180°C.", "En un bowl, combina la avena con la harina, el azúcar, el polvo para hornear, la canela, la sal y las chispas.", "En otro bowl, combina la leche de almendras Plant Revolution® original con el plátano, el huevo y la vainilla. Agrega la margarina poco a poco sin dejar de batir.", "Agrega la preparación anterior a la mezcla de avena y bate hasta integrar.", "Vierte en un molde para brownies previamente engrasado y enharinado, extiende con ayuda de una cuchara y cubre con las almendras.", "Hornea alrededor de 25 minutos o hasta que esté cocido. Enfría y corta en barras."], imagen: "receta3"),
        Receta(id: 4, nombre: "Enchiladas de Calabaza con Pollo", ingredientes: ["5 jitomates","5 chiles morita secos","1/4 cebollas","1 diente de ajo","1 cucharada de ajo","1 pechuga de pollo, deshebrada", "3 calabacitas", "1 cucharada de aceite de oliva", "1/2 tazas de queso panela, desmoronado"], pasos: ["Precalienta el horno a 180°C.","En un comal, asa los jitomates, los chiles, la cebolla y el ajo. Licúa hasta obtener una salsa.","En una cacerola calienta el aceite vierte la salsa y cocina por 10 minutos. Reserva un poco de la salsa para servir, y agrega la pechuga de pollo a la cacerola. Cocina 5 minutos más.","Con ayuda de un pelador, corta las calabazas en láminas delgadas.", "Sobre una tabla coloca 3 tiras de calabaza y rellena con el pollo.", "Coloca las enchiladas en un refractario para horno, agrega un poco de aceite de oliva, sazona con sal y pimienta. Hornea 10 minutos o hasta que las calabazas estén suaves.", "Sirve calientes con más salsa, queso y cilantro."], imagen: "receta4")
    ]
    
    

    @IBOutlet weak var imgPlatillo: UIImageView!
    
    @IBOutlet weak var tvIngredientes: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func bulletPointList(strings: [String]) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = 15
        paragraphStyle.minimumLineHeight = 22
        paragraphStyle.maximumLineHeight = 22
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 15)]

        let stringAttributes = [
            NSAttributedString.Key.font: UIFont(name:"Hiragino Sans W3",size: 16),
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]

        let string = strings.map({ "•\t\($0)" }).joined(separator: "\n")

        return NSAttributedString(string: string,
                                  attributes: stringAttributes as [NSAttributedString.Key : Any])
    }
    
    
    

    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let recetaHoy = defaults.integer(forKey: "recetaHoy")
        
        imgPlatillo.image = UIImage(named: recetas[recetaHoy].imagen)
        tvIngredientes.attributedText = bulletPointList(strings: recetas[recetaHoy].ingredientes)
        lbNombrePlatillo.text = recetas[recetaHoy].nombre_platillo
    }
}
