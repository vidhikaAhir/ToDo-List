//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Demo on 21/08/19.
//  Copyright © 2019 vidhika. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDos : [ToDoCoreData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getToDos()
    }
    
    // MARK: - Table view data source
    
    func getToDos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataToDos = try? context.fetch(ToDoCoreData.fetchRequest()) as? [ToDoCoreData]{
                if let theToDos : [ToDoCoreData] = coreDataToDos{
                toDos = theToDos
                tableView.reloadData()
                }
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func createTodos() -> [ToDo] {
        
        let eggs = ToDo()
         eggs.name = "Eggs"
         eggs.important = true
         
         let dog = ToDo()
         dog.name = "Walk the dog"
         dog.important = false
         
         let cheese = ToDo()
         cheese.name = "Eat Cheese"
         cheese.important = false
         
         
        return []
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        
        if let name : String = toDo.name {
            
            if toDo.important {
                cell.textLabel?.text = "❗️" + name
            } else {
                cell.textLabel?.text = toDo.name
            }
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
            
            if let toDo = sender as? ToDoCoreData{
                
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
    }
    
    
    
    
}
