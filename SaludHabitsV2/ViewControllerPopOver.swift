//
//  ViewControllerPopOver.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 05/11/21.
//

import UIKit

class ViewControllerPopOver: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var lbEstiloVida: UILabel!
    @IBOutlet weak var lbPasosRecomendados: UILabel!

    var dato : String!
    var pickerData: [String] = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Connect data
        self.picker.delegate = self
        self.picker.dataSource = self
        
        // Input the data into the array
        pickerData = ["Sedentario", "Poco activo", "Algo activo", "Activo", "Muy activo"]
        
        // inicialize
        lbEstiloVida.text = pickerData[0]
        lbPasosRecomendados.text = "5000"
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        if row == 0 {
            lbEstiloVida.text = pickerData[0]
            lbPasosRecomendados.text = "5000"
        } else if row == 1 {
            lbEstiloVida.text = pickerData[1]
            lbPasosRecomendados.text = "7500"
        } else if row == 2 {
            lbEstiloVida.text = pickerData[2]
            lbPasosRecomendados.text = "8500"
        } else if row == 3 {
            lbEstiloVida.text = pickerData[3]
            lbPasosRecomendados.text = "10000"
        } else if row == 4 {
            lbEstiloVida.text = pickerData[4]
            lbPasosRecomendados.text = "12000"
        }
    }
    
    @IBAction func oprimirGuardar(_ sender: UIButton) {
        let vistaIni = presentingViewController as! ViewControllerHabito9
        vistaIni.actualizaPasos(dato : lbPasosRecomendados.text!)
        dismiss(animated: true, completion: nil)
    }
    
}
