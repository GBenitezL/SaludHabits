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
        let defaults = UserDefaults.standard
        var key : String!
        for n in 0...8{
            let m = n + 1
            key = "habito" + String(m)
            if habitos[n].isOn {
                print("Setting Habit #" + String(n))
                defaults.setValue(true, forKey: key)
            }
            
        }
        
        let ejercicio = Ejercicio(a: true, d: "Una rutina de ejercicio", c: false, h: dateComponents, t: 1)
        
        do {
            let data = try PropertyListEncoder().encode(ejercicio)
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
