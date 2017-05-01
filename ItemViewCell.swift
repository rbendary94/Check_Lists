//
//  ItemViewCell.swift
//  Check_Lists
//
//  Created by Rana on 4/28/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class ItemViewCell: UITableViewCell {

    @IBOutlet var itemCheckedLabel : UILabel!
    @IBOutlet var itemTitle : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
