//
//  NoteEntity+CoreDataClass.swift
//  Notes
//
//  Created by Rivi Elf on 03/01/2020.
//  Copyright © 2020 Rivi Elf. All rights reserved.
//
//

import Foundation
import CoreData

@objc(NoteEntity)
public class NoteEntity: NSManagedObject {
    static var name = "NoteEntity"
    
   
    func delete(useCase: UseCase,context: NSManagedObjectContext) {
        if useCase == .regular{
             self.type = UseCase.recycled.rawValue
        } else {
             context.delete(self)
        }
       

        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    static func update(in context: NSManagedObjectContext,
                          note: Note) {
           let predicate = NSPredicate(format: "id=%@", note.id)
           let noteUpdate: NoteEntity = NSManagedObject.fetchOrCreate(context: context, entityName: NoteEntity.name, predicate: predicate)
           noteUpdate.id = noteUpdate.id ?? note.id
           noteUpdate.title  = note.title
           noteUpdate.content  = note.content
           
           do{
               try context.save()
           }
           catch
           {
               print(error)
           }
       }
    

}
