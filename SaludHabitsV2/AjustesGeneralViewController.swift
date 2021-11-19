//
//  AjustesGeneralViewController.swift
//  SaludHabitsV2
//
//  Created by Fernanda Sánchez on 19/11/21.
//

import UIKit

class AjustesGeneralViewController: UIViewController {

    @IBOutlet weak var swNotifs: UISwitch!
    private let notifManager = NotificationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func recordatorios(_ sender: UISwitch) {
        if swNotifs.isOn{
            notifManager.sendNotification(title: "¡Checa tus avances saludables!", body: "Ven y administra tus hábitos del día de hoy", doesRepeat: true, hour: 19, minute: 10, idS: "DailyReminder1")
            notifManager.sendNotification(title: "¿Listo para vivir un día saludable?", body: "Cada mañana nacemos de nuevo. Lo que hacemos hoy es lo que más importa.", doesRepeat: true, hour: 9, minute: 25, idS: "DailyReminder2")
        }else{
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["DailyReminder1", "DailyReminder2"] )

        }
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
