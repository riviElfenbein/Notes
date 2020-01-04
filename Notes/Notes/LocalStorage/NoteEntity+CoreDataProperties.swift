//
//  NoteEntity+CoreDataProperties.swift
//  Notes
//
//  Created by Rivi Elf on 03/01/2020.
//  Copyright © 2020 Rivi Elf. All rights reserved.
//
//

import Foundation
import CoreData


extension NoteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged public var content: String?
    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var type: Int16

}
