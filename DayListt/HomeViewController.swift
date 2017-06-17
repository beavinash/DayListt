//
//  ViewController.swift
//  DayListt
//
//  Created by Avinash Reddy on 6/16/17.
//  Copyright © 2017 Avinash Reddy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // property to store the tableview cell data
    var tasks: [Day] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // tasks data
        tasks = makeTasks()
        
        // Table View setup
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    // Table View Setup with rows and columns
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "‼️\(task.name)"
        } else {
            cell.textLabel?.text = "  − \(task.name)"
        }
        
        
        return cell
    }
    
    // Function to create task days
    func makeTasks() -> [Day] {
        let task1 = Day()
        task1.name = "Write notes"
        task1.date = "02/16/17"
        task1.important = true
        
        let task2 = Day()
        task2.name = "Write poem"
        task2.date = "02/16/17"
        task2.important = false
        
        let task3 = Day()
        task3.name = "Write notes"
        task3.date = "02/16/17"

        task3.important = true
        
        return [task1, task2, task3]
    }
    
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_ADD, sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

