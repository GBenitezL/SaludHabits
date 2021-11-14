//
//  ViewControllerHabito2.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito2: UIViewController {
    
    var numHabito : Int = 2
    var horaDormir : Date!
    let dateFormatter = DateFormatter()

    @IBOutlet weak var swRecordatorio: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // format the time to be shown
        dateFormatter.dateFormat = "HH:mm"

    }
    
    @IBAction func setHora(_ sender: UIDatePicker) {
        self.horaDormir = sender.date
    }
    
    @IBAction func setRecordatorio(_ sender: UISwitch) {
        if swRecordatorio.isOn {

            let result = dateFormatter.string(from: self.horaDormir)
            // show the alert notification
            let alert = UIAlertController(title: "Horario de sueño", message: "Recordatorio configurado a las " + result, preferredStyle: UIAlertController.Style.alert)
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
