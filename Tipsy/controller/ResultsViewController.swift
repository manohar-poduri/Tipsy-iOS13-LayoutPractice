//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Gowri on 2/19/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var splitAmount : String = "0.0"
    var splitPeople: String = ""
    var tipPercent : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = splitAmount
        settingsLabel.text = "Split between \(splitPeople) people, with \(tipPercent) tip."
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
