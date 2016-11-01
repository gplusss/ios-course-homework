//
//  TableViewController.swift
//  Diary
//
//  Created by Vladimir Saprykin on 19.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class TableViewController: UITableViewController {

    fileprivate var diaries = [NSManagedObject]()
    
    fileprivate var _displayedRecipes: [NSManagedObject]?

    
    func saveDiary(name: String) {
        
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        
        let entity =  NSEntityDescription.entityForName("Diary",
                                                        inManagedObjectContext:managedContext)
        
        let name = NSManagedObject(entity: entity!,
                                     insertIntoManagedObjectContext: managedContext)
        let formatDate = NSManagedObject(entity: entity!,
                                   insertIntoManagedObjectContext: managedContext)
        
        name.setValue(name, forKey: "name")
        formatDate.setValue(name, forKey: "formatDate")
        
        
        do {
            try managedContext.save()
            
            diaries.append(name)
            diaries.append(formatDate)
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func addTapped() {
        performSegue(withIdentifier: "showDetail", sender: nil)
        
        super.viewDidLoad()
    }
    
    func displayedDiaryAtIndexPath(_ indexPath: IndexPath) -> NSManagedObject {
        return diaries[(indexPath as NSIndexPath).row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let vc = segue.destination as? SecondViewController else { return }
            vc.delegate = self
            vc.diary = sender as? NSManagedObject 
        }
    }

    override func viewDidLoad() {
        self.title = "Diary"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem = addButton
        
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Diary")
        
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            diaries = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        
        
        
        
        tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let diary = diaries[indexPath.row]
        
        cell.nameLabel.text = diary.value(forKey: "name") as! String?
        cell.descriptionLabel.text = diary.value(forKey: "formatDate") as! String?
        //cell.nameLabel.text = diary.name
        //cell.descriptionLabel.text = diary.formatDate()
        //cell.backgroundView = UIImageView(image: #imageLiteral(resourceName: "rain"))
    
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let diary = diaries[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: diary)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { ( deleteAction, indexPath )  -> Void in
            self.diaries.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }

            deleteAction.backgroundColor = UIColor.red
        return [deleteAction]
    }
}

extension TableViewController: SecondViewControllerDelegate {
    func didSaveDiary(_ diary: NSManagedObject) {
        let exist = diaries.contains { (diaryObj) -> Bool in
            diaryObj == diary
        }
        if(!exist) {
            diaries.append(diary)
        }
        tableView.reloadData()
    }
    
    func getImage(_ image: UISegmentedControl) {
        
    }
}



