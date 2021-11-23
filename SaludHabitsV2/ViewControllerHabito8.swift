//
//  ViewControllerHabito8.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito8: UIViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
     
    override var shouldAutorotate: Bool {
        return false
    }


    var numHabito : Int = 8

    @IBOutlet weak var lbHoras : UILabel!
    @IBOutlet weak var lbCompletado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbHoras.text = "0"
    }
    
    @IBAction func selectHoras(_ sender: UIStepper) {
        lbHoras.text = String(sender.value)
    }
    @IBAction func regresar(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cambiarHorario(_ sender: UIButton) {
        var msg : String!
        if Double(self.lbHoras.text!) ?? 0 < 8 {
            msg = "Las horas de sueño introducidas son menores de las recomendadas"
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        } else {
            msg = "¡Perfecto! Vas a dormir 8 horas o más."
            completarHabito(numHabito: numHabito)
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
        }

        let alert = UIAlertController(title: "Horario de sueño: " + lbHoras.text! + " horas", message: msg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
            self.present(alert, animated: true, completion: nil)
    }
}
