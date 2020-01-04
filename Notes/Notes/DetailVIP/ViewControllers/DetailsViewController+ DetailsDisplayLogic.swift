//
//  DetailsViewController+ DetailsDisplayLogic.swift
//  Notes
//
//  Created by Rivi Elf on 04/01/2020.
//  Copyright © 2020 Rivi Elf. All rights reserved.
//

import UIKit


protocol DetailsDisplayLogic: class
{
  func onConfigureView(viewModel: DetailViewModel)
}

extension DetailsViewController: DetailsDisplayLogic {
    
    // Update the user interface when the detail item changes
    func onConfigureView(viewModel: DetailViewModel){
        idLabel.text = viewModel.note.id
        if let title = viewModel.note.title {
            titleTextField.text = title
        }
        
        if let content = viewModel.note.content {
            contentTextView.text = content
            contentTextView.textColor = UIColor.black
        }
    }
    
}
