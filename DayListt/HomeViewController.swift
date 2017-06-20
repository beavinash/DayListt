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
        
        
        // Table View setup
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    // Table View Setup with rows and columns
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tasks.count == 0 {
            return 1
        } else {
            return tasks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if tasks.count == 0 {
            cell.textLabel?.text = "There are no Tasks"
        } else {
            
            let task = tasks[indexPath.row]
            
            if task.important {
                cell.textLabel?.text = "‼️ \(String(describing: task.name!))"
                cell.detailTextLabel?.text = task.date!
            } else {
                cell.textLabel?.text = "      \(String(describing: task.name!))"
                cell.detailTextLabel?.text = task.date!
            }
            
            
            
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tasks.count == 0 {
            return
        } else {
            let task = tasks[indexPath.row]
            performSegue(withIdentifier: SEGUE_SELECT, sender: task)
        }
    }
    
    
    
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_ADD, sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Day.fetchRequest()) as! [Day]
        } catch {
            print("We have some error")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == SEGUE_SELECT {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Day
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

