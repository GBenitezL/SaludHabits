//
//  DashboardViewController.swift
//  SaludHabitsV2
//
//  Created by Fernanda Sánchez on 03/11/21.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
  
    var habitos = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func SetHabits(){
        let defaults = UserDefaults.standard
        var key : String!
        for n in 0...8 {
            let m = n + 1
            key = "habito" + String(m)
            if defaults.bool(forKey: key){
                habitos.append(key)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SetHabits()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        habitos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        cell.button.setTitle(habitos[indexPath.row], for: UIControl.State.normal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {


            return nil
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
