//
//  ItemsViewController.swift
//  Check_Lists
//
//  Created by Rana on 4/28/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController, AddItemControllerDelegate {

    var delegate : ItemsViewControllerDelegate!
    var categoryItems = [Item]()
    var currentCategory : Categories!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    
        return categoryItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemViewCell", for: indexPath) as! ItemViewCell
        
        let categoryItem = categoryItems[indexPath.row]
        cell.itemTitle.text = categoryItem.title
        
        
        cell.itemCheckedLabel.text = categoryItem.checked ? "✅" : ""

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        categoryItems[indexPath.row].toggleCheckmark()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        categoryItems.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddCategoryItems"{
            if let navigationController = segue.destination as? UINavigationController{
                let controller = navigationController.topViewController! as! AddItemViewController
                controller.delegate = self as AddItemControllerDelegate
                
            }
        }else if segue.identifier == "EditItem"{
            
            if let navigationControler = segue.destination as? UINavigationController{
                let controller = navigationControler.topViewController! as!
                AddItemViewController
                controller.delegate = self
                
                if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                    controller.itemToEdit = categoryItems[indexPath.row]
                    
                }
            }
            
        }
        
    }
    

    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: Item)
    {
        print("delegate done recieved")
        
        let newRowIndex = categoryItems.count
        categoryItems.append(item)
        currentCategory.items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.automatic)
        dismiss(animated: true, completion: nil)
    }
    
    func editItemViewController(_ controller: AddItemViewController, didFinishEditing item: Item){
        let newRowIndex = categoryItems.index(of: item)!
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.reloadRows(at: indexPaths, with: .automatic)
        
    }

}


protocol ItemsViewControllerDelegate : class{
    
    func showCategoryItems()
    
}
