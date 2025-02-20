//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumLabel: UILabel!
    @IBOutlet weak var stepperValue: UIStepper!
    
    var value : Float = 0.0
    var billTotalSplit : Float = 0.0
    var tipButton: String = ""
    override func viewDidLoad() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    
       // billTextField.becomeFirstResponder()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.titleLabel?.text == zeroPctButton.currentTitle {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
             value = 0/100
        } else if sender.titleLabel?.text == tenPctButton.currentTitle {
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
            value = 10/100
        } else if sender.titleLabel?.text == twentyPctButton.currentTitle {
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
            
            value = 20/100
        }
        billTextField.endEditing(true)
        tipButton = (sender.titleLabel?.text)!
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        if sender.value >= 12 {
            sender.isEnabled = false
        } else if sender.value <= 0 {
            sender.isEnabled = false
        } else {
            sender.isEnabled = true
        }
        splitNumLabel.text = String(Int(sender.value))
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("\(value)")
        
        let billTotalTip = (Float(billTextField.text!)! * (value))
        billTotalSplit = (Float(billTextField.text!)! + billTotalTip) / Float(splitNumLabel.text!)!
        print("\(String(format: "%.2f", ceil(billTotalSplit * 100)/100))")
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.splitAmount = String(format: "%.2f",billTotalSplit)
            destinationVC.splitPeople = splitNumLabel.text!
            destinationVC.tipPercent = tipButton
        }
    }
}

