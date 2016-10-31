//
//  SettingsViewController.swift
//  Diary
//
//  Created by Vladimir Saprykin on 23.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit

protocol SettingViewControllerDelegate: class {
    func date(_ : Diary)
}

class SettingsViewController: UITableViewController, UITextViewDelegate, UITextFieldDelegate {
    
    var delegate: SettingViewControllerDelegate?
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        self.title = "Settings"
        
        super.viewDidLoad()
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
        delegate?.date(Diary)
    }
    
    @IBAction func doneButtoneClicked(_sender: UIBarButtonItem) {
        print("done button clicked")
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



