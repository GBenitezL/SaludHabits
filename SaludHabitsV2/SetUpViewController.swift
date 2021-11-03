//
//  SetUpViewController.swift
//  SaludHabitsV2
//
//  Created by Fernanda Sánchez on 03/11/21.
//

import UIKit

class SetUpViewController: UIViewController {

    
    @IBOutlet var habitos: [UISwitch]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        defaults.setValue(true, forKey: "isInitialSetup")
        
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
