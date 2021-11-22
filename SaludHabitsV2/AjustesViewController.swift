//
//  AjustesViewController.swift
//  SaludHabitsV2
//
//  Created by Fernanda Sánchez on 14/11/21.
//

import UIKit

class AjustesViewController: UIViewController {

    var habitosArr = [Habito]()
    @IBOutlet var habitos: [UISwitch]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            let data = try Data(contentsOf: dataFileURLHabitos())
            habitosArr = try PropertyListDecoder().decode([Habito].self, from: data)
        }
        
        catch {
            print("Error al cargar el archivo")
        }
        
        activeSwitches()
        
    }
    
    func activeSwitches(){
        for i in 0...8{
            if habitosArr[i].activo {
                habitos[i].isOn = true
            } else {
                habitos[i].isOn = false
            }
        }
    }
    
    @IBAction func guardar(_ sender: UIButton) {
        
        for n in 0...8{
            if habitos[n].isOn {
                print("Setting Habit #" + String(n))
                habitosArr[n].activo = true
            }else {
                habitosArr[n].activo = false
            }
        }
                
    
        do {
            let data = try PropertyListEncoder().encode(habitosArr)
                try data.write(to: dataFileURLHabitos())
        }
        catch {
            print(" al escribir en el archivo")
        }
        
        let dash = self.presentingViewController as! DashboardViewController
        dash.storeActiveHabits()
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
