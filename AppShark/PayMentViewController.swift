//
//  PayMentViewController.swift
//  AppShark
//
//  Created by satish on 15/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class PayMentViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var paymentOptionTable : UITableView!
    var paymentType : NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        paymentType = ["NetBanking","CridiateCard","DebitCard","Cash","PayTM"]
        
        // Do any additional setup after loading the view.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentType.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as  UITableViewCell
        cell.textLabel?.text = paymentType[indexPath.row] as? String
        cell.textLabel?.font = UIFont(name: "Bold", size: 16)
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
    @IBAction func clickonNExtButton (sender : UIBarButtonItem!) {
        
        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .ShortStyle) as String
        print(timestamp)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        for var i: Int = 0 ; i < appDelegate.selecteditemarray.count ; i++ {
            let dictionary = ["itmesArray" : appDelegate.selecteditemarray[i] , "time" :timestamp , "Estimatetime" : "60 mins"] as NSDictionary
            appDelegate.placeorderItemsArray.addObject(dictionary)
        }
        appDelegate.selecteditemarray.removeAllObjects()
        let alertview = UIAlertController(title: "Success", message: "Your item will be succesfully place", preferredStyle: .Alert)
        let alertAction1 = UIAlertAction(title: "Back to Main", style: .Default) { (ACTION) -> Void in
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        alertview.addAction(alertAction1)
        self.presentViewController(alertview, animated: true, completion: nil)
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
