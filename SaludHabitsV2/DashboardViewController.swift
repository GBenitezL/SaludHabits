//
//  DashboardViewController.swift
//  SaludHabitsV2
//
//  Created by Fernanda Sánchez on 03/11/21.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
     
    override var shouldAutorotate: Bool {
        return false
    }
    
    var habitos = [Habito]()
    var habitosActivo = [Habito]()
    @IBOutlet weak var tvTablaHabitos: UITableView!
    
    @IBAction func unwindFromSegue(segue: UIStoryboardSegue) {
        
        habitos.removeAll()
        habitosActivo.removeAll()
        
        do {
            let data = try Data(contentsOf: dataFileURLHabitos())
            habitos = try PropertyListDecoder().decode([Habito].self, from: data)
        }
        
        catch {
            print("Error al cargar el archivo")
        }
        

        storeActiveHabits()
        tvTablaHabitos.reloadData()
        
    }

   
    
    override func viewWillAppear(_ animated: Bool) {
        habitos.removeAll()
        habitosActivo.removeAll()
        
        do {
            let data = try Data(contentsOf: dataFileURLHabitos())
            habitos = try PropertyListDecoder().decode([Habito].self, from: data)
        }
        
        catch {
            print("Error al cargar el archivo")
        }
        
        storeActiveHabits()
        //recopilarRegistros()
        //resetearHabitos()

        let defaults = UserDefaults.standard
        if (defaults.object(forKey: "lastLogin") as! Date) < Date().onlyDate! {
            defaults.setValue(Date().onlyDate, forKey: "lastLogin")
            recopilarRegistros()
            resetearHabitos()
            print("Se recopilaron los registros del dia anterior ")
        } else {
            print("No se recopilaron registros ")
        }
        tvTablaHabitos.reloadData()
    }
    
    func storeActiveHabits() {
        
        for i in 0...8{
            if habitos[i].activo {
                habitosActivo.append(habitos[i])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        habitosActivo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        let habitoSelc = habitosActivo[indexPath.row]
        cell.tvText.text = habitoSelc.descripcion
        cell.imgIcon.image = UIImage(named: habitoSelc.icon)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let habitoSeleccionado = "habito" +  String(habitosActivo[indexPath.row].numHabito)
        performSegue(withIdentifier: habitoSeleccionado, sender: self)
        print(habitoSeleccionado)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Resetea todos los habitos
    func resetearHabitos() {
        // User Defaults
        let defaults = UserDefaults.standard
        
        // habito 1
        defaults.setValue(false, forKey:"swCompletoh1")
        defaults.setValue(false, forKey: "lbCompletoh1")
        
        // habito 2
        defaults.setValue(false, forKey:"swCompletoh2")
        defaults.setValue(false, forKey: "lbCompletoh2")
        
        // habito 3
        defaults.setValue(false, forKey:"swCompletoh31")
        defaults.setValue(false, forKey:"swCompletoh32")
        defaults.setValue(false, forKey:"swCompletoh33")
        defaults.setValue(false, forKey: "lbCompletoh3")
        
        let dateComponents = [
            DateComponents(calendar: Calendar.current, year: 2018, month: 10, day: 10)
        ]
        
        // habito 4
        let br = Breaks(activo: false, desc: "4 breaks", completo: false, horas: dateComponents, icon: "coffee-time")
        br.resetBreaksHabit()
        
        // habito 5
        let ft = FrutasVerduras(activo: false, desc: "5 raciones de frutas y verduras", completo: false, horas: dateComponents, icon: "healthy-food")
        ft.resetFrutasVerdurasHabit()
        
        // habito 6
        //Meditacion(activo: false, desc: "6 minutos de meditación", completo: false, horas: dateComponents, icon: "meditation")
        
        // habito 7
        let ag = Agua(activo: false, desc: "7 vasos de agua", completo: false, horas: dateComponents, icon: "water-bottle")
        ag.resetAgua()
        
        // habito 8
        let dateComponent = DateComponents(calendar: Calendar.current, year: 2018, month: 10, day: 10)
        let dor = Dormir(activo: false, desc: "8 horas de sueño", completo: false, horas: dateComponents, inicial: dateComponent, final: dateComponent, icon: "sleep")
        dor.resetDormir()
        
        // habito 9
        let pas = Pasos(activo: false, desc: "9 mil pasos", completo: false, horas: dateComponents, icon: "sneaker")
        pas.resetPasos()
        
    }
}
