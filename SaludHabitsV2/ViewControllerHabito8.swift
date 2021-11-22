//
//  ViewControllerHabito8.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito8: UIViewController {

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
        } else {
            msg = "¡Perfecto! Vas a dormir 8 horas o más."
        }

        let alert = UIAlertController(title: "Horario de sueño: " + lbHoras.text! + " horas", message: msg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
            self.present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
