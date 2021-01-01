//
//  ViewController.swift
//  Prework
//
//  Created by Hanqi Zhang on 1/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var rateControl: UISlider!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTipSegmented(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let index = tipControl.selectedSegmentIndex
        let rate = Int(tipPercentages[index] * 100)
        let tip = bill * tipPercentages[index]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        rateControl.value = Float(rate)
        rateLabel.text = "\(rate)%"
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func calculateTipSlider(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        
        let rate = Int(rateControl.value)
        let tip = bill * Double(rate) / 100
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        rateLabel.text = "\(rate)%"
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

