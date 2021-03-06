//
//  LoginViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!

    // BEGIN-UOC-2
    @IBAction func loginTapped(_ sender: UIButton) {
        
        // Using optionals to prevent always empty values
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        // Check if username is empty
        if username == "" {
            // Focus on usernameField
            usernameField.becomeFirstResponder()
            Utils.show(Message: "Sorry, Username is empty", WithTitle: "Validation error", InViewController: self)
        }
        else
            // Check if password is empty
            if password == "" {
                // Focus on passwordField
                passwordField.becomeFirstResponder()
                Utils.show(Message: "Sorry, Password is empty", WithTitle: "Validation error", InViewController: self)
            }
            else {
                // Username & Passsword are not empty. Check credentials are the same as expected
                let loginAllowed = Services.validate(username: username, password: password)
        
                // If credentials are OK then go to next step
                if loginAllowed {
                    performSegue(withIdentifier: "SegueToAuthentication", sender: self)
                }
                // Else clean fields and show error message
                else{
                    // Focus on usernameField
                    usernameField.becomeFirstResponder()
                    // Set .text property to "" to initialize these UITextFields
                    usernameField.text=""
                    passwordField.text=""
                    // Error message
                    Utils.show(Message: "Sorry, the username and password are invalid", WithTitle: "Validation error", InViewController: self)
                    }
                }
    }
    // END-UOC-2
    
    // BEGIN-UOC-5
    // viewWillAppear method is called everytime the view is about to be shown on screen. Overriding this method we can perform
    // custom tasks associated with displaying the view, because the code inside will run before the user/password are shown.
    override func viewWillAppear(_ animated: Bool) {
        // Calling the super class function, as we are overriding it, we want to ensure any code is called from the parent class
        super.viewWillAppear(animated)
        // Set .text property to "" to initialize these UITextFields
        usernameField.text=""
        passwordField.text=""
        // Initial focus on usernameField
        usernameField.becomeFirstResponder()
    }
    // END-UOC-5
    
    // BEGIN-UOC-6
    // viewDidLoad() is the first method to be called when view controller loads. It’s a good place to do any initialization.
    // In this case, to get hour and show a hour-custom user welcome message.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get system hour
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)

        // Text & background color for every hour interval
        switch (hour) {
        case (6...11):
            welcomeLabel.text = "Good morning"
            self.view.backgroundColor = UIColor.orange.lighter()
        case (12...17):
            welcomeLabel.text = "Good afternoon"
            self.view.backgroundColor = UIColor.yellow.lighter()
        case (18...21):
            welcomeLabel.text = "Good evening"
            self.view.backgroundColor = UIColor.red.lighter()
        // Between 22 and 5
        default:
            welcomeLabel.text = "Good night"
            self.view.backgroundColor = UIColor.blue.lighter()
        }
    }
    // END-UOC-6
    
    @IBAction func unwindToLogin(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("Unwind to login")
    }
}
