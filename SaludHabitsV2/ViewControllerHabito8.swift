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
    var habitos = [Habito]()

    @IBOutlet weak var stepper: UIStepper!
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
        do {
            let data = try PropertyListEncoder().encode(habitos)
                         try data.write(to: dataFileURLHabitos())
                 }
                 catch {
                     print(" al escribir en el archivo")
                 }
                 let defaults = UserDefaults.standard
                 defaults.set(Double(lbHoras.text!), forKey: "contadorDormir")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cambiarHorario(_ sender: UIButton) {
        var msg : String!
        if Double(self.lbHoras.text!) ?? 0 < 8 {
            msg = "Las horas de sueño introducidas son menores de las recomendadas"
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
            habitos[7].completo = false
        } else {
            msg = "¡Perfecto! Vas a dormir 8 horas o más."
            completarHabito(numHabito: numHabito)
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
            habitos[7].completo = true
        }

        let alert = UIAlertController(title: "Horario de sueño: " + lbHoras.text! + " horas", message: msg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
            self.present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            let data = try Data(contentsOf: dataFileURLHabitos())
            habitos = try PropertyListDecoder().decode([Habito].self, from: data)
        }
        
        catch {
            print("Error al cargar el archivo")
        }
        
        if(habitos[7].completo){
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
        }else{
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        }
        
        let defaults = UserDefaults.standard
        let cont = defaults.double(forKey: "contadorDormir")
        if cont != 0 {
            lbHoras.text = String(cont)
            stepper.value = Double(cont)
        }
    }
}
