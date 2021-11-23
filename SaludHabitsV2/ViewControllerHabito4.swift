//
//  ViewControllerHabito4.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito4: UIViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
     
    override var shouldAutorotate: Bool {
        return false
    }

    
    var numHabito : Int = 4

    @IBOutlet weak var stpTimer: UIStepper!
    @IBOutlet weak var lbTimer: UILabel!

    @IBOutlet weak var sw1: UISwitch!
    @IBOutlet weak var sw2: UISwitch!
    @IBOutlet weak var sw3: UISwitch!
    @IBOutlet weak var sw4: UISwitch!
    @IBOutlet weak var lbCompletado: UILabel!
    
    override func viewDidLoad() {
        stpTimer.value = 45
        lbTimer.text = Int(stpTimer.value).description
        super.viewDidLoad()
    }
    
    @IBAction func detectarCompleto(_ sender: Any) {
        if sw1.isOn && sw2.isOn && sw3.isOn && sw4.isOn {
            let alert = UIAlertController(title: "¡Enhorabuena!", message: "Has completado tus 4 breaks diarios", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
            self.present(alert, animated: true, completion: nil)
            completarHabito(numHabito: numHabito)
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
        } else {
            completarHabito(numHabito: numHabito, cancel: true)
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        }
    }
    
    @IBAction func setTimer(_ sender: UIStepper) {
        lbTimer.text = Int(sender.value).description
        
    }
    @IBAction func iniciarTimer(_ sender: UIButton) {
        let alert = UIAlertController(title: "Temporizador", message: "Temporizador configurado para dentro de " + Int(self.stpTimer.value).description + " minutos", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
            self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func regresar(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

}
