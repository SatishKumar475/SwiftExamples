//
//  DetailViewController.swift
//  AppShark
//
//  Created by satish on 15/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var detaialArray : NSMutableArray?
    var detailSelectedIndex : NSInteger?
    var selecteditemsArray : NSMutableArray!
    @IBOutlet var foodimageView : UIImageView!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var descriptionLabel : UILabel!
    @IBOutlet var rateingLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selecteditemsArray = NSMutableArray()
        //        self.title = detaialArray?.objectAtIndex(detailSelectedIndex!).valueForKey("Name") as? String
        let image = UIImage(named: (detaialArray?.objectAtIndex(detailSelectedIndex!).valueForKey("Image"))! as! String)
        foodimageView.image = image
        nameLabel.text = detaialArray?.objectAtIndex(detailSelectedIndex!).valueForKey("Name") as? String
        descriptionLabel.text = detaialArray?.objectAtIndex(detailSelectedIndex!).valueForKey("Discrption") as? String
        rateingLabel.text = detaialArray?.objectAtIndex(detailSelectedIndex!).valueForKey("Rating") as? String
        selecteditemsArray.addObject((detaialArray?.objectAtIndex(detailSelectedIndex!))!)
        // Do any additional setup after loading the view.
    }
    @IBAction func selectitemAsforOrders (sender : UIBarButtonItem!) {
        let orderview = storyboard?.instantiateViewControllerWithIdentifier("OrderViewController") as! OrderViewController
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.selecteditemarray .addObject((detaialArray?.objectAtIndex(detailSelectedIndex!))!)
        self.navigationController?.pushViewController(orderview, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
