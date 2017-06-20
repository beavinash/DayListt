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
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "‼️ \(String(describing: task.name!))"
        } else {
            cell.textLabel?.text = "      \(String(describing: task.name!))"
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: SEGUE_SELECT, sender: task)
    }
    
    
    
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_ADD, sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Day.fetchRequest()) as! [Day]
            print(tasks)
        } catch {
            print("We have some error")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == SEGUE_SELECT {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Day
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

