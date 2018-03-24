//
//  CompleteTaskViewController.swift
//  MyDoit
//
//  Created by Conan Tran on 1/27/18.
//  Copyright © 2018 Conan Tran. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var task : Task? = nil
    //var previousVC = TasksViewController()

    @IBOutlet weak var TaskName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task!.important {
            TaskName.text = "❗️\(task!.name!)"
        } else {
            TaskName.text = task!.name
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func CompleteTapped(_ sender: Any) {
        //previousVC.tasks.remove(at: previousVC.selectedIndex)
        // Update Task table from previous VC
        //previousVC.tableView.reloadData()
        
        // Get the context to the core data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Auto switch back to the previous VC
        navigationController!.popViewController(animated: true)
    }
    
}
