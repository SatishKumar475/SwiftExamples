//
//  RegisterViewController.swift
//  AppShark
//
//  Created by satish on 09/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class RegisterViewController: UITableViewController,UITextFieldDelegate {
    @IBOutlet var firstname : UITextField!
    @IBOutlet var lastname : UITextField!
    @IBOutlet var email : UITextField!
    @IBOutlet var phonenumber : UITextField!
    @IBOutlet var password : UITextField!
    @IBOutlet var conformPassword : UITextField!
    @IBOutlet var agreeSwitch : UISwitch!
    @IBOutlet var mainView : UIView!
    @IBOutlet var scroll : UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        firstname.userInteractionEnabled = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    //    MARK : SiginButton Action
    @IBAction func clickSignInButton (sender : UIButton!){
        if firstname.text != "" && lastname.text != "" && email.text != "" && phonenumber.text != "" && password.text != "" && conformPassword.text != "" && agreeSwitch.on != true {
            if password.text == conformPassword.text {
                CustomClass.shareinstance.alertviewActions("Success Message", alertmessage: "You are successfully Registred", buttontitles: "Ok", view: self)
            }
        }else {
            CustomClass.shareinstance.alertviewActions("Error", alertmessage: "Please fill the all fields", buttontitles: "Ok", view: self)
        }
    }
    //    MARK : Switch Button Action
    @IBAction func agreeTermsAndConditions (sender : UISwitch!) {
        CustomClass.shareinstance.alertviewActions("Agree Terms and Conditions", alertmessage: "Are you Ok For Agree Terms and Condtions", buttontitles: "Ok", view: self)
    }
    //    MARK : Textfield Delegate Methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 0
    }
    */
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
    
    // Configure the cell...
    
    return cell
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
