//
//  CreateTaskViewController.swift
//  MyDoit
//
//  Created by Conan Tran on 1/27/18.
//  Copyright © 2018 Conan Tran. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var TaskNameTextField: UITextField!
    @IBOutlet weak var ImportantTaskSwitch: UISwitch!
    
    var previousVC = CreateTaskViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func AddTaskButton(_ sender: Any) {
        // Create a Task from the outlet info
        let task = Task()
        task.name = TaskNameTextField.text!
        task.important = ImportantTaskSwitch.isOn
        
        // Add new task to array in prev. VC
    }
    
}
