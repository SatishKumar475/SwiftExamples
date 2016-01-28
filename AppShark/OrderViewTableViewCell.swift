//
//  OrderViewTableViewCell.swift
//  AppShark
//
//  Created by satish on 15/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class OrderViewTableViewCell: UITableViewCell {
    @IBOutlet var foodimage : UIImageView!
    @IBOutlet var itemlabel : UILabel!
    @IBOutlet var countLabel : UILabel!
    @IBOutlet var countRemoveButton : UIButton!
    var count = 0
    
    override func awakeFromNib() {
        count = 1
        
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func additemsCountButtonclicked (sender : UIButton!) {
        //        countLabel.text = count++ as String
        count += 1
        if count > 1 {
            countRemoveButton.hidden = false
        }
        countLabel.text = "\(count)"
        
    }
    @IBAction func removeCountButtonClicked (sender : UIButton!) {
        count -= 1
        if count == 1 {
            countRemoveButton.hidden = true
        }
        countLabel.text = "\(count)"
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
