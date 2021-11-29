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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RegisterViewCell
        let complete = person.value(forKeyPath: "completo") as! Bool
        let fRegistro = person.value(forKeyPath: "fecha") as! Date
        
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "YYYY/MM/dd"
        dateFormatter.string(from: fRegistro)
        
        let fecha = dateFormatter.string(from: fRegistro)
        
        let numH = person.value(forKeyPath: "numHabito") as! Int
        var habitString : String!
        switch numH {
        case 1:
            habitString = "1 Rutina de Ejercicio"
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
        
        cell.lbText.text = fecha
        cell.lbDetail.text = habitString
        if complete {
            cell.imgRegistro.image = UIImage(systemName: "checkmark")
            cell.imgRegistro.tintColor = .green
        } else {
            cell.imgRegistro.image = UIImage(systemName: "xmark")
            cell.imgRegistro.tintColor = .red
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
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
