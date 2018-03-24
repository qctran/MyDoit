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
    //var selectedIndex = 0
    
    // call once at the beginning
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // step 5
        // tasks = makeTasks()
        
        // step 1
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // call everytime the view appear
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
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
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // For deletion use
        //selectedIndex = indexPath.row
        
        let temp = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: temp)
    }
    
    @IBAction func plusTap(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    // Get the tasks out from the core data
    func getTasks(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            tasks = try context.fetch(Task.fetchRequest()) as![Task]
            print(tasks)
        } catch{
            print("We have problem with core data fetch!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "selectTaskSegue"{
            let completeVC = segue.destination as!CompleteTaskViewController
            completeVC.task = sender as? Task
            // For back VC ref.
            //completeVC.previousVC = self
        }
    }
}

