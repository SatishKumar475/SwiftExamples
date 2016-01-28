//
//  RegisterUserViewController.swift
//  AppShark
//
//  Created by satish on 17/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class RegisterUserViewController: UIViewController,UITextFieldDelegate {
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
        //        scroll.scrollRectToVisible(<#T##rect: CGRect##CGRect#>, animated: <#T##Bool#>)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    //    MARK : SiginButton Action
    @IBAction func clickSignInButton (sender : UIButton!){
        if firstname.text != "" && lastname.text != "" && email.text != "" && phonenumber.text != "" && password.text != "" && conformPassword.text != "" && agreeSwitch.on != false {
            if password.text == conformPassword.text {
                let dictionary = ["FirstName" : firstname.text! , "LastName" : lastname.text! , "Email" : email.text! , "PhoneNumber" : phonenumber.text! , "PassWord" : password.text!]
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.userDetailArray.addObject(dictionary)
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
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
