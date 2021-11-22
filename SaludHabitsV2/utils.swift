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
            let pokeMirror = Mirror(reflecting: habitosArr[n])
            let properties = pokeMirror.children

            for property in properties {

              print("\(property.label!) = \(property.value)")

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
        print("Error al cargar el archivo")
    }
    
    for i in 0...8{
        if habitos[i].activo {
            save(completo: habitos[i].completo, fecha: habitos[i].creacion, numHabito: habitos[i].numHabito)
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

func save(completo: Bool, fecha: Date, numHabito: Int) {
  
  guard let appDelegate =
    UIApplication.shared.delegate as? AppDelegate else {
    return
  }
  
  let managedContext =
    appDelegate.persistentContainer.viewContext
  
  let entity =
    NSEntityDescription.entity(forEntityName: "RegistroHabito",
                               in: managedContext)!
  
  let registro = NSManagedObject(entity: entity,
                               insertInto: managedContext)
  
  registro.setValue(completo, forKeyPath: "completo")
  registro.setValue(fecha, forKeyPath: "fecha")
  registro.setValue(numHabito, forKeyPath: "numHabito")
  
  do {
    try managedContext.save()
    // people.append(person)
  } catch let error as NSError {
    print("Could not save. \(error), \(error.userInfo)")
  }
}
