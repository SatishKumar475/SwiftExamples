//
//  CustomClass.swift
//  AppShark
//
//  Created by satish on 09/12/15.
//  Copyright © 2015 Satish. All rights reserved.
//

import UIKit

class CustomClass: NSObject {
    class var shareinstance : CustomClass {
        get {
            struct Static {
                static var instance: CustomClass? = nil
                static var token:dispatch_once_t = 0
            }
            dispatch_once(&Static.token, {
                Static.instance = CustomClass()
            })
            return Static.instance!
        }
    }
    func alertviewActions(titl:String,alertmessage:String,buttontitles:String,view : AnyObject) {
        let alertview = UIAlertController(title: titl, message: alertmessage, preferredStyle: .Alert)
        let alertAction1 = UIAlertAction(title: buttontitles, style: .Default) { (ACTION) -> Void in
            
        }
        alertview.addAction(alertAction1)
        view.presentViewController(alertview, animated: true, completion: nil)
    }
    func validEmailId (emailFiledText : String) ->Bool {
        let emailregstr = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailvalid = NSPredicate(format:"SELF MATCHES %@", emailregstr)
        let result = emailvalid.evaluateWithObject(emailFiledText)
        return result
    }
    //    func alertViewQuestionTypeActions (title : String, alertMessage : String, buttonTitles1 : String ,
}
