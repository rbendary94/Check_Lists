//
//  CategoriesModel.swift
//  Check_Lists
//
//  Created by Rana on 4/28/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import Foundation
import UIKit

class Categories : NSObject, NSCoding{
    
    var items = [Item]()
    var name = ""
    var image : UIImage!
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "CategoryName")
        aCoder.encode(items, forKey: "CategoryItems")
        aCoder.encode(image, forKey: "CategoryImage")

    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "CategoryName") as! String
        items = aDecoder.decodeObject(forKey: "CategoryItems") as! [Item]
        image = aDecoder.decodeObject(forKey: "CategoryImage") as! UIImage

        super.init()
    }
    
}
