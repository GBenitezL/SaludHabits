//
//  ViewControllerHabito1.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito1: UIViewController {
    
   
    var numHabito : Int = 1

    @IBOutlet weak var swCompleto: UISwitch!
    @IBOutlet weak var lbMinutos: UILabel!
    @IBOutlet weak var stpMinutos: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func checkCompleto(_ sender: UISwitch) {
        if swCompleto.isOn {
            let alert = UIAlertController(title: "Hábito completado", message: "Hoy hiciste " + lbMinutos.text! + " minutos de ejercicio", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
                self.present(alert, animated: true, completion: nil)
            completarHabito(numHabito: numHabito)
        }
        //swCompleto.isOn = sender.isOn
    }
    
    @IBAction func addMinutos(_ sender: UIStepper) {
        lbMinutos.text = Int(sender.value).description
    }
    
    @IBAction func regresar(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
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
