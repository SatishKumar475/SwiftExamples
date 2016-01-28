//
//  MyOrdersViewController.swift
//  AppShark
//
//  Created by satish on 11/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class MyOrdersViewController: UIViewController, UITableViewDataSource,UITableViewDelegate , SWRevealViewControllerDelegate {
    var appDelegate : AppDelegate!
    @IBOutlet var itemsTableView : UITableView!
    @IBOutlet var menubutton_MyOrders : UIBarButtonItem!
    @IBOutlet var favourateButton_MyOrders : UIBarButtonItem!
    @IBOutlet var searchButton_MyOrders : UIBarButtonItem!
    @IBOutlet var filterButton_MyOrders : UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 67/255, blue: 160/255, alpha: 1.0)
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //        appDelegate.selecteditemarray .addObject((detaialArray?.objectAtIndex(detailSelectedIndex!))!)
        print(appDelegate.placeorderItemsArray)
        self.navigationItem.setHidesBackButton(true, animated:true);
        let logo = UIImage(named: "covered16.png")
        let imageView = UIImageView(image:logo)
        //        imageView.layer.cornerRadius = imageView.frame.size.width/2
        //        imageView.layer.borderWidth = 1
        //        imageView.layer.borderColor = UIColor.whiteColor().CGColor
        self.navigationItem.titleView = imageView
        if revealViewController() != nil {
            menubutton_MyOrders.target = revealViewController()
            menubutton_MyOrders.action = "revealToggle:"
            //For left view\
            revealViewController().delegate = self
            revealViewController().rightViewRevealWidth = 0
            //                        filterButton_MyOrders.target = revealViewController()
            //                        filterButton_MyOrders.action = "rightRevealToggle:"
            
            //            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        // Do any additional setup after loading the view.
    }
    //    func revealController(revealController: SWRevealViewController!, willMoveToPosition position: FrontViewPosition)
    //    {
    //        if position == FrontViewPosition.Right     // if it not statisfy try this --> if revealController.frontViewPosition == FrontViewPosition.Left
    //        {
    //            self.view.userInteractionEnabled = true
    //            revealController.panGestureRecognizer().enabled=true
    //        }
    //        else
    //        {
    //            self.view.userInteractionEnabled = false
    //            revealController.panGestureRecognizer().enabled=false
    //        }
    //    }
    @IBAction func filterButtonClicked (sender : UIBarButtonItem!) {
        //        if revealViewController() != nil {
        //            revealViewController().rightViewRevealWidth = 200
        //            filterButton_Home.target = revealViewController()
        //            filterButton_Home.action = "rightRevealToggle:"
        //
        //            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        //        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.placeorderItemsArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyOrderTableViewCell", forIndexPath: indexPath) as! MyOrderTableViewCell
        cell.nameLabel.text = appDelegate.placeorderItemsArray.objectAtIndex(indexPath.row).valueForKey("itmesArray")!.valueForKey("Name") as? String
        cell.deleverdTime.text = appDelegate.placeorderItemsArray.objectAtIndex(indexPath.row).valueForKey("Estimatetime") as? String
        cell.descriptionLabel.text = appDelegate.placeorderItemsArray.objectAtIndex(indexPath.row).valueForKey("itmesArray")!.valueForKey("Discrption") as? String
        cell.timeLabel.text = appDelegate.placeorderItemsArray.objectAtIndex(indexPath.row).valueForKey("time") as? String
        //        cell.countLabel.text = appDelegate.placeorderItemsArray.objectAtIndex(indexPath.row).valueForKey("itmesArray")!.valueForKey("Name") as? String
        cell.countLabel.text = "1"
        return cell
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            appDelegate.placeorderItemsArray.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
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
