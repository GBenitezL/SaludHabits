//
//  RegistroHabito+CoreDataProperties.swift
//  SaludHabitsV2
//
//  Created by David Garcia on 22/11/21.
//
//

import Foundation
import CoreData


extension RegistroHabito {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RegistroHabito> {
        return NSFetchRequest<RegistroHabito>(entityName: "RegistroHabito")
    }

    @NSManaged public var completo: Bool
    @NSManaged public var fecha: Date
    @NSManaged public var numHabito: Int16

}

extension RegistroHabito : Identifiable {

}
