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
    @IBAction func initialAmountChanges(_ sender: Any) {
        // Update initialAmountLabel text
        initialAmountLabel.text = "Initial amount: " + String(format: "%.0f",initialAmountSlider.value) + " €"
        // Calculate finalAmount with new values updated
        let finalAmount = Services.calculateFinalAmount(ForAmount: initialAmountSlider.value, WithInterest: interestRateStepper.value/100, AndYears: yearsStepper.value)
        finalAmountLabel.text = "Final amount: " + String(format: "%.2f", finalAmount) + "€"
        
    }
    @IBAction func interestRateChanges(_ sender: Any) {
        // Update interestRateLabel text
        interestRateLabel.text = "Interest rate: " + String(format: "%.2f",interestRateStepper.value) + " %"
        // Calculate finalAmount with new values updated
        let finalAmount = Services.calculateFinalAmount(ForAmount: initialAmountSlider.value, WithInterest: interestRateStepper.value/100, AndYears: yearsStepper.value)
        finalAmountLabel.text = "Final amount: " + String(format: "%.2f", finalAmount) + "€"
        
    }
    
    @IBAction func yearsChanges(_ sender: Any) {
        // Update yearsLabel text
        yearsLabel.text = "Years: " + String(format: "%.0f",yearsStepper.value)
        // Calculate finalAmount with new values updated
        let finalAmount = Services.calculateFinalAmount(ForAmount: initialAmountSlider.value, WithInterest: interestRateStepper.value/100, AndYears: yearsStepper.value)
        finalAmountLabel.text = "Final amount: " + String(format: "%.2f", finalAmount) + "€"
        
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
        finalAmountLabel.text = "Final amount: 101.00 €"
    }
    // END-UOC-7.3
}
