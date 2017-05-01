//
//  AddImageCategoryViewController.swift
//  Check_Lists
//
//  Created by Rana on 4/29/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class AddImageCategoryViewController: UITableViewController {

    var delegateAddIcon :AddImageCategoryViewControllerDelegate!
    var icons = [#imageLiteral(resourceName: "No Icon"),#imageLiteral(resourceName: "Appointments"),#imageLiteral(resourceName: "Birthdays"),#imageLiteral(resourceName: "Chores"),#imageLiteral(resourceName: "Drinks"),#imageLiteral(resourceName: "Folder"),#imageLiteral(resourceName: "Groceries"),#imageLiteral(resourceName: "Inbox"),#imageLiteral(resourceName: "Photos"),#imageLiteral(resourceName: "Trips")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let _ = tableView.cellForRow(at: indexPath) {
            delegateAddIcon.addIcon(self, didFinish: icons[indexPath.row])
            dismiss(animated: true, completion: nil)
        }
        
        navigationController?.popViewController(animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    

}

protocol AddImageCategoryViewControllerDelegate :class {
    func addIcon(_ controller : AddImageCategoryViewController, didFinish item: UIImage )

}
