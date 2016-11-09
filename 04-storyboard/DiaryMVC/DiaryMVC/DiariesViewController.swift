//
//  DiariesViewController.swift
//  DiaryMVC
//
//  Created by Vladimir Saprykin on 09.11.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
import RealmSwift

class DiariesViewController: UITableViewController {
    
    fileprivate var diaries: Results<Diary>?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SortDiaries"

        let realm = try! Realm()
        
        diaries = realm.objects(Diary.self)
        print(diaries as Any)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


