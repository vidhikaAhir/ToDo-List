//
//  DisplayViewController.swift
//  ToDo List
//
//  Created by Demo on 08/09/19.
//  Copyright © 2019 vidhika. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    var selectedToDo = ToDo()
    
    @IBOutlet weak var Name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Name.text = selectedToDo.name
        
        
    }
    
    @IBAction func CompleteTapped(_ sender: Any) {
        var index = 0
        for i in previousVC.toDos{
            print(index)
            if i.name == selectedToDo.name{
                
                previousVC.toDos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
                
            }
            index += 1
        }
            
    }
    
}
