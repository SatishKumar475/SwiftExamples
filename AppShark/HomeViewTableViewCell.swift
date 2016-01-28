//
//  HomeViewTableViewCell.swift
//  AppShark
//
//  Created by satish on 14/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class HomeViewTableViewCell: UITableViewCell {
    @IBOutlet var itemImage : UIImageView!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var desricptionLabel : UILabel!
    @IBOutlet var ratingLabel : UILabel!
    @IBOutlet var favarateIconButton : UIButton!
    var clicked : Bool!
    override func awakeFromNib() {
        super.awakeFromNib()
        clicked = false
        let image = UIImage(named: "favorite21.png")
        favarateIconButton.setBackgroundImage(image, forState: UIControlState.Normal)
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func favourateButtonClicked (sender : UIButton!) {
        if clicked == false {
            let image = UIImage(named: "favorite21(1).png")
            favarateIconButton.setBackgroundImage(image, forState: UIControlState.Highlighted)
            favarateIconButton.setBackgroundImage(image, forState: UIControlState.Selected)
            favarateIconButton.setBackgroundImage(image, forState: UIControlState.Normal)
            
            clicked = true
        } else {
            let image = UIImage(named: "favorite21.png")
            favarateIconButton.setBackgroundImage(image, forState: UIControlState.Normal)
            clicked = false
        }
    }
    
}
