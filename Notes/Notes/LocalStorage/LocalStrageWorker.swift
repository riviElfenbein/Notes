//
//  LocalStrageWorker.swift
//  Notes
//
//  Created by Rivi Elf on 01/01/2020.
//  Copyright (c) 2020 Rivi Elf. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import CoreData

class LocalStrageWorker
{
    let storage: LocalStorage
    let context: NSManagedObjectContext
    init() {
        self.storage = LocalStorage()
        self.context = storage.persistentContainer.newBackgroundContext()
    }
    
    func fetchNotes(_ useCase: UseCase) -> [Note]{
        guard let allNotes =  NoteEntity.fetch(context: context, useCase: useCase) else {
            return [Note]()
        }
        let structNotes = allNotes.map{ $0.toNoteStruct()}
        return structNotes
    }
    
    func deleteNote(useCase: UseCase, noteId: String){
        guard let note =  NoteEntity.fetchSingelNote(context: context, id: noteId)  else {
            return
        }
        
        note.delete(useCase: useCase, context: context)
    
    }
    
    func updatNote(_ note: Note) {
        NoteEntity.update(in: context, note: note)
    }
 
}