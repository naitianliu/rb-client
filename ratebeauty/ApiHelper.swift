//
//  ApiHelper.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/26/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import Foundation

class ApiHelper: NSObject {
    
    let apiIP:String! = Constant().apiIP
    
    let urlUserLogin:String!
    let urlUserLogout:String!
    let urlUserProfile:String!
    let urlUserRecords:String!
    let urlDisplayBeauties:String!
    let urlDisplayRank:String!
    let urlDisplayBeautyProfile:String!
    
    var vc:UIViewController!
    
    init(vc:UIViewController) {
        
        self.vc = vc
        
        self.urlUserLogin = "http://\(self.apiIP)/user/login/"
        self.urlUserLogout = "http://\(self.apiIP)/user/logout/"
        self.urlUserProfile = "http://\(self.apiIP)/user/profile/"
        self.urlUserRecords = "http://\(self.apiIP)/user/records/"
        self.urlDisplayBeauties = "http://\(self.apiIP)/display/beauties/"
        self.urlDisplayRank = "http://\(self.apiIP)/display/rank/"
        self.urlDisplayBeautyProfile = "http://\(self.apiIP)/display/beauty/profile/"
    }
    
    func login(parameters:NSDictionary) {
        var hub:MBProgressHUD = MBProgressHUD.showHUDAddedTo(self.vc.view, animated: true)
        hub.labelText = "Logging in..."
        var manager:AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        manager.POST(self.urlUserLogin, parameters: parameters, success: { (operation:AFHTTPRequestOperation!, responseObject:AnyObject!) -> Void in
            self.vc.dismissViewControllerAnimated(true, completion: { () -> Void in
                println("dismiss login")
            })
            hub.hide(true)
            }) { (operation:AFHTTPRequestOperation!, error:NSError!) -> Void in
            print("login failed")
            hub.hide(true)
        }
    }
    
    func logout(fbId:String) {
        var hub:MBProgressHUD = MBProgressHUD.showHUDAddedTo(self.vc.view, animated: true)
        hub.labelText = "Logging out..."
        let requestParameters:NSDictionary = ["fb_id":fbId]
        var manager:AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        manager.POST(self.urlUserLogout, parameters: requestParameters, success: { (operation:AFHTTPRequestOperation!, responseObject:AnyObject!) -> Void in
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let loginViewController:UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("loginViewController") as UIViewController
            loginViewController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
            self.vc.presentViewController(loginViewController, animated: true, completion: { () -> Void in
                println("logout")
            })
            hub.hide(true)
            }) { (operation:AFHTTPRequestOperation!, error:NSError!) -> Void in
            print("logout failed")
            hub.hide(true)
        }
    }
    
    func rankList() {
        
    }
    
}


