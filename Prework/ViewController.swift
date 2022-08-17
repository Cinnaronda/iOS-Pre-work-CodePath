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
    
    // String Displays
    @IBOutlet weak var billDisplay: UILabel!
    @IBOutlet weak var totalDisplay: UILabel!
    @IBOutlet weak var tipDisplay: UILabel!
    @IBOutlet weak var literalBillAmountDisplay: UILabel!
    @IBOutlet weak var tipPercentageDisplay: UILabel!
    
    @IBOutlet weak var bottomView: UIView!
    let defaultValues = UserDefaults.standard
    public var percentageToUse = 0

    
    
    @IBAction func segmentSelected(_ sender: Any) {
        if tipControl.selectedSegmentIndex == 3 {
            // create the alert
            
            let alert = UIAlertController(title: "Tip Percentage", message: "Enter the percentage you would like to tip.", preferredStyle: UIAlertController.Style.alert)
            
            alert.view.tintColor = UIColor.init(red: 1, green: 0, blue: 94/255, alpha: 1)

            alert.addTextField {
                (customPercentage) in
                customPercentage.placeholder = "%"
                customPercentage.keyboardType = UIKeyboardType.numberPad
            }
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { [weak alert] (_) in
                let field = alert?.textFields![0]
                self.percentageToUse = Int(field!.text ?? "") ?? -1
                self.defaultValues.set(self.percentageToUse, forKey: "percentToUse")
                self.calculateTip(self)
            }))
            
            self.present(alert, animated: true, completion: nil)
            
        } else {
            self.calculateTip(self)
        }
    }
    
    
    
    @IBOutlet weak var settingsButton: UIButton!
    
    
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
        
        let bottom = CALayer()
        bottom.frame = CGRect(x: 0, y: billAmountTextField.frame.height - 2, width: billAmountTextField.frame.width, height: 2)
        
        bottom.backgroundColor = UIColor.gray.cgColor
        
        billAmountTextField.borderStyle = UITextField.BorderStyle.none
        billAmountTextField.layer.addSublayer(bottom)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // This is a good place to retrieve the default tip percentage from UserDefaults, note this functions runs after viewDidLoad
        let oldSelectedVal = defaultValues.value(forKey: "lastTipVal") as! Int

        // and use it to update the tip amount
        tipControl.selectedSegmentIndex = oldSelectedVal
        
        
         if oldSelectedVal == 3 {
             self.percentageToUse = defaultValues.value(forKey: "percentToUse") as! Int
             print(percentageToUse)
         }
         
        
        // Change keyboard to decimal type
        billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        
        // Keep keyboard up
        billAmountTextField.becomeFirstResponder()
        
        self.totalDisplay.font = UIFont(name: "Comfortaa", size: 42)
        self.billDisplay.font = UIFont(name: "Comfortaa", size: 29)
        self.tipDisplay.font = UIFont(name: "Comfortaa", size: 29)
        self.literalBillAmountDisplay.font = UIFont(name: "Comfortaa", size: 30)
        self.tipPercentageDisplay.font = UIFont(name: "Comfortaa", size: 30)
        self.totalLabel.font = UIFont(name: "Comfortaa", size: 59)
        self.billAmountDisplay.font = UIFont(name: "Comfortaa", size: 34)
        self.tipAmountLabel.font = UIFont(name: "Comfortaa", size: 34)
        self.bottomView.layer.cornerRadius = 10
        
        if SettingsViewController.colorSelected == UIColor.red {
            switch (defaultValues.value(forKey: "lastColor") as! Int)  {
              case 0:
                self.view.backgroundColor = UIColor.init(red: 229/255, green: 93/255, blue: 116/255, alpha: 1)
                break
            case 1:
              self.view.backgroundColor = UIColor.init(red: 18/255, green: 197/255, blue: 151/255, alpha: 1)
              break
            case 2:
                self.view.backgroundColor = UIColor.init(red: 253/255, green: 171/255, blue: 9/255, alpha: 1)
              break
            default:
                self.view.backgroundColor = UIColor.init(red: 229/255, green: 93/255, blue: 116/255, alpha: 1)
                break
            }
                
        } else {
            self.view.backgroundColor = SettingsViewController.colorSelected
        }
        //(defaultValues.value(forKey: "lastColor") ?? -1)
        
        defaultValues.set(SettingsViewController.colorSelectedAsNumber, forKey: "lastColor")
        
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    

    func calculateTip(_ sender: Any) {
        
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Update last value
        defaultValues.set(tipControl.selectedSegmentIndex, forKey: "lastTipVal")
        
        // Get Total tip by multiplying tip by tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2, Double(percentageToUse) * 0.01]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        
        defaultValues.set(NSDate.now, forKey: "lastTime")

        
    }
    
}

