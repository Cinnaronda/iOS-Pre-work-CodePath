//
//  SettingsViewController.swift
//  Prework
//
//  Created by Sharonda Daniels on 8/12/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    static var colorSelected = UIColor.init(red: 229/255, green: 93/255, blue: 116/255, alpha: 1)
    
    static var colorSelectedAsNumber = 0

    @IBOutlet weak var pinkButton: UIButton!
    
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var yellowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch (SettingsViewController.colorSelectedAsNumber)  {
          case 0:
            pinkButton.setImage(UIImage(systemName: "dot.circle.fill"), for: UIControl.State.normal)
            break
        case 1:
          greenButton.setImage(UIImage(systemName: "dot.circle.fill"), for: UIControl.State.normal)
          break
        case 2:
          yellowButton.setImage(UIImage(systemName: "dot.circle.fill"), for: UIControl.State.normal)
          break
        default:
            break
        }
        
        // Do any additional setup after loading the view.
      
        
    }
    
    @IBAction func pinkColorRequested(_ sender: Any) {
        SettingsViewController.colorSelected = UIColor.init(red: 229/255, green: 93/255, blue: 116/255, alpha: 1)
        
        yellowButton.setImage(UIImage(systemName: "circle.fill"), for: UIControl.State.normal)
        greenButton.setImage(UIImage(systemName: "circle.fill"), for: UIControl.State.normal)
        pinkButton.setImage(UIImage(systemName: "dot.circle.fill"), for: UIControl.State.normal)
        
        SettingsViewController.colorSelectedAsNumber = 0
    }
    
    @IBAction func greenColorRequested(_ sender: Any) {
        SettingsViewController.colorSelected = UIColor.init(red: 18/255, green: 197/255, blue: 151/255, alpha: 1)
        
        pinkButton.setImage(UIImage(systemName: "circle.fill"), for: UIControl.State.normal)
        yellowButton.setImage(UIImage(systemName: "circle.fill"), for: UIControl.State.normal)
        greenButton.setImage(UIImage(systemName: "dot.circle.fill"), for: UIControl.State.normal)
        
        SettingsViewController.colorSelectedAsNumber = 1

    }
    
    @IBAction func yellowColorRequested(_ sender: Any) {
        SettingsViewController.colorSelected = UIColor.init(red: 253/255, green: 171/255, blue: 9/255, alpha: 1)
        pinkButton.setImage(UIImage(systemName: "circle.fill"), for: UIControl.State.normal)
        greenButton.setImage(UIImage(systemName: "circle.fill"), for: UIControl.State.normal)
        
        yellowButton.setImage(UIImage(systemName: "dot.circle.fill"), for: UIControl.State.normal)
        
        SettingsViewController.colorSelectedAsNumber = 2

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
