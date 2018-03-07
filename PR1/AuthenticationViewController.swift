//
//  AuthenticationViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController, UITextFieldDelegate {
    // BEGIN-UOC-4

    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    @IBOutlet weak var fourthField: UITextField!
    
    // Text for messages
    let alertMessageText = "Please input a number (0..9)"
    let alertMessageTitle = "GGV_PEC1"
    
    // Array with for number positions
    var concatValidationFields: [Int] = [10,10,10,10]
    
    @IBAction func firstField(_ sender: UITextField) {
        // If a number entered
        if (Int(firstField.text!) != nil) {
            // Set value for this position
            concatValidationFields[0] = Int(firstField.text!)!
            // Set focus to next UITextField
            secondField.becomeFirstResponder()
        }
        // No number entered. Ask for a number to user
        else {
            Utils.show(Message: alertMessageText, WithTitle: alertMessageTitle,InViewController: self)
        }
    }
    @IBAction func secondField(_ sender: UITextField) {
        // If a number entered
        if (Int(secondField.text!) != nil) {
            // Set value for this position
            concatValidationFields[1] = Int(secondField.text!)!
            // Set focus to next UITextField
            thirdField.becomeFirstResponder()
        }
            // No number entered. Ask for a number to user
        else {
            Utils.show(Message: alertMessageText, WithTitle: alertMessageTitle,InViewController: self)
        }
    }
    @IBAction func thirdField(_ sender: UITextField) {
        // If a number entered
        if (Int(thirdField.text!) != nil) {
            // Set value for this position
            concatValidationFields[2] = Int(thirdField.text!)!
            // Set focus to next UITextField
            fourthField.becomeFirstResponder()
        }
            // No number entered. Ask for a number to user
        else {
            Utils.show(Message: alertMessageText, WithTitle: alertMessageTitle,InViewController: self)
        }
    }
    @IBAction func fourthField(_ sender: UITextField) {
        // If a number entered
        if (Int(fourthField.text!) != nil) {
            // Set value for this position
            concatValidationFields[3] = Int(fourthField.text!)!
            Utils.show(Message: alertMessageText, WithTitle: alertMessageTitle,InViewController: self)

        }
            // No number entered. Ask for a number to user
        else {
            Utils.show(Message: alertMessageText, WithTitle: alertMessageTitle,InViewController: self)
        }
    }
    
    // END-UOC-4
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    } 
}
