//
//  NotesListTVC+TableView.swift
//  Notes
//
//  Created by Rivi Elf on 04/01/2020.
//  Copyright © 2020 Rivi Elf. All rights reserved.
//

import UIKit


extension NotesListTVCViewController {
    // MARK: - Table View
       override func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return viewModel.count
       }

       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
           cell.textLabel!.text = viewModel.titleForNote(index: indexPath)
           return cell
       }

       // Enable swipe-to-delete
       override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           return true
       }
       
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let object = viewModel.noteFor(index: indexPath)
           interactor?.didSelect(object)
          
       }
       
       // Handle a swipe into swipe-to-delete
       override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               let object = viewModel.noteFor(index: indexPath)
               interactor?.delete(object)
           }
              
       }
}
