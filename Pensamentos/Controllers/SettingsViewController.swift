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
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formartView()
    }
    
    func formartView(){
        swAutoRefresh.setOn(config.autorefresh,
                            animated: true)
        slTimeInterval.setValue(Float(config.timeInterval),
                                animated: true)
        csColorScheme.selectedSegmentIndex = config.colorScheme
        changeTimeIntervalLabel(with: config.timeInterval)
    }
    
    func changeTimeIntervalLabel(with value: Double){
        lbTimeInterval.text = "Mudar após \(value) segundos"
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autorefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(sender.value)
        changeTimeIntervalLabel(with: value)
        config.timeInterval = value
    }
    
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
    
}
