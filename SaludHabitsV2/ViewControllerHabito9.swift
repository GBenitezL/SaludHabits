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

    
    var habitos = [Habito]()
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
            habitos[8].completo = false
        } else {
            msg = "¡Enhorabuena! Objetivo diario de pasos cumplido."
            completarHabito(numHabito: numHabito)
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
            habitos[8].completo = true
        }
        let alert = UIAlertController(title: "Pasos diarios", message: msg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
            self.present(alert, animated: true, completion: nil)
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
        defaults.set(Int(lbPasos.text!), forKey: "objPasos")
        defaults.set(Int(tfPasos.text!), forKey: "pasos")
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
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            let data = try Data(contentsOf: dataFileURLHabitos())
            habitos = try PropertyListDecoder().decode([Habito].self, from: data)
        }
        
        catch {
            print("Error al cargar el archivo")
        }
        
        if(habitos[4].completo){
            lbCompletado.text = "Completado ✔️"
            lbCompletado.textColor = UIColor.black
        }else{
            lbCompletado.text = "Pendiente ⏳"
            lbCompletado.textColor = UIColor.gray
        }
        
        let defaults = UserDefaults.standard
        let cont = defaults.integer(forKey: "pasos")
        if cont != 0 {
            tfPasos.text = String(cont)
        }
        let obj = defaults.integer(forKey: "objPasos")
        if obj != 0 {
            lbPasos.text = String(obj)
            objetivoPasos = obj
        }
    }
}
