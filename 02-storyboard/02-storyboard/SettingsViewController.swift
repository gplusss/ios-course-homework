//
//  SettingsViewController.swift
//  02-storyboard
//
//  Created by Vladimir Saprykin on 23.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellD&T", for: indexPath) as! SettingsViewCell
        
        cell.dateAndTime.text = "Date and Time"
        cell.dateOnly.text = "Date Only"
        //cell.dateAndTime.accessoryType = UITableViewCellAccessoryType.checkmark
        cell.accessoryType = .checkmark
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let section = indexPath.section
        let numberOfRows = tableView.numberOfRows(inSection: section)
        for row in 0..<numberOfRows {
            
            if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
                cell.accessoryType = row == indexPath.row ? .checkmark : .none
 
            }
            
//            if let cell = tableView.cellForRowAtIndexPathIndexPath(forRow: row, inSection: section)) {
//                cell.accessoryType = row == indexPath.row ? .Checkmark : .None
//            }
        }
        // ... update the model ...
    }
    
    
    
    

}
