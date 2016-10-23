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

    fileprivate var diaries = [Diary]() {
        didSet {
            invalidateDisplayedDiarys()
        }
    }

    
    fileprivate func invalidateDisplayedDiarys(animated: Bool = false) {
        if animated {
            tableView?.reloadSections(IndexSet(integer: 0), with: UITableViewRowAnimation.automatic)
        } else {
            tableView?.reloadData()
        }
    }
    
    func addTapped() {
        performSegue(withIdentifier: "showDetail", sender: nil)
        
        super.viewDidLoad()
    }
    
    func displayedDiaryAtIndexPath(_ indexPath: IndexPath) -> Diary {
        return diaries[(indexPath as NSIndexPath).row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let vc = segue.destination as? SecondViewController else { return }
            vc.delegate = self
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
        cell.nameLabel.text = diary.name
        cell.descriptionLabel.text = diary.direction
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let diary = diaries[diaries.index(diaries.startIndex, offsetBy: (indexPath as NSIndexPath).row)]
        performSegue(withIdentifier: "showDetail", sender: diary)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //TODO Delete Action
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { ( deleteAction, indexPath )  -> Void in
            //self.diaries.remove(at: self.diaries.index(self.diaries.startIndex, offsetBy: (indexPath as NSIndexPath).row))
            self.diaries.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let doneAction = UITableViewRowAction(style: .normal, title: "Done") { ( doneAction, indexPath ) -> Void in
            
        }
        deleteAction.backgroundColor = UIColor.red
        return [deleteAction, doneAction]
    }
}

extension TableViewController: SecondViewControllerDelegate {
    func didSaveDiary(_ diary: Diary) {
        diaries.append(diary)
    }
}

