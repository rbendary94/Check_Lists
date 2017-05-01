//
//  AddItemViewController.swift
//  Check_Lists
//
//  Created by Rana on 4/29/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
    
    
    var delegate: AddItemControllerDelegate!
    var itemToEdit :Item?
    @IBOutlet weak var addItemText : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func donePressed(){
        
        if let item = itemToEdit{
            item.title = addItemText.text ?? ""
            delegate.editItemViewController(self, didFinishEditing: item)
            
        }else{
            let item  = Item()
            item.title = addItemText.text ?? ""
            item.checked = true
            delegate.addItemViewController(self, didFinishAdding: item)
        }
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func cancelPressed(){
        
        dismiss(animated: true, completion: nil)
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

protocol AddItemControllerDelegate: class {
    
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: Item)
    
    func editItemViewController(_ controller: AddItemViewController, didFinishEditing item: Item)
    
}


