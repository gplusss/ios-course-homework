//
//  ViewController.swift
//  Diary06
//
//  Created by Vladimir Saprykin on 13.11.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
import RealmSwift

let kDateFormat = "kDateFormat"

class EventViewController: UITableViewController {
    
    fileprivate var diaries: Results<Diary>?
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventViewCell
        guard let diary = diaries?[indexPath.row] else { return cell }
        
        cell.dateLabel.text = diary.formatDate()
        cell.weatherLabel.text = diary.weather.rawValue

        return cell
    }
    
    
    
    

}

