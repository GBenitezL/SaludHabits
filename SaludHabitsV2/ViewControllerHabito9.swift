//
//  ViewControllerHabito9.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito9: UIViewController, UIPopoverPresentationControllerDelegate {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
     
    override var shouldAutorotate: Bool {
        return false
    }

    
    var numHabito : Int = 9
    
    var objetivoPasos : Int = 9000

    @IBOutlet weak var tfPasos: UITextField!
    @IBOutlet weak var lbPasos: UILabel!
    @IBOutlet weak var lbCompletado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbPasos.text = String(objetivoPasos)
    }
    
    @IBAction func guardarPasos(_ sender: UIButton) {
        var msg : String!
        if Int(tfPasos.text!) ?? 0 < objetivoPasos {
            msg = "Hoy has dado menos pasos de los que marca tu objetivo. ¡Sigue trabajando!"
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        } else {
            msg = "¡Enhorabuena! Objetivo diario de pasos cumplido."
            completarHabito(numHabito: numHabito)
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
        }
        let alert = UIAlertController(title: "Pasos diarios", message: msg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
            self.present(alert, animated: true, completion: nil)
    }
    @IBAction func regresar(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popover" {
            let vistaPopOver = segue.destination as! ViewControllerPopOver
            vistaPopOver.popoverPresentationController!.delegate = self
            vistaPopOver.dato = lbPasos.text
        }
    }
    
    func actualizaPasos(dato : String) {
        objetivoPasos = Int(dato) ?? 0
        lbPasos.text = dato
    }
    @IBAction func quitaTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}
