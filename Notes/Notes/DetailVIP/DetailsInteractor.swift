//
//  DetailsInteractor.swift
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

protocol DetailsBusinessLogic
{
  func configureView()
  func noteChanged(_ title: String?, content: String?)
    
}

protocol DetailsDataStore
{
  var selectedNote: Note! { set get}
  var worker: LocalStrageWorker! {set get}
}

class DetailsInteractor: DetailsBusinessLogic, DetailsDataStore
{
    
    
  var selectedNote: Note!
  var presenter: DetailsPresentationLogic?
  var worker: LocalStrageWorker!
  
  // MARK: Do something
    
    func configureView() {
        presenter?.configreView(note: selectedNote)
    }
    func noteChanged(_ title: String?, content: String?) {
        selectedNote.title = title
        selectedNote.content = content
         worker.updatNote(selectedNote)
    }
    
  
  
}