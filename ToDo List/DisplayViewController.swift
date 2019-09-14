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
    var selectedToDo : ToDoCoreData?
    
    @IBOutlet weak var Name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Name.text = selectedToDo?.name
        
        
    }
    
    @IBAction func CompleteTapped(_ sender: Any) {
 
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let theToDo = selectedToDo{
                context.delete(theToDo)

                navigationController?.popViewController(animated: true)

            }
            
        }
    }
    
}

