//
//  CompleteTaskViewController.swift
//  DayListt
//
//  Created by Avinash Reddy on 6/17/17.
//  Copyright © 2017 Avinash Reddy. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var task: Day? = nil
    var previousVC = HomeViewController()
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if task!.important {
            taskNameLabel.text = "‼️\(String(describing: task!.name!))"
        } else {
            taskNameLabel.text = "    \(String(describing: task!.name!))"
        }
        
        
        dateLabel.text = task!.date
    }
    
    
    @IBAction func completeTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        navigationController!.popViewController(animated: true)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
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
