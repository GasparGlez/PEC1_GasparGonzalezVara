//
//  AuthenticationViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController, UITextFieldDelegate {
    // BEGIN-UOC-4
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    @IBOutlet weak var fourthField: UITextField!
    
    // Text & title for error messages
    let alertMessageText = "Please input a number (0..9)"
    let alertMessageTitle = "Validation error"
    
    // Array with four number positions.
    // Initialize array values to '10' as a null/invalid value
    var concatValidationFields: [Int] = [10,10,10,10]
    
    
    @IBAction func firstField(_ sender: UITextField) {
        let fieldValue = Int(firstField.text!) ?? 10
        // If a number (0..9) entered
        if (fieldValue<10) {
            // Set value for this position
            concatValidationFields[0] = fieldValue
            // Set focus to next UITextField
            secondField.becomeFirstResponder()
        }
        // No number entered. Ask for a number to user
        else {
            // Set a invalid value for this position
            concatValidationFields[0] = 10
            Utils.show(Message: alertMessageText, WithTitle: alertMessageTitle,InViewController: self)
        }
    }
    @IBAction func secondField(_ sender: UITextField) {
        let fieldValue = Int(secondField.text!) ?? 10
        // If a number (0..9) entered
        if (fieldValue<10) {
            // Set value for this position
            concatValidationFields[1] = fieldValue
            // Set focus to next UITextField
            thirdField.becomeFirstResponder()
        }
            // No number entered. Ask for a number to user
        else {
            // Set a invalid value for this position
            concatValidationFields[1] = 10
            Utils.show(Message: alertMessageText, WithTitle: alertMessageTitle,InViewController: self)
        }
    }
    @IBAction func thirdField(_ sender: UITextField) {
        let fieldValue = Int(thirdField.text!) ?? 10
        // If a number (0..9) entered
        if (fieldValue<10) {
            // Set value for this position
            concatValidationFields[2] = fieldValue
            // Set focus to next UITextField
            fourthField.becomeFirstResponder()
        }
            // No number entered. Ask for a number to user
        else {
            // Set a invalid value for this position
            concatValidationFields[2] = 10
            Utils.show(Message: alertMessageText, WithTitle: alertMessageTitle,InViewController: self)
        }
    }
    @IBAction func fourthField(_ sender: UITextField) {
        let fieldValue = Int(fourthField.text!) ?? 10
        // If a number (0..9) entered
        if (fieldValue<10) {
            // Set value for this position
            concatValidationFields[3] = fieldValue
            firstField.becomeFirstResponder()
        }
            // No number entered. Ask for a number to user
        else {
            // Set a invalid value for this position 
            concatValidationFields[3] = 10
            Utils.show(Message: alertMessageText, WithTitle: alertMessageTitle,InViewController: self)
        }
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // String with contatenation of incorrect/not numeric positions
        var incorrectPositions = ""
        // String with contatenation of the four positions
        var strConcatValidationFields = ""
        
        // Check every position entered (array elements)
        for item in 0...3 {
            // if concatValidationFields[item]>9 then this position contains an invalid value
            if (concatValidationFields[item]>9) {
                incorrectPositions += " " + "\(item + 1)"
            }
            // String with the code (concatenation of four numeric positions)
            strConcatValidationFields += String(concatValidationFields[item])
        }
        
        // Only if incorrectPositions == "" continue to next step
        if incorrectPositions == "" {
            // Validation of entered code
            // If code is correct, go to Main
            let pinCodeCorrect = Services.validate(code: strConcatValidationFields)
            if pinCodeCorrect {
                performSegue(withIdentifier: "SegueToMainNavigation", sender: self)
            }
            // Else entered code is not valid. Show a validation error message and clear fields
            else{
                firstField.text = ""
                secondField.text = ""
                thirdField.text = ""
                fourthField.text = ""
                firstField.becomeFirstResponder()
                Utils.show(Message: "Sorry, the entered code is not valid", WithTitle: alertMessageTitle,InViewController: self)
            }
        }
        // Else show incorrect positions to user
        else {
            Utils.show(Message: "Sorry, the entered code is not valid. " + "Please check positions:" + incorrectPositions, WithTitle: alertMessageTitle,InViewController: self)
        }
    }
    
    // Initial focus on firstField to start entering the 4 digit code
    // viewDidLoad() is the first method to be called when view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
        firstField.becomeFirstResponder()
    }
    // END-UOC-4
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    } 
}
