//
//  OrderViewController.swift
//  AppShark
//
//  Created by satish on 15/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var itemsTableview : UITableView!
    @IBOutlet var subtotalLabel : UILabel!
    @IBOutlet var totalLabel : UILabel!
    var ordermenuarray : NSMutableArray!
    var selectedindex : NSInteger!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subtotalLabel.text = "2.5$"
        totalLabel.text = "2.6$"
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        ordermenuarray = appDelegate.selecteditemarray
        // Do any additional setup after loading the view.
    }
    @IBAction func addMoreItemsButtonClicked (sender : UIButton!) {
        //        let homeView = storyboard?.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
        //       revealViewController().popToViewController(homeView, animated: true)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func placetoOrderButtonClicked (sender : UIButton!) {
        let placeOrder = storyboard?.instantiateViewControllerWithIdentifier("PlaceOrderViewController") as! PlaceOrderViewController
        self.navigationController?.pushViewController(placeOrder, animated: true)
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordermenuarray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("OrderViewTableViewCell", forIndexPath: indexPath) as! OrderViewTableViewCell
        cell.foodimage.image = UIImage(named: (ordermenuarray.objectAtIndex(indexPath.row).valueForKey("Image"))! as! String)
        cell.itemlabel.text = (ordermenuarray.objectAtIndex(indexPath.row).valueForKey("Name"))! as? String
        return cell
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
