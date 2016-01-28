//
//  ViewController.swift
//  AppShark
//
//  Created by satish on 09/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController , UITextFieldDelegate{
     let managedObejectCOntacs = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    @IBOutlet var usernametextfiled : UITextField!
    @IBOutlet var passwordtextfiled : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    //    MARK: LoginButton Action
    @IBAction func clickLoginButton (sender : UIButton!) {
        let entityDiscription = NSEntityDescription.entityForName("UserCreadintial", inManagedObjectContext: managedObejectCOntacs)
        let contact = UserCreadintial(entity: entityDiscription!,
            insertIntoManagedObjectContext: managedObejectCOntacs)
        contact.firstName = "Satish"
        contact.lastName = "kumar"
        contact.email = "123456789@gmail.com"
        contact.phoneNumber = "123456789525554"
        contact.passWord = "dsjfkjdsf"
        do {
            try self.managedObejectCOntacs.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        let moc = managedObejectCOntacs
        let employeesFetch = NSFetchRequest(entityName: "UserCreadintial")
        
        do {
            let fetchedEmployees = try moc.executeFetchRequest(employeesFetch) as! [UserCreadintial]
            print("\(fetchedEmployees)")
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        if usernametextfiled.text != "" && passwordtextfiled.text != "" && CustomClass.shareinstance.validEmailId(usernametextfiled.text!) {
            let leftViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SWRevealViewController") as! SWRevealViewController
            self.navigationController?.pushViewController(leftViewController , animated: true)
        }else {
            CustomClass.shareinstance.alertviewActions("Error", alertmessage: "Please fill all fields", buttontitles: "OK",view:self)
        }
    }
    
    //    MARK: Textfiled delegate methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField .resignFirstResponder()
        return true
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

