//
//  CalculatorViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // BEGIN-UOC-7.1
    // Outlets for every element
    @IBOutlet weak var initialAmountLabel: UILabel!
    @IBOutlet weak var initialAmountSlider: UISlider!
    @IBOutlet weak var interestRateLabel: UILabel!
    @IBOutlet weak var interestRateStepper: UIStepper!
    @IBOutlet weak internal var yearsLabel: UILabel!
    @IBOutlet weak var yearsStepper: UIStepper!
    @IBOutlet weak var finalAmountLabel: UILabel!
    // END-UOC-7.1
    
    // BEGIN-UOC-7.2
    // All input values can not be null, because they are prefixed and not nullable by the user, so, it is not necessary to use
    // null validations with everyone (e.g. optionals)
    
    // Function to update finalAmount with current values
    func updatefinalAmount () {
        let finalAmount = Services.calculateFinalAmount(ForAmount: initialAmountSlider.value, WithInterest: interestRateStepper.value/100, AndYears: yearsStepper.value)
        finalAmountLabel.text = "Final amount: " + String(format: "%.2f", finalAmount) + " €"
    }
    
    @IBAction func initialAmountChanges(_ sender: Any) {
        // Update initialAmountLabel text
        initialAmountLabel.text = "Initial amount: " + String(format: "%.0f",initialAmountSlider.value) + " €"
        // Update finalAmount with new value updated
        updatefinalAmount ()
        
    }
    @IBAction func interestRateChanges(_ sender: Any) {
        // Update interestRateLabel text
        interestRateLabel.text = "Interest rate: " + String(format: "%.2f",interestRateStepper.value) + " %"
        // Update finalAmount with new value updated
        updatefinalAmount ()
    }
    
    @IBAction func yearsChanges(_ sender: Any) {
        // Update yearsLabel text
        yearsLabel.text = "Years: " + String(format: "%.0f",yearsStepper.value)
        // Update finalAmount with new value updated
        updatefinalAmount ()
    }
    // END-UOC-7.2
    
    // BEGIN-UOC-7.3
    // Initialize labels with values indicated by default
    // viewDidLoad() is the first method to be called when view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
        initialAmountLabel.text = "Initial amount: 100 €"
        interestRateLabel.text = "Interest rate: 1.00 %"
        yearsLabel.text = "Years: 1"
        // Update finalAmount with initial values
        updatefinalAmount ()
    }
    // END-UOC-7.3
}
