//
//  ViewControllerHabito7.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito7: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
     
    override var shouldAutorotate: Bool {
        return false
    }

    
    @IBOutlet weak var lbContadorAgua: UILabel!
    @IBOutlet weak var pbProgreso: UIProgressView!
    @IBOutlet weak var lbCompletado: UILabel!
    @IBOutlet weak var water1: UIButton!
    @IBOutlet weak var water2: UIButton!
    @IBOutlet weak var water3: UIButton!
    @IBOutlet weak var water4: UIButton!
    @IBOutlet weak var water5: UIButton!
    @IBOutlet weak var water6: UIButton!
    @IBOutlet weak var water7: UIButton!
    
    var numHabito : Int = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contador = Int(lbContadorAgua.text ?? "0") ?? 0
        progreso(cont: contador)
        water1.isHidden = true
        water2.isHidden = true
        water3.isHidden = true
        water4.isHidden = true
        water5.isHidden = true
        water6.isHidden = true
        water7.isHidden = true
    }
    
    @IBAction func stpContadorAgua(_ sender: UIStepper) {
        lbContadorAgua.text = String(format: "%.0f", sender.value)
        progreso(cont: Int(sender.value))
        if lbContadorAgua.text == "1" {
            water1.isHidden = false
            water2.isHidden = true
            water3.isHidden = true
            water4.isHidden = true
            water5.isHidden = true
            water6.isHidden = true
            water7.isHidden = true
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        } else if lbContadorAgua.text == "2" {
            water1.isHidden = false
            water2.isHidden = false
            water3.isHidden = true
            water4.isHidden = true
            water5.isHidden = true
            water6.isHidden = true
            water7.isHidden = true
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        } else if lbContadorAgua.text == "3" {
            water1.isHidden = false
            water2.isHidden = false
            water3.isHidden = false
            water4.isHidden = true
            water5.isHidden = true
            water6.isHidden = true
            water7.isHidden = true
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        } else if lbContadorAgua.text == "4" {
            water1.isHidden = false
            water2.isHidden = false
            water3.isHidden = false
            water4.isHidden = false
            water5.isHidden = true
            water6.isHidden = true
            water7.isHidden = true
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        } else if lbContadorAgua.text == "5" {
            water1.isHidden = false
            water2.isHidden = false
            water3.isHidden = false
            water4.isHidden = false
            water5.isHidden = false
            water6.isHidden = true
            water7.isHidden = true
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        } else if lbContadorAgua.text == "6" {
            water1.isHidden = false
            water2.isHidden = false
            water3.isHidden = false
            water4.isHidden = false
            water5.isHidden = false
            water6.isHidden = false
            water7.isHidden = true
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        } else if lbContadorAgua.text == "7" {
            water1.isHidden = false
            water2.isHidden = false
            water3.isHidden = false
            water4.isHidden = false
            water5.isHidden = false
            water6.isHidden = false
            water7.isHidden = false
            let alert = UIAlertController(title: "¡Excelente!", message: "¡Estás completamente hidratado!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
            self.present(alert, animated: true, completion: nil)
            completarHabito(numHabito: numHabito)
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
        }
    }
    
    func progreso(cont: Int){
        if (cont >= 7){
            pbProgreso.setProgress(1, animated: true)
        }
        else {
            pbProgreso.setProgress(Float(cont)/7, animated: true)
        }
    }

    @IBAction func regresar(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
