//
//  SetUpViewController.swift
//  SaludHabitsV2
//
//  Created by Fernanda Sánchez on 03/11/21.
//

import UIKit

class SetUpViewController: UIViewController {

    
    @IBOutlet var habitos: [UISwitch]!
    

    let dateComponents = [
        DateComponents(calendar: Calendar.current, year: 2018, month: 10, day: 10)
    ]
    
    let dateComponent = DateComponents(calendar: Calendar.current, year: 2018, month: 10, day: 10)
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        defaults.setValue(true, forKey: "isInitialSetup")
    }
    
    func dataFileURL() -> URL {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let pathArchivo = documentsDirectory.appendingPathComponent("Habitos").appendingPathExtension("plist")
            return pathArchivo
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
                
    
        do {
            let data = try PropertyListEncoder().encode(habitosArr)
                try data.write(to: dataFileURL())
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
