//
//  ViewControllerHabito2.swift
//  SaludHabitsV2
//
//  Created by Irene Truchado Mazzoli on 02/11/21.
//

import UIKit

class ViewControllerHabito2: UIViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
     
    override var shouldAutorotate: Bool {
        return false
    }

    
    var numHabito : Int = 2
    var horaDormir : Date!

    private let notifManager = NotificationManager()

    @IBOutlet weak var swRecordatorio: UISwitch!
    @IBOutlet weak var lbCompletado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        horaDormir = Date()
    }
    
    @IBAction func setHora(_ sender: UIDatePicker) {
        self.horaDormir = sender.date
    }
    
    @IBAction func setRecordatorio(_ sender: UISwitch) {
        if swRecordatorio.isOn {
            var hour = Calendar.current.component(.hour, from: horaDormir)
            let minute = Calendar.current.component(.minute, from: horaDormir)
            
            if(hour == 0){
                hour = 22
            }else if (hour == 1){
                hour = 23
            }else{
                hour = hour - 2
            }
            
            // show the alert notification
            let alert = UIAlertController(title: "Horario de sueño", message: "Recordatorio configurado a las " + String(hour) + ":" + String(minute), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
            self.present(alert, animated: true, completion: nil)
            
            notifManager.sendNotification(title: "Tienes planeado irte a dormir en dos horas", body: "Te recomendamos que dejes el celular para descansar tus ojos", doesRepeat: true, hour: hour, minute: minute, idS: "habit2")
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
}
