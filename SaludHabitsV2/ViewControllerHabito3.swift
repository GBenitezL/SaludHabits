//
//  ViewControllerHabito3.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito3: UIViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
     
    override var shouldAutorotate: Bool {
        return false
    }


    var numHabito : Int = 3
    
    @IBOutlet weak var swDesayuno: UISwitch!
    @IBOutlet weak var swComida: UISwitch!
    @IBOutlet weak var swCena: UISwitch!
    @IBOutlet weak var prgComida: UIProgressView!
    @IBOutlet weak var lbCompletado: UILabel!
    
    var done : Bool!
    
    // User Defaults
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Cargamos los datos de User Default
        swDesayuno.setOn(defaults.bool(forKey:"swCompletoh31"), animated: true)
        swComida.setOn(defaults.bool(forKey:"swCompletoh32"), animated: true)
        swCena.setOn(defaults.bool(forKey:"swCompletoh33"), animated: true)

        done = defaults.bool(forKey:"lbCompletoh3")
        if done {
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
        } else {
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        }
    }
    
    @IBAction func checkProgress(_ sender: UISwitch) {
        if (!swDesayuno.isOn && !swComida.isOn && !swCena.isOn) {
            prgComida.progress = 0
        } else if (swDesayuno.isOn && swComida.isOn && !swCena.isOn || swComida.isOn && swCena.isOn && !swDesayuno.isOn || swDesayuno.isOn && swCena.isOn && !swComida.isOn){
            prgComida.progress = 0.6
        } else if (swDesayuno.isOn && !swComida.isOn && !swCena.isOn || swComida.isOn && !swCena.isOn && !swDesayuno.isOn || !swDesayuno.isOn && swCena.isOn && !swComida.isOn){
            prgComida.progress = 0.3
        } else if (swDesayuno.isOn && swComida.isOn && swCena.isOn) {
            prgComida.progress = 1
        }
        if prgComida.progress == 1 {
            let alert = UIAlertController(title: "Enhorabuena", message: "Has completado tus 3 comidas diarias ", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
            self.present(alert, animated: true, completion: nil)
            completarHabito(numHabito: numHabito)
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
            done = true
        } else {
            done = false
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        }
        defaults.setValue(swDesayuno.isOn, forKey:"swCompletoh31")
        defaults.setValue(swComida.isOn, forKey:"swCompletoh32")
        defaults.setValue(swCena.isOn, forKey:"swCompletoh33")
        defaults.setValue(done, forKey: "lbCompletoh3")
    }
    
    @IBAction func regresar(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
