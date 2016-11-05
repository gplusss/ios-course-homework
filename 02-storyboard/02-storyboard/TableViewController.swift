//
//  TableViewController.swift
//  Diary
//
//  Created by Vladimir Saprykin on 19.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

enum Days: Int {
    case today, yesterday, this_week, earlier
}

class TableViewController: UITableViewController {

    fileprivate var diaries: Results<Diary>?
    
    func addTapped() {
        performSegue(withIdentifier: "showDetail", sender: nil)
        
        super.viewDidLoad()
    }
    
    func displayedDiaryAtIndexPath(_ indexPath: IndexPath) -> Diary? {
        return diaries?[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let vc = segue.destination as? SecondViewController else { return }
            vc.delegate = self
            vc.diary = sender as? Diary
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Diary"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem = addButton
        
        let realm = try! Realm()
        
        diaries = realm.objects(Diary.self).sorted(byProperty: "direction", ascending: true)
      
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaries?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        guard let diary = diaries?[indexPath.row] else { return cell }

        cell.nameLabel.text = diary.name
        cell.descriptionLabel.text = diary.formatDate()
        cell.imageLabel.image = UIImage(named: "weather_sun")
        cell.imageLabel.backgroundColor = UIColor.gray  
        cell.imageLabel.layer.cornerRadius = 0.5
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let diary = diaries?[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: diary)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { ( deleteAction, indexPath )  -> Void in
            if let diary = self.diaries?[indexPath.row] {
                
                let realm = try! Realm()
                
                try! realm.write {
                    realm.delete(diary)
                }
            }

            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        
        deleteAction.backgroundColor = UIColor.red
        return [deleteAction]
    }
}

extension TableViewController: SecondViewControllerDelegate {
    func didSaveDiary(_ diary: Diary) {
        tableView.reloadData()
    }
    
    func getImage(_ image: UISegmentedControl) {
        
    }
}



