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
            
            // format the time to be shown
            /*let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let result = dateFormatter.string(from: self.horaDormir)
            // show the alert notification*/
                  
            
    
            let alert = UIAlertController(title: "Horario de sueño", message: "Recordatorio configurado a las " + String(hour) + ":" + String(minute), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {UIAlertAction in }))
            self.present(alert, animated: true, completion: nil)
        
        
            
            notifManager.sendNotification(title: "Tienes planeado irte a dormir en dos horas", body: "Te recomendamos que dejes el celular para dejar descansar a tu ojos", doesRepeat: true, hour: hour, minute: minute, idS: "habit2")
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
