//
//  ForgotpasswordViewcontroller.swift
//  AppShark
//
//  Created by satish on 09/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class ForgotpasswordViewcontroller: UIViewController, UITextFieldDelegate {
    @IBOutlet var emailid : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        // Do any additional setup after loading the view.
    }
    @IBAction func ClickTheSubmitButton (sender : UIButton!) {
        if emailid.text != "" && CustomClass.shareinstance.validEmailId(emailid.text!) {
            let alertview = UIAlertController(title: "Success", message: "Please check Your email ", preferredStyle: .Alert)
            let action1 = UIAlertAction(title: "OK", style: .Default, handler: { (ACTION) -> Void in
                self.navigationController?.popViewControllerAnimated(true)
                
            })
            alertview.addAction(action1)
            self.presentViewController(alertview, animated: true, completion: nil)
        }else {
            CustomClass.shareinstance.alertviewActions("Error", alertmessage: "Please enter the email ", buttontitles: "Ok", view: self)
        }
    }
    //    MARK: Textfiled delegateMethods
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
