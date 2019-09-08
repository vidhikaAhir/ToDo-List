//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Demo on 21/08/19.
//  Copyright © 2019 vidhika. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toDos = createTodos()
    }

    // MARK: - Table view data source

    
    func createTodos() -> [ToDo] {
        
        /*let eggs = ToDo()
        eggs.name = "Eggs"
        eggs.important = true
        
        let dog = ToDo()
        dog.name = "Walk the dog"
        dog.important = false
        
        let cheese = ToDo()
        cheese.name = "Eat Cheese"
        cheese.important = false
 
 */
        return []
 
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos[indexPath.row]
      
        if toDo.important == false {
        cell.textLabel?.text = toDo.name
        }else{
            cell.textLabel?.text = "❗️\(toDo.name)"
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController{
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? DisplayViewController{
            
            if let toDo = sender as? ToDo{
                
            completeVC.selectedToDo = toDo
            completeVC.previousVC = self
            }
        }
    }
    
    

    
}
