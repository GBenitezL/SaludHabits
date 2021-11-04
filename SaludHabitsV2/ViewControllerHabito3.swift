//
//  ViewControllerHabito3.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito3: UIViewController {

    var numHabito : Int = 3
    
    @IBOutlet weak var swDesayuno: UISwitch!
    @IBOutlet weak var swComida: UISwitch!
    @IBOutlet weak var swCena: UISwitch!
    @IBOutlet weak var prgComida: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

        }
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
