//
//  SettingsViewController.swift
//  Diary
//
//  Created by Vladimir Saprykin on 23.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit

protocol SettingViewControllerDelegate: class {
    func date()
}

class SettingsViewController: UITableViewController, UITextViewDelegate, UITextFieldDelegate {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let section = 0
        let numberOfRows = tableView.numberOfRows(inSection: 0)
        for row in 0..<numberOfRows {
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: section)) {
                cell.accessoryType = row == indexPath.row ? .checkmark : .none
                
            }
        }
        

    }
    
    @IBAction func switcher(_ sender: UISwitch) {
        
        if sender.isOn == false {
            self.tableView.backgroundColor = UIColor.red
            NSLog("red")
            
        } else if sender.isOn == true {
            self.tableView.backgroundColor = UIColor.blue
            NSLog("blue")
        }
    }
}



