//
//  CategoriesTableViewController.swift
//  Check_Lists
//
//  Created by Rana on 4/28/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController, AddCategoryControllerDelegate, ItemsViewControllerDelegate {

    var categories = [Categories]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        saveChecklistItems()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryViewCell", for: indexPath) as! CategoryViewCell

        let category = categories[indexPath.row]
        cell.categoryTitle.text = category.name
        cell.categoryIcon.image = categories[indexPath.row].image
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        categories.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "AddCategorySegue"{
        
            if let navigationController = segue.destination as? UINavigationController{
                let controller = navigationController.topViewController! as! AddCategoryViewController
                controller.delegate = self as AddCategoryControllerDelegate

            }
        }else if segue.identifier == "EditCategorySegue"{
            if let navigationController = segue.destination as? UINavigationController{
                let controller = navigationController.topViewController! as! AddCategoryViewController
                controller.delegate = self as AddCategoryControllerDelegate
                
                if let indexPath = tableView.indexPath(for: sender as! UITableViewCell!){
                    controller.tempCategory = categories[indexPath.row]
                }
                
            }
        }else if segue.identifier == "ShowItemsCategoryViewController" {
            if let navigationController = segue.destination as? UITableViewController{
                let controller = navigationController as! ItemsViewController
                controller.delegate = self as ItemsViewControllerDelegate
                
                if let indexPath = tableView.indexPath(for: sender as! UITableViewCell!){
                    controller.categoryItems = categories[indexPath.row].items
                    controller.currentCategory = categories[indexPath.row]
                }
                
            }
            
        }
    }
    

    func addCategoryViewControllerDidCancel(_ controller: AddCategoryViewController){
        dismiss(animated: true, completion: nil)

    }
    
    func addCategoryViewController(_ controller: AddCategoryViewController, didFinishAdding category: Categories){
        print("delegate done recieved")
        
        let newRowIndex = categories.count
        categories.append(category)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.automatic)
        dismiss(animated: true, completion: nil)
        
    }
    
    func editCategoryViewController(_ controller: AddCategoryViewController, didFinishEditing category: Categories){
        
//        print("delegate done recieved")
//        
//        let newRowIndex = categories.index(of: category)!
//        
//        let indexPath = IndexPath(row: newRowIndex, section: 0)
//        let indexPaths = [indexPath]
//        tableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.automatic)
//        dismiss(animated: true, completion: nil)
        
        
    }
    
  
    
    func saveChecklistItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(categories, forKey: "Categories")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }
    
    func loadChecklistItems() {
        //1
        let path = dataFilePath()
        // 2
        if let data = try? Data(contentsOf: path) {
            // 3
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            categories = unarchiver.decodeObject(forKey: "Categories") as! [Categories]
            unarchiver.finishDecoding()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        categories = [Categories]()
        super.init(coder: aDecoder)
        loadChecklistItems()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Check_Lists_Data.plist")
    }
    func showCategoryItems(){
        
        
    }
    


}
