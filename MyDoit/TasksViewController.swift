//
//  TasksViewController.swift
//  MyDoit
//
//  Created by Conan Tran on 1/22/18.
//  Copyright © 2018 Conan Tran. All rights reserved.
//

import UIKit

// step 2
class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // step 5
        tasks = makeTasks()
        
        // step 1
        tableView.dataSource = self
        tableView.delegate = self
    }

    // step 3
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // step 7
        return tasks.count
    }
    
    // step 4
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        // step 6
        let task = tasks[indexPath.row]
        
        // step 8
        if task.important {
            cell.textLabel?.text = "!\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }

    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the cat"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy dinner"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Go see movie"
        task3.important = false
        
        return [task1, task2, task3]
    }
    
    @IBAction func plusTap(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    
}

