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
            Ejercicio(a: false, d: "1 rutina de ejercicio", c: false, h: dateComponents, t: 1, i: "exercise"),
            SinCelular(a: false, d: "2 horas sin celular antes de dormir", c: false, h: dateComponents, i: "no-phone"),
            Comidas(a: false, d: "3 comidas completas", c: false, h: dateComponents, i: "restaurant"),
            Breaks(a: false, d: "4 breaks", c: false, h: dateComponents, i: "coffee-time"),
            FrutasVerduras(a: false, d: "5 raciones de frutas y verduras", c: false, h: dateComponents, i: "healthy-food"),
            Meditacion(a: false, d: "6 minutos de meditación", c: false, h: dateComponents, i: "meditation"),
            Agua(a: false, d: "7 vasos de agua", c: false, h: dateComponents, i: "water-bottle"),
            Dormir(a: false, d: "8 horas de sueño", c: false, h: dateComponents, i: dateComponent, f: dateComponent, icon: "sleep"),
            Pasos(a: false, d: "9 mil pasos", c: false, h: dateComponents, i: "sneaker")
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
