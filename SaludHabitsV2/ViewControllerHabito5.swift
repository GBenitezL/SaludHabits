//
//  ViewControllerHabito5.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito5: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
     
    override var shouldAutorotate: Bool {
        return false
    }

    
    @IBOutlet weak var lbContadorFV: UILabel!
    @IBOutlet weak var pbProgreso: UIProgressView!
    @IBOutlet weak var lbCompletado: UILabel!
    var numHabito : Int = 5
    var completado : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        let contador = Int(lbContadorFV.text ?? "0") ?? 0
        progreso(cont: contador)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func stpContadorFV(_ sender: UIStepper) {
        lbContadorFV.text = String(format: "%.0f", sender.value)
        //mensaje(cont: Int(sender.value))
        progreso(cont: Int(sender.value))
        if lbContadorFV.text == "5" {
            if completado == false{
            let alert = UIAlertController(title: "Felicidades", message: "Has completado tus 5 raciones diarias. ¡Sigue así!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
            self.present(alert, animated: true, completion: nil)
                completado = true
            }
            completarHabito(numHabito: numHabito)
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
        } else if lbContadorFV.text == "4" {
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
            completado = false
        }
    }
    
    func progreso(cont: Int){
        if (cont >= 5){
            pbProgreso.setProgress(1, animated: true)
        }
        else {
            pbProgreso.setProgress(Float(cont)/5, animated: true)
        }
    }
    
    @IBAction func regresar(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
