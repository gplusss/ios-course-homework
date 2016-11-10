//
//  DiariesViewController.swift
//  DiaryMVC
//
//  Created by Vladimir Saprykin on 09.11.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftDate

enum SegmentIndex: Int {
    case today, yesterday, last_week, all
}


class DiariesViewController: UITableViewController {
    
    fileprivate var diaries: Results<Diary>?
    
    let segmentController = UISegmentedControl()
    
        let realm = try! Realm()
    
    func filterSegment(_ sender: UISegmentedControl) {
        if let index = SegmentIndex(rawValue: segmentController.selectedSegmentIndex) {
            
        switch index {
        case .today: diaries = realm.objects(Diary.self).filter(NSPredicate(format: "direction < %@ AND direction > %@", Date().endOfDay as CVarArg, Date().startOfDay as CVarArg))
        case .yesterday:
            let yesterday = Date() - 1.days
            diaries = realm.objects(Diary.self).filter(NSPredicate(format: "direction < %@ AND direction > %@", yesterday.endOfDay as CVarArg, yesterday.startOfDay as CVarArg))
        case .last_week:
            let yesterday = Date() - 1.days
            let lastWeek = Date().isBefore(date: yesterday, granularity: .day)
            diaries = realm.objects(Diary.self).filter(NSPredicate(format: "direction < %@", lastWeek as CVarArg))
            
        default:
            break
        }
    }
        tableView.reloadData()
}
    override func viewDidLoad() {
        super.viewDidLoad()

        segmentController.frame = CGRect(x: 200, y: 30, width: 200, height: 30)
        
        segmentController.insertSegment(withTitle: "TODAY", at: 0, animated: true)
        segmentController.insertSegment(withTitle: "YESTERDAY", at: 1, animated: true)
        segmentController.insertSegment(withTitle: "LAST WEEK", at: 2, animated: true)
        segmentController.insertSegment(withTitle: "ALL", at: 3, animated: true)
        
        segmentController.addTarget(self, action: #selector(DiariesViewController.filterSegment(_:)), for: UIControlEvents.valueChanged)
        
        self.navigationItem.titleView = segmentController

        let realm = try! Realm()
        
        diaries = realm.objects(Diary.self)
        print(diaries as Any)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int)->Int {
        return diaries!.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (diaries?.count)!
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DiariesViewCell
        guard let diary = diaries?[indexPath.row] else { return cell }
        
        cell.nameLabel.text = diary.name
        cell.timeLabel.text = diary.formatDate()
                
        return cell
    }


}


