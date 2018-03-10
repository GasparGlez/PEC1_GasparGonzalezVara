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
        
        // Check credentials are the same as expected
        let loginAllowed = Services.validate(username: (usernameField.text)!, password: (passwordField.text)!)
        // Credentials are OK -> Go to next step
        if loginAllowed {
            performSegue(withIdentifier: "SegueToAuthentication", sender: self)
        }
        // Error message and don't go to next step
        else{
            Utils.show(Message: "Sorry, the username and password are invalid", WithTitle: "Validation error", InViewController: self)
        }
    }
    // END-UOC-2
    
    // BEGIN-UOC-5
    // This method is called everytime the view is about to be shown on screen. Overriding this method we can perform custom tasks
    // associated with displaying the view because the code inside will run before the user is shown the view.
    override func viewWillAppear(_ animated: Bool) {
        // Calling the super class function, as we are overriding it, we want to ensure any code is called from the parent class
        super.viewWillAppear(animated)
        // Set .text property to "" to initialize these UITextFields
        usernameField.text=""
        passwordField.text=""
    }

    // END-UOC-5
    
    // BEGIN-UOC-6

    // END-UOC-6
    
    @IBAction func unwindToLogin(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("Unwind to login")
    }
}
