//
//  NotesListTVCViewController+NotesListTVCDisplayLogic.swift
//  Notes
//
//  Created by Rivi Elf on 04/01/2020.
//  Copyright © 2020 Rivi Elf. All rights reserved.
//

import UIKit

protocol NotesListTVCDisplayLogic: class
{
    func displayNextScreen()
    func onViewDidLoad(viewModel: ListViewModel)
    func reloadTable(viewModel: ListViewModel)
}


extension NotesListTVCViewController: NotesListTVCDisplayLogic {
    
    func onViewDidLoad(viewModel: ListViewModel) {
        self.viewModel = viewModel
        self.title = viewModel.title
        self.setNavigationButtons()
        self.tableView.reloadData()
        
    }
    
    func reloadTable(viewModel: ListViewModel) {
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
    
       
       func displayNextScreen(){
           self.performSegue(withIdentifier: "ShowDetail", sender: nil)
       }
       
       
    
    private func setNavigationButtons(){
        switch viewModel.useCase {
        case .regular:
            setNotesView()
        case .recycled:
            setRecycleView()
        }
    }
    
    private func setRecycleView(){
        addButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(changeStatePressed(_:)))
        navigationItem.leftBarButtonItem = addButton
        navigationItem.rightBarButtonItem = nil
    }
    
    private func setNotesView(){
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        
        recycleButton =  UIBarButtonItem(barButtonSystemItem: .trash, target: self, action:  #selector(changeStatePressed(_:)))
        navigationItem.rightBarButtonItem = recycleButton
        navigationItem.leftBarButtonItem = addButton
    }
    
}
