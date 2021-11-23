//
//  ViewControllerHabito1.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito1: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
     
    override var shouldAutorotate: Bool {
        return false
    }


    var numHabito : Int = 1
    var tiempo : String = "0"

    @IBOutlet weak var swCompleto: UISwitch!
    @IBOutlet weak var lbCompletado: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    
    // array que contiene los valores actuales del picker
    
    var horas = ["1","2","3","4","5"]
    var minutos = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Conectamos el picker al delegate y datasource
        self.picker.delegate = self
        self.picker.dataSource = self
    }
    
    @IBAction func checkCompleto(_ sender: UISwitch) {
        if swCompleto.isOn {
            let alert = UIAlertController(title: "Hábito completado", message: "Hoy hiciste " + tiempo + " minutos de ejercicio", preferredStyle: UIAlertController.Style.alert)
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
    
    @IBAction func regresar(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Numero de columnas del picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // Numero de filas del picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 { return horas.count }
        else { return minutos.count }
    }
    
    // Devuelve la informacion de la seleccion del picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(horas[row])
        } else {
            return String(minutos[row])
        }
    }

    // Captura la selección del picker
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // actualizamos el texto del label
        tiempo = horas[picker.selectedRow(inComponent: 0)] + " horas y " + minutos[picker.selectedRow(inComponent: 1)] + " minutos"

    }
}
