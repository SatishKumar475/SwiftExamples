//
//  ProfileViewController.swift
//  AppShark
//
//  Created by satish on 11/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet var menubutton_Profile : UIBarButtonItem!
    @IBOutlet var userName : UILabel!
    @IBOutlet var email : UILabel!
    @IBOutlet var phoneNumber : UILabel!
    @IBOutlet var passowrd : UILabel!
    @IBOutlet var favourateButton_Profile : UIBarButtonItem!
    @IBOutlet var searchButton_Profile : UIBarButtonItem!
    @IBOutlet var filterButton_Profile : UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 67/255, blue: 160/255, alpha: 1.0)
        self.navigationItem.setHidesBackButton(true, animated:true);
        let logo = UIImage(named: "covered16.png")
        let imageView = UIImageView(image:logo)
        //        imageView.layer.cornerRadius = imageView.frame.size.width/2
        //        imageView.layer.borderWidth = 1
        //        imageView.layer.borderColor = UIColor.whiteColor().CGColor
        self.navigationItem.titleView = imageView
        if revealViewController() != nil {
            menubutton_Profile.target = revealViewController()
            menubutton_Profile.action = "revealToggle:"
            //For left view
            //                        revealViewController().rightViewRevealWidth = 200
            //                        filterButton_Profile.target = revealViewController()
            //                        filterButton_Profile.action = "rightRevealToggle:"
            
            //            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if appDelegate.userDetailArray.count != 0 {
            userName.text = (appDelegate.userDetailArray[0].valueForKey("FirstName") as! String)+(appDelegate.userDetailArray[0].valueForKey("LastName") as! String)
            email.text = appDelegate.userDetailArray[0].valueForKey("Email") as? String
            phoneNumber.text = appDelegate.userDetailArray[0].valueForKey("PhoneNumber") as? String
            passowrd.text = appDelegate.userDetailArray[0].valueForKey("PassWord") as? String
        }else {
            return
        }
        // Do any additional setup after loading the view.
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
