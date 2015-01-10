//
//  LoginViewController.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/4/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, FBLoginViewDelegate {

    @IBOutlet weak var fbLoginView: FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        println("logged in")
        let objectID = user.objectID
        let name = user.name
        let gender:String = user.objectForKey("gender") as String
        println(objectID)
        NSUserDefaults.standardUserDefaults().setObject(NSKeyedArchiver.archivedDataWithRootObject(objectID), forKey: "objectID")
        NSUserDefaults.standardUserDefaults().setObject(NSKeyedArchiver.archivedDataWithRootObject(name), forKey: "name")
        NSUserDefaults.standardUserDefaults().setObject(NSKeyedArchiver.archivedDataWithRootObject(gender), forKey: "gender")

    }
    
    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        let parameters:NSDictionary = [
            "usr":[
                "fb_id": "",
                "first_name": "",
                "last_name": "",
                "is_female": true,
                "email": "",
                "coordinate": [
                    "x": 42.1234,
                    "y": 42.3232,
                ]
            ]
        ]
        ApiHelper(vc: self).login(parameters)
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
