//
//  SettingsViewController.swift
//  Diary
//
//  Created by Vladimir Saprykin on 23.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit

let kDateFormat = "kDateFormat"

class SettingsViewController: UITableViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBOutlet weak var dateCell: SettingsViewCell?
    @IBOutlet weak var dateAndTimeCell: SettingsViewCell?
    
    var checked = Bool()
    
        func tapedCheck() {
          if checked == true {
            dateCell?.accessoryType = .checkmark
            dateAndTimeCell?.accessoryType = .none
          } else if checked == false {
            dateCell?.accessoryType = .none
            dateAndTimeCell?.accessoryType = .checkmark
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        
        let currentFormat = UserDefaults.standard.object(forKey: kDateFormat) as! String
        if currentFormat == "YYYY-MM-dd HH:mm" {
            checked = false
        } else {
            checked = true
        }
        
        tapedCheck()
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let section = 0
        let numberOfRows = tableView.numberOfRows(inSection: section)
        for row in 0..<numberOfRows {
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: section)) {
                cell.accessoryType = row == indexPath.row ? .checkmark : .none
            }
        }
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0: UserDefaults.standard.set("YYYY-MM-dd HH:mm", forKey: kDateFormat)
            case 1: UserDefaults.standard.set("YYYY-MM-dd", forKey: kDateFormat)
            default: return
            }
        }
    }
    
    @IBAction func doneButtoneClicked(_sender: UIBarButtonItem) {
        let _ = navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
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



