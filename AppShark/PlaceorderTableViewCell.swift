//
//  PlaceorderTableViewCell.swift
//  AppShark
//
//  Created by satish on 15/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class PlaceorderTableViewCell: UITableViewCell {
    @IBOutlet var line1Label : UILabel!
    @IBOutlet var line2Label : UILabel!
    @IBOutlet var line3Label : UILabel!
    @IBOutlet var selectionButton : UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func AddressSerection (sender : UIButton!) {
        
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
