//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by André Felipe de Sousa Almeida - AAD on 20/09/21.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var slTimeInterval: UISlider!
    @IBOutlet weak var csColorScheme: UISegmentedControl!
    @IBOutlet weak var lbTimeInterval: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
    }
    
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
    }
    
}
