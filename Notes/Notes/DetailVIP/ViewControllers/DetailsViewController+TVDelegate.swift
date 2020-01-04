//
//  DetailsViewController+TVDelegate.swift
//  Notes
//
//  Created by Rivi Elf on 04/01/2020.
//  Copyright © 2020 Rivi Elf. All rights reserved.
//

import UIKit

extension DetailsViewController: UITextViewDelegate, UITextFieldDelegate {
       
       func textViewDidBeginEditing(_ textView: UITextView) {
           if textView.textColor == PlaceholderColor {
               textView.text = nil
               textView.textColor = TextColor
           }
       }
    
   
       
       func textViewDidEndEditing(_ textView: UITextView) {
           if textView.text.isEmpty {
               textView.text = PLACEHOLDER_TEXT
               textView.textColor = PlaceholderColor
           }
       }
    
       // Dismiss the keyboard when the user taps on the view
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
       
       // Dismiss keyboard when user taps the return key on the keyboard after editing
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           return false
       }
    
  
    
}

