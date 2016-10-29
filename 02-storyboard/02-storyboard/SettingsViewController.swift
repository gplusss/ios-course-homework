//
//  SettingsViewController.swift
//  Diary
//
//  Created by Vladimir Saprykin on 23.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    let switcher = UISwitch()

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let section = indexPath.section
        let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
        for row in 0..<numberOfRows {
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: section)) {
                cell.accessoryType = row == indexPath.row ? .checkmark : .none
            }
        }
    }
    
    @IBAction func switcher(_ sender: AnyObject) {
        
        if switcher.isOn {
            self.tableView.backgroundColor = UIColor.brown
            
        } else if switcher.isOn == false {
            self.tableView.backgroundColor = UIColor.blue
        }
    }
    
    
    

}
