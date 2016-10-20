//
//  TableViewController.swift
//  02-storyboard
//
//  Created by Vladimir Saprykin on 19.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
import Foundation

class TableViewController: UITableViewController {
    
//    var arrayName = ["Завтрак", "Обед", "Ланч", "Ужин"]
//    var arrayDate = [Date(), Date(), Date(), Date()]
    

    var diarys: [Diary] = diaryData
    
    
    func addTapped() {
        performSegue(withIdentifier: "showDetail", sender: nil)
        
        super.viewDidLoad()
    }

    override func viewDidLoad() {
        self.title = "Diary"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ADD", style: .plain, target: self, action: #selector(addTapped))
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diarys.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let diary = diarys[indexPath.row] as Diary
        
        cell.nameLabel.text = diary.name
        cell.dateLabel.text = String(describing: diary.date)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

