//
//  ViewController.swift
//  Prework
//
//  Created by Sharonda Daniels on 8/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountDisplay: UILabel!
    
    let defaultValues = UserDefaults.standard
    
    @IBAction func billFieldChanged(_ sender: Any) {
        // Get bill amount from text field input
        let update = Double(billAmountTextField.text!) ?? 0
        
        // Update Bill Amount Label
        billAmountDisplay.text = String(format: "$%.2f", update)
        
        // Call for tip calculation
        calculateTip(self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check to see if time last accessed was over 10 minutes, if so, restart state, if not, dont
        if defaultValues.object(forKey: "lastTime") == nil || (defaultValues.value(forKey: "lastTime") as! Date).timeIntervalSinceNow * -1 / 60 >= 10 {
            defaultValues.set(tipControl.selectedSegmentIndex, forKey: "lastTipVal")
        } else {
            // If there is no last tip value, set last tip value to current value
            if defaultValues.object(forKey: "lastTipVal") == nil {
                defaultValues.set(tipControl.selectedSegmentIndex, forKey: "lastTipVal")
            }
        }
        
        
        // Sets the title in the Navigation Bar
            //self.title = "Tip Buddy"
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // This is a good place to retrieve the default tip percentage from UserDefaults, note this functions runs after viewDidLoad
        let oldSelectedVal = defaultValues.value(forKey: "lastTipVal") as! Int

        // and use it to update the tip amount
        tipControl.selectedSegmentIndex = oldSelectedVal
        
        // Change keyboard to decimal type
        billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        
        // Keep keyboard up
        billAmountTextField.becomeFirstResponder()
        
        
    }

    /*
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }*/

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        
        // When the app is on the way to being closed, record the time it was last accessed
        defaultValues.set(NSDate.now, forKey: "lastTime")
    }

    /*
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }*/
    

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Update last value
        defaultValues.set(tipControl.selectedSegmentIndex, forKey: "lastTipVal")
        
        // Get Total tip by multiplying tip by tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
}

