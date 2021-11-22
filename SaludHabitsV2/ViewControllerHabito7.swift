//
//  ViewControllerHabito7.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito7: UIViewController {
    
    @IBOutlet weak var lbContadorAgua: UILabel!
    @IBOutlet weak var pbProgreso: UIProgressView!
    @IBOutlet weak var lbCompletado: UILabel!
    
    var numHabito : Int = 7
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contador = Int(lbContadorAgua.text ?? "0") ?? 0
        progreso(cont: contador)
    }
    
    @IBAction func stpContadorAgua(_ sender: UIStepper) {
        lbContadorAgua.text = String(format: "%.0f", sender.value)
        progreso(cont: Int(sender.value))
        if lbContadorAgua.text == "7" {
            let alert = UIAlertController(title: "Excelente!", message: "¡Estás completamente hidratado!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
            self.present(alert, animated: true, completion: nil)
            completarHabito(numHabito: numHabito)
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
        } else {
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
