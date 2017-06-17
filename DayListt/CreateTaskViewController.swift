//
//  CreateTaskViewController.swift
//  DayListt
//
//  Created by Avinash Reddy on 6/17/17.
//  Copyright © 2017 Avinash Reddy. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var datePickerTextField: UITextField!
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var dateNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createDatePicker()
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
    }
    
    func createDatePicker() {
        
        // format for date picker controller
        datePicker.datePickerMode = .date
        
        // toolbar creation
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneTapped))
        toolbar.setItems([doneButton], animated: true)
        
        datePickerTextField.inputAccessoryView = toolbar
        
        // assigning date picker to text field
        datePickerTextField.inputView = datePicker
    }
    
    func doneTapped() {
        
        // date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        datePickerTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
