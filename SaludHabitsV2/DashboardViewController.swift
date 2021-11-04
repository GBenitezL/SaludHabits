//
//  DashboardViewController.swift
//  SaludHabitsV2
//
//  Created by Fernanda Sánchez on 03/11/21.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
  
    var habitos = [String]()
    

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
        do {
            let data = try Data(contentsOf: dataFileURL())
            let ejercicio = try PropertyListDecoder().decode(Ejercicio.self, from: data)
          
            print(ejercicio.activo!)
        }
        catch {
            print("Error al cargar el archivo")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        habitos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        cell.tfText.text = habitos[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var habitoSeleccionado = habitos[indexPath.row]
        performSegue(withIdentifier: habitoSeleccionado, sender: self)
        print(habitoSeleccionado)
    }
    
    func dataFileURL() -> URL {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let pathArchivo = documentsDirectory.appendingPathComponent("Habitos").appendingPathExtension("plist")
            return pathArchivo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
