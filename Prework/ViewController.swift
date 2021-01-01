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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let firstDefault = defaults.integer(forKey: "first default")
        print(firstDefault)
        let secondDefault = defaults.integer(forKey: "second default")
        let thirdDefault = defaults.integer(forKey: "third default")
        
        tipControl.setTitle("\(firstDefault)%", forSegmentAt: 0)
        tipControl.setTitle("\(secondDefault)%", forSegmentAt: 1)
        tipControl.setTitle("\(thirdDefault)%", forSegmentAt: 2)
        let tipPercentages = [firstDefault, secondDefault, thirdDefault]
        
        let index = tipControl.selectedSegmentIndex
        let rate = Int(tipPercentages[index])
        rateLabel.text = "\(rate)%"
        billField.text = "0"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.becomeFirstResponder()
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTipSegmented(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        
        let defaults = UserDefaults.standard
        let firstDefault = defaults.integer(forKey: "first default")
        let secondDefault = defaults.integer(forKey: "second default")
        let thirdDefault = defaults.integer(forKey: "third default")
        
        let tipPercentages = [firstDefault, secondDefault, thirdDefault]
        
        let index = tipControl.selectedSegmentIndex
        let rate = Int(tipPercentages[index])
        let tip = bill * Double(tipPercentages[index])/100
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

