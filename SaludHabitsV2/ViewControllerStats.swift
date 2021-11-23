//
//  ViewControllerStats.swift
//  SaludHabitsV2
//
//  Created by David Garcia on 23/11/21.
//

import UIKit
import CoreData

class ViewControllerStats: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableRegistros: UITableView!
    var registros: [RegistroHabito] = []
    @IBOutlet weak var lbCompNotCom: UILabel!
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
     
    override var shouldAutorotate: Bool {
        return false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registros = fetchAllHabitRegisters()
        //print(registrosDict)
        var comp = 0
        let total = registros.count
        
        for i in 0...(total - 1) {
            if registros[i].completo {
                comp += 1
            }
        }
        lbCompNotCom.text = "Se han completado " + String(comp) + " de " + String(total) + " registros."
        tableRegistros.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = registros[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let combine = person.value(forKeyPath: "completo") as! Bool
        let combine2 = person.value(forKeyPath: "fecha") as! Date

        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "YYYY/MM/dd"

        // Convert Date to String
        dateFormatter.string(from: combine2)
        
        let b = dateFormatter.string(from: combine2)
        
        let combine3 = person.value(forKeyPath: "numHabito") as! Int
        cell.textLabel?.text = String(combine) + " " + b + " " + String(combine3)
        return cell
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
