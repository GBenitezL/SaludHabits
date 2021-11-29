//
//  ViewControllerHabito7.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito7: UIViewController {
    var habitos = [Habito]()
    
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
    @IBOutlet weak var stepper: UIStepper!
    
    var numHabito : Int = 7
    var completado : Bool = false
    
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
            completado = false
            habitos[6].completo = false
        } else if lbContadorAgua.text == "7" {
            water1.isHidden = false
            water2.isHidden = false
            water3.isHidden = false
            water4.isHidden = false
            water5.isHidden = false
            water6.isHidden = false
            water7.isHidden = false
            habitos[6].completo = true
            if completado == false {
            let alert = UIAlertController(title: "¡Excelente!", message: "¡Estás completamente hidratado!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
                self.present(alert, animated: true, completion: nil)
            }
            completado = true
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
        do {
            let data = try PropertyListEncoder().encode(habitos)
                         try data.write(to: dataFileURLHabitos())
                 }
                 catch {
                     print(" al escribir en el archivo")
                 }
                 let defaults = UserDefaults.standard
                 defaults.set(Int(lbContadorAgua.text!), forKey: "contadorAgua")
        self.dismiss(animated: true, completion: nil)
        defaults.setValue(water1.isHidden, forKey: "agua1")
        defaults.setValue(water2.isHidden, forKey: "agua2")
        defaults.setValue(water3.isHidden, forKey: "agua3")
        defaults.setValue(water4.isHidden, forKey: "agua4")
        defaults.setValue(water5.isHidden, forKey: "agua5")
        defaults.setValue(water6.isHidden, forKey: "agua6")
        defaults.setValue(water7.isHidden, forKey: "agua7")
    }
    
    override func viewWillAppear(_ animated: Bool) {
         do {
             let data = try Data(contentsOf: dataFileURLHabitos())
             habitos = try PropertyListDecoder().decode([Habito].self, from: data)
         }

         catch {
             print("Error al cargar el archivo")
         }

         if(habitos[6].completo){
             lbCompletado.text = "Completado ✔️"
             lbCompletado.textColor = UIColor.black
         }else{
             lbCompletado.text = "Pendiente ⏳"
             lbCompletado.textColor = UIColor.gray
         }

         let defaults = UserDefaults.standard
         let cont = defaults.integer(forKey: "contadorAgua")
         if cont != 0 {
             lbContadorAgua.text = String(cont)
             progreso(cont: cont)
             stepper.value = Double(cont)
         }
        
        if defaults.bool(forKey: "agua1"){
            water1.isHidden = true
                 }else{
                    water1.isHidden = false
                 }
        if defaults.bool(forKey: "agua2"){
            water2.isHidden = true
                 }else{
                    water2.isHidden = false
                 }
        if defaults.bool(forKey: "agua3"){
            water3.isHidden = true
                 }else{
                    water3.isHidden = false
                 }
        if defaults.bool(forKey: "agua4"){
            water4.isHidden = true
                 }else{
                    water4.isHidden = false
                 }
        if defaults.bool(forKey: "agua5"){
            water5.isHidden = true
                 }else{
                    water5.isHidden = false
                 }
        if defaults.bool(forKey: "agua6"){
            water6.isHidden = true
                 }else{
                    water6.isHidden = false
                 }
        if defaults.bool(forKey: "agua7"){
            water7.isHidden = true
                 }else{
                    water7.isHidden = false
                 }
     }
}
