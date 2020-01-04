//
//  NSMangedObject+HelperMethods.swift
//  Notes
//
//  Created by Rivi Elf on 04/01/2020.
//  Copyright © 2020 Rivi Elf. All rights reserved.
//

import Foundation
import CoreData


extension NoteEntity {
    static func fetchSingelNote(context: NSManagedObjectContext, id: String) -> NoteEntity? {
        let predicate = NSPredicate(format: "id=%@", id)
        let note: NoteEntity? = NSManagedObject.fetchSingle(context: context, entityName: NoteEntity.name, predicate: predicate)
        return note
    }
    
    
    
    static func fetch(context: NSManagedObjectContext, useCase: UseCase) -> [NoteEntity]? {
        let predicate = NSPredicate(format: "type == %i", useCase.rawValue)

        let notes: [NoteEntity]? = NSManagedObject.fetch(context: context, entityName: NoteEntity.name, predicate: predicate)
        return notes
    }
    
    func toNoteStruct() -> Note {
        let useCase = UseCase(rawValue: self.type) ?? UseCase.regular
        let note = Note(id: self.id!, type: useCase, title: self.title, content: self.content)
        return note
    }
    
}



extension NSManagedObject {
    
    static func fetchOrCreate<T>(context: NSManagedObjectContext, entityName: String, predicate: NSPredicate) -> T {
        if let entity: T = fetchSingle(context: context, entityName: entityName, predicate: predicate) as? T {
            return entity
        }
        
        // Not found. Create new entity.
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! T
    }
    
    static func fetchSingle<T>(context: NSManagedObjectContext,
                               entityName: String,
                               predicate: NSPredicate) -> T? where T: NSManagedObject {

        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = predicate
        if let objects = try? context.fetch(fetchRequest) {
            return objects.first
        }
        return nil
    }
    
    static func fetch<T>(context: NSManagedObjectContext,
                         entityName: String,
                         predicate: NSPredicate? = nil) -> [T]? where T: NSManagedObject {
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.predicate ?!= predicate
        if let objects = try? context.fetch(fetchRequest) {
            return objects
        }
        return nil
    }
}
