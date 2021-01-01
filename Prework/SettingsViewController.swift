//
//  SettingsViewController.swift
//  Prework
//
//  Created by Hanqi Zhang on 1/1/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstDefault: UISlider!
    @IBOutlet weak var secondDefault: UISlider!
    @IBOutlet weak var thirdDefault: UISlider!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveDefault(_ sender: Any) {
        //Access UserDefaults
        let defaults = UserDefaults.standard

        let firstValue = Int(firstDefault.value)
        let secondValue = Int(secondDefault.value)
        let thirdValue = Int(thirdDefault.value)
       
        defaults.set(firstValue, forKey: "first default")
        defaults.set(secondValue, forKey: "second default")
        defaults.set(thirdValue, forKey: "third default")

        // Force UserDefaults to save.
        defaults.synchronize()
    }
    
    @IBAction func firstChange(_ sender: Any) {
        firstLabel.text = "\(Int(firstDefault.value))%"
    }
    
    @IBAction func secondChange(_ sender: Any) {
        secondLabel.text = "\(Int(secondDefault.value))%"
    }
    
    @IBAction func thirdChange(_ sender: Any) {
        thirdLabel.text = "\(Int(thirdDefault.value))%"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
