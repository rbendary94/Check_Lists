//
//  AddCategoryViewController.swift
//  Check_Lists
//
//  Created by Rana on 4/28/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class AddCategoryViewController: UITableViewController , AddImageCategoryViewControllerDelegate {

    var delegate : AddCategoryControllerDelegate!
    var tempCategory : Categories?
    @IBOutlet weak var addCategoryText : UITextField!
    var itemToEdit = Categories()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    @IBAction func onDoneClick(){
        if let category = tempCategory{
            //Edit
            category.name = addCategoryText.text ?? ""
            delegate.editCategoryViewController(self, didFinishEditing: category)
            
        }else{
            //Add
            let category  = Categories()
            category.items = [Item()]
            category.name = addCategoryText.text ?? ""
            category.image = itemToEdit.image ?? #imageLiteral(resourceName: "No Icon")
            delegate.addCategoryViewController(self, didFinishAdding:  category)
   
        }
        
    }
    
    @IBAction func onCancelClick(){
        dismiss(animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChooseImage"{
            
            if let navigationControler = segue.destination as? UITableViewController{
                let controller = navigationControler as! AddImageCategoryViewController
                controller.delegateAddIcon = self 
            }
        }
    }

    func addIcon(_ controller : AddImageCategoryViewController, didFinish item: UIImage ){
        
        itemToEdit.image = item
    }



}



protocol AddCategoryControllerDelegate : class{
    
    func addCategoryViewControllerDidCancel(_ controller: AddCategoryViewController)
    
    func addCategoryViewController(_ controller: AddCategoryViewController, didFinishAdding category: Categories)
    
    func editCategoryViewController(_ controller: AddCategoryViewController, didFinishEditing category: Categories)
    
}
