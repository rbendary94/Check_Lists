//
//  Item.swift
//  Check_Lists
//
//  Created by Rana on 4/28/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import Foundation

class Item : NSObject, NSCoding{
    
    var title = ""
    var checked = false
    
    func toggleCheckmark(){
        checked = !checked
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
    required init?(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()
    }
    override init() {
        super.init()
    }
    
}
