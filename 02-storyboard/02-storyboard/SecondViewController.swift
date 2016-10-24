//
//  SecondViewController.swift
//  02-storyboard
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
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var directionsTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
        
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
        
        if diary?.name != nil {
            saveButton.setTitle("EDIT", for: UIControlState())
            
        } else {
            saveButton.setTitle("SAVE", for: UIControlState())
        }
        //nameTextField.text = diary?.name
        
        super.viewDidLoad()
        updateFields()
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
    
    
    @IBAction func addButtonClicked(_ sender: AnyObject) {
        NSLog("clicked")
        
        let title = nameTextField.text ?? ""
        let date = datePicker.date
        
        if diary?.name == nil {
            diary = Diary(name: title)
        } else {
            diary?.name = title
        }
        
        diary?.direction = String(describing: date)
        
        doneDidPressed()
        delegate?.didSaveDiary(diary!)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func datePickerValueChanged(sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.medium
        
        directionsTextView.text = dateFormatter.string(from: sender.date)
        
    }
    // MARK: sender Date Picker
    
    @IBAction func datePicker(sender: UITextView) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date        
        
        datePickerView.addTarget(self, action: #selector(SecondViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
    }

    
}
