//
//  utils.swift
//  SaludHabitsV2
//
//  Created by David Garcia on 22/11/21.
//

import Foundation

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
            /*
            let pokeMirror = Mirror(reflecting: habitosArr[n])
            let properties = pokeMirror.children

            for property in properties {

              print("\(property.label!) = \(property.value)")

            }
            */
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
