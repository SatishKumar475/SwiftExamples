//
//  MenuViewController.swift
//  AppShark
//
//  Created by satish on 09/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate{
    @IBOutlet var mainView : UIView!
    @IBOutlet var imageview : UIImageView!
    @IBOutlet var listTableview : UITableView!
    var listArray : NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIScreen.mainScreen().bounds.height == 480 {
            listTableview.scrollEnabled = true
        }
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
        imageview.layer.cornerRadius = imageview.frame.size.width/0.5
        imageview.layer.borderWidth = 2
        imageview.layer.borderColor = UIColor.whiteColor().CGColor
        listArray = ["MenuList","MyOrders","CallNow","About US","Profile","Logout"]
        
    }
    //    MARK: TableviewDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return listArray.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Custom", forIndexPath: indexPath)
        //        cell.textLabel?.text = listArray[indexPath.row] as? String
        return cell
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headeView = UIView(frame: CGRectMake(0,0,tableView.frame.size.width,55))
        let headerlabel = UILabel(frame: CGRectMake(10,10,tableView.frame.size.width-20,35))
        headerlabel.text = listArray[section] as? String
        headerlabel.textAlignment = NSTextAlignment.Center
        headerlabel.font = UIFont(name: "Bold", size: 12)
        headerlabel.layer.borderWidth = 1
        headerlabel.layer.cornerRadius = 5
        headerlabel.layer.borderColor = UIColor.yellowColor().CGColor
        headerlabel.textColor = UIColor.whiteColor()
        headeView.addSubview(headerlabel)
        headeView.tag = section
        let tap = UITapGestureRecognizer(target: self, action: "ClickHeaderView:")
        tap.delegate  = self
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        headeView.addGestureRecognizer(tap)
        return headeView
    }
    func ClickHeaderView (sender : UIGestureRecognizer!) {
        if sender.view?.tag == 0 {
            let home = storyboard?.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
            let navigationforHomeView = UINavigationController(rootViewController: home)
            revealViewController().pushFrontViewController(navigationforHomeView, animated: true)
            //             performSegueWithIdentifier("Home", sender: self)
        }
        if sender.view?.tag == 1 {
            let ordersview = storyboard?.instantiateViewControllerWithIdentifier("MyOrdersViewController") as! MyOrdersViewController
            let navigationforOrderView = UINavigationController(rootViewController: ordersview)
            revealViewController().pushFrontViewController(navigationforOrderView, animated: true)
            //            performSegueWithIdentifier("MyOrders", sender: self)
        }
        if sender.view?.tag == 2 {
            let callNowView = storyboard?.instantiateViewControllerWithIdentifier("CallNowViewController") as! CallNowViewController
            let navigationforcallNowView = UINavigationController(rootViewController: callNowView)
            revealViewController().pushFrontViewController(navigationforcallNowView, animated: true)
            //            performSegueWithIdentifier("CallNow", sender: self)
            //            CallNow
        }
        if sender.view?.tag == 3 {
            let aboutUsView = storyboard?.instantiateViewControllerWithIdentifier("AboutUSViewController") as! AboutUSViewController
            let navigationforaboutUsView = UINavigationController(rootViewController: aboutUsView)
            revealViewController().pushFrontViewController(navigationforaboutUsView, animated: true)
            //             performSegueWithIdentifier("AboutUs", sender: self)
            //            AboutUs
        }
        if sender.view?.tag == 4 {
            let profileView = storyboard?.instantiateViewControllerWithIdentifier("ProfileViewController") as! ProfileViewController
            let navigationforprofileView = UINavigationController(rootViewController: profileView)
            revealViewController().pushFrontViewController(navigationforprofileView, animated: true)
            //            performSegueWithIdentifier("Profile", sender: self)
            //            Profile
        }
        if sender.view?.tag == 5 {
            let alertview = UIAlertController(title: "Logout", message: "Are U Sure for Logout ", preferredStyle: .Alert)
            let alertAction1 = UIAlertAction(title: "Ok", style: .Default) { (ACTION) -> Void in
                self.navigationController?.popViewControllerAnimated(true)
            }
            let alertAction2 = UIAlertAction(title: "Cancel", style: .Default) { (ACTION) -> Void in
                //                self.navigationController?.popViewControllerAnimated(true)
            }
            alertview.addAction(alertAction1)
            alertview.addAction(alertAction2)
            self.presentViewController(alertview, animated: true, completion: nil)
            
        }
    }
    //    MARK: TableViewDataSources Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
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
