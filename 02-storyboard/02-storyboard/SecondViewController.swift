//
//  SecondViewController.swift
//  Diary
//
//  Created by Vladimir Saprykin on 20.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation
import UIKit

protocol SecondViewControllerDelegate: class {
    func didSaveDiary(_ diary: Diary)
}

class SecondViewController: UITableViewController, UITextViewDelegate, UITextFieldDelegate {
    
    weak var delegate: SecondViewControllerDelegate?
    let segmentController = UISegmentedControl()
    
    
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
            directionsTextView?.text = diary.direction
        } else {
            nameTextField?.text = ""
            directionsTextView?.text = ""
        }
    }
    
    func doneDidPressed() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if diary?.name != nil {
            saveButton.setTitle("EDIT", for: UIControlState())
        } else {
            saveButton.setTitle("SAVE", for: UIControlState())
        }
        updateFields()
        
        segmentController.addTarget(self, action: #selector(SecondViewController.weatherController(_:)), for: UIControlEvents.valueChanged)
        
        //segmentController.fr
        
        segmentController.frame = CGRect(x: 200, y: 30, width: 200, height: 30)
        segmentController.insertSegment(with: UIImage(named: "weather_rain"), at: 0, animated: true)
        segmentController.insertSegment(with: UIImage(named: "weather_snow"), at: 1, animated: true)
        segmentController.insertSegment(with: UIImage(named: "weather_storm"), at: 2, animated: true)
        self.navigationItem.titleView = segmentController
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        diary?.direction = textView.text
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        diary?.name = textField.text ?? ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dateFormat() {
        
        
    }
    
    @IBAction func weatherSegmentController(_sender: UISegmentedControl) {
        
    }
        
    @IBAction func addButtonClicked(_ sender: AnyObject) {
        
        let format = DateFormatter()
        format.dateFormat = "YYYY-MM-dd"
        let strDate = format.string(from: datePicker.date)
        
        let title = nameTextField.text ?? ""
        let date = strDate
        
        if diary?.name == nil {
            diary = Diary(name: title)
        } else {
            diary?.name = title
        }
        
        let _ = navigationController?.popViewController(animated: true)
               self.dismiss(animated: true, completion: nil)
        
        diary?.direction = String(describing: date)
        
        doneDidPressed()
        delegate?.didSaveDiary(diary!)
        
        self.dismiss(animated: true, completion: nil)
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
