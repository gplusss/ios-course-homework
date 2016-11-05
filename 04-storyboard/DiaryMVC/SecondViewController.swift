//
//  TableViewController2.swift
//  DiaryMVC
//
//  Created by Vladimir Saprykin on 05.11.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol SecondViewControllerDelegate: class {
    func didSaveDiary(_ diary: Diary)
    func getImage(_ image: UISegmentedControl)
}

class SecondViewController: UITableViewController, UITextViewDelegate, UITextFieldDelegate {
    
    let segmentController = UISegmentedControl()
    var delegate: SecondViewControllerDelegate?
    
    func weatherController(_ sender: UISegmentedControl) {
        
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var directionsTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var weatherSegmentController: UISegmentedControl!
    
    var diary: Diary? {
        didSet {
            updateFields()
        }
    }
    
    func updateFields() {
        if let diary = diary {
            nameTextField?.text = diary.name
            directionsTextView?.text = diary.formatDate()
        } else {
            nameTextField?.text = ""
            directionsTextView?.text = ""
        }
    }
    
    func doneDidPressed() {
        view.endEditing(true)
    }
    
    func changeImageView(_ sender: UISegmentedControl) {
        
        //        let realm = try! Realm()
        //
        //        if Diary.Weather(rawValue: "rain") != nil {
        //          realm.objects(Diary.Weather(rawValue: "rain"))
        //        }
        //        let shower = Diary.Weather(rawValue: "shower")
        //        let storm = Diary.Weather(rawValue: "storm")
        
        
        //        if let index = Diary.Weather(rawValue: "rain") {
        //            switch index {
        //            case .rain: tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "rain"))
        //            case .shower: tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "shower"))
        //            case .storm: tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "storm"))
        //            default:
        //                break
        //            }
        //        }
        
        //         let index = segmentController.selectedSegmentIndex
        //            switch index {
        //            case 0: tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "rain"))
        //            case 1: tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "shower"))
        //            case 2: tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "storm"))
        //            default:
        //                break
        //
        //        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if diary?.name != nil {
            saveButton.setTitle("EDIT", for: UIControlState())
        } else {
            saveButton.setTitle("SAVE", for: UIControlState())
        }
        updateFields()
        
        segmentController.frame = CGRect(x: 200, y: 30, width: 200, height: 30)
        segmentController.insertSegment(with: UIImage(named: "weather_rain"), at: 0, animated: true)
        segmentController.insertSegment(with: UIImage(named: "weather_snow"), at: 1, animated: true)
        segmentController.insertSegment(with: UIImage(named: "weather_storm"), at: 2, animated: true)
        
        segmentController.addTarget(self, action: #selector(SecondViewController.changeImageView(_:)), for: UIControlEvents.valueChanged)
        self.navigationItem.titleView = segmentController
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        //        diary?.direction = textView.text
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        diary?.name = textField.text ?? ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func weatherSegmentController(_sender: UISegmentedControl) {
        
    }
    
    @IBAction func addButtonClicked(_ sender: AnyObject) {
        
        let title = nameTextField.text ?? ""
        
        let realm = try! Realm()
        realm.beginWrite()
        
        if diary?.name == nil {
            diary = Diary(name: title)
        } else {
            diary?.name = title
        }
        
        
        diary?.direction = datePicker.date
        
        doneDidPressed()
        delegate?.didSaveDiary(diary!)
        
        realm.add(diary!, update: true)
        try! realm.commitWrite()
        
        let _ = navigationController?.popViewController(animated: true)
    }
    
    func datePickerValueChanged(sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        directionsTextView.text = dateFormatter.string(from: sender.date)
        
    }
    
    @IBAction func datePicker(sender: UITextView) {
        let datePickerView: UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        datePickerView.addTarget(self, action: #selector(SecondViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
    }
    
}
