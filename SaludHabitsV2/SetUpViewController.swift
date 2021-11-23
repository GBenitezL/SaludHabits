//
//  SetUpViewController.swift
//  SaludHabitsV2
//
//  Created by Fernanda Sánchez on 03/11/21.
//

import UIKit

class SetUpViewController: UIViewController {

    
    @IBOutlet var habitos: [UISwitch]!
    private let notifManager = NotificationManager()

    let dateComponents = [
        DateComponents(calendar: Calendar.current, year: 2018, month: 10, day: 10)
    ]
    
    let dateComponent = DateComponents(calendar: Calendar.current, year: 2018, month: 10, day: 10)
    
    /* Notificaciones que se mandaran diariamente por default */
    func setInitialNotifications(){
        notifManager.sendNotification(title: "¡Checa tus avances saludables!", body: "Ven y administra tus hábitos del día de hoy", doesRepeat: true, hour: 19, minute: 10, idS: "DailyReminder1")
        notifManager.sendNotification(title: "¿Listo para vivir un día saludable?", body: "Cada mañana nacemos de nuevo. Lo que hacemos hoy es lo que más importa.", doesRepeat: true, hour: 9, minute: 25, idS: "DailyReminder2")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        defaults.setValue(true, forKey: "isInitialSetup")
        defaults.setValue(Date().onlyDate, forKey: "lastLogin")
    }
    
    @IBAction func saveSettings(_ sender: UIButton) {
        let habitosArr = [
            Ejercicio(activo: false, desc: "1 rutina de ejercicio", completo: false, horas: dateComponents, time: 1, icon: "exercise"),
            SinCelular(activo: false, desc: "2 horas sin celular antes de dormir", completo: false, horas: dateComponents, icon: "no-phone"),
            Comidas(activo: false, desc: "3 comidas completas", completo: false, horas: dateComponents, icon: "restaurant"),
            Breaks(activo: false, desc: "4 breaks", completo: false, horas: dateComponents, icon: "coffee-time"),
            FrutasVerduras(activo: false, desc: "5 raciones de frutas y verduras", completo: false, horas: dateComponents, icon: "healthy-food"),
            Meditacion(activo: false, desc: "6 minutos de meditación", completo: false, horas: dateComponents, icon: "meditation"),
            Agua(activo: false, desc: "7 vasos de agua", completo: false, horas: dateComponents, icon: "water-bottle"),
            Dormir(activo: false, desc: "8 horas de sueño", completo: false, horas: dateComponents, inicial: dateComponent, final: dateComponent, icon: "sleep"),
            Pasos(activo: false, desc: "9 mil pasos", completo: false, horas: dateComponents, icon: "sneaker")
        ]
        
        for n in 0...8{
            if habitos[n].isOn {
                print("Setting Habit #" + String(n))
                habitosArr[n].activo = true
            }
        }
                
        setInitialNotifications()
    
        do {
            let data = try PropertyListEncoder().encode(habitosArr)
                try data.write(to: dataFileURLHabitos())
        }
        catch {
            print(" al escribir en el archivo")
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
