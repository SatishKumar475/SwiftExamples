//
//  MyOrderTableViewCell.swift
//  AppShark
//
//  Created by satish on 16/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class MyOrderTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var descriptionLabel : UILabel!
    @IBOutlet var timeLabel : UILabel!
    @IBOutlet var countLabel : UILabel!
    @IBOutlet var deleverdTime : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
