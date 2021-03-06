//
//  utils.swift
//  SaludHabitsV2
//
//  Created by David Garcia on 22/11/21.
//

import Foundation
import CoreData
import UIKit

extension Date {

    var onlyDate: Date? {
        get {
            let calender = Calendar.current
            var dateComponents = calender.dateComponents([.year, .month, .day], from: self)
            dateComponents.timeZone = NSTimeZone.system
            return calender.date(from: dateComponents)
        }
    }

}

func dataFileURLHabitos() -> URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let pathArchivo = documentsDirectory.appendingPathComponent("Habitos").appendingPathExtension("plist")
        return pathArchivo
}

func completarHabito(numHabito: Int, cancel: Bool = false) {
    var habitosArr = [Habito]()
    do {
        let data = try Data(contentsOf: dataFileURLHabitos())
        habitosArr = try PropertyListDecoder().decode([Habito].self, from: data)
    }
    
    catch {
        print("Error al cargar el archivo")
    }
    
    for n in 0...8{
        if habitosArr[n].numHabito == numHabito {
            if cancel {
                habitosArr[n].completo = false
            } else {
                habitosArr[n].completo = true
            }
        }
    }
    
    do {
        let data = try PropertyListEncoder().encode(habitosArr)
            try data.write(to: dataFileURLHabitos())
    }
    catch {
        print(" al escribir en el archivo")
    }
    
}

func recopilarRegistros() {
    var habitos = [Habito]()
    
    do {
        let data = try Data(contentsOf: dataFileURLHabitos())
        habitos = try PropertyListDecoder().decode([Habito].self, from: data)
    }
    catch {
        print("Error al cargar el archivo o abrió sesión nueva")
        return
    }
    
    for i in 0...8{
        if habitos[i].activo {
            saveRegistroHabito(completo: habitos[i].completo, fecha: habitos[i].creacion, numHabito: habitos[i].numHabito,  desc: "a")
            habitos[i].creacion = Date().onlyDate
            habitos[i].completo = false
        }
    }
    
    do {
        let data = try PropertyListEncoder().encode(habitos)
            try data.write(to: dataFileURLHabitos())
    }
    catch {
        print(" al escribir en el archivo")
    }
}

func saveRegistroHabito(completo: Bool, fecha: Date, numHabito: Int, desc: String) {

    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
        return
    }

    let managedContext = appDelegate.persistentContainer.viewContext

    let registro = RegistroHabito(context: managedContext)

    registro.setValue(completo, forKeyPath: "completo")
    registro.setValue(fecha, forKeyPath: "fecha")
    registro.setValue(numHabito, forKeyPath: "numHabito")
    registro.setValue(desc, forKeyPath: "descripcion")

    do {
        try managedContext.save()
        print("Guardado" + String(numHabito))
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
}

func fetchAllHabitRegisters() -> [RegistroHabito] {
    print("Start fetch")
    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
        return []
    }
    
    print("AppDelegate loaded correctly")
    
    let managedContext = appDelegate.persistentContainer.viewContext

    let fetchRequest = NSFetchRequest<RegistroHabito>(entityName: "RegistroHabito")

    var results = [RegistroHabito]()

    do {
        results = try managedContext.fetch(fetchRequest)
        print("Fetched correctly")
        return results
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
    return []
}
