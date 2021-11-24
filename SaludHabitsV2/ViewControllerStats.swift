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
        var comp = 0
        let total = registros.count
        if total > 0 {
            for i in 0...(total - 1) {
                if registros[i].completo {
                    comp += 1
                }
            }
            lbCompNotCom.text = "Se han completado " + String(comp) + " de " + String(total) + " registros."
        } else {
            lbCompNotCom.text = "Todavía no cuentas con ningún registro :("
        }
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

        var combString : String!
        if combine {
            combString = "Completo"
        } else {
            combString = "No completado"
        }
        
        
        
        
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "YYYY/MM/dd"

        // Convert Date to String
        dateFormatter.string(from: combine2)
        
        let b = dateFormatter.string(from: combine2)
        
        let combine3 = person.value(forKeyPath: "numHabito") as! Int
        var habitString : String!
        switch combine3 {
        case 1:
            habitString = "1 Rutinas de Ejercicio"
        case 2:
            habitString = "2 Horas antes de dormir"
        case 3:
            habitString = "3 Comidas completas"
        case 4:
            habitString = "4 Breaks"
        case 5:
            habitString = "5 Raciones de Frutas y Verduras"
        case 6:
            habitString = "6 Minutos de Meditación"
        case 7:
            habitString = "7 Vasos de Agua"
        case 8:
            habitString = "8 horas de sueño"
        case 9:
            habitString = "9 Mil pasos al día"
        default:
            habitString = "Error"
        }
        
        cell.textLabel?.text = String(combString) + " " + b 
        cell.detailTextLabel?.text = habitString
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
