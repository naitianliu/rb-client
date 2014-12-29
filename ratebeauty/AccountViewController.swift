//
//  AccountViewController.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/24/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, FBLoginViewDelegate, UIActionSheetDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var topBgImageView: UIImageView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var accountTableView: UITableView!
    
    var accountViewUIHelper:AccountViewUIHelper!
    
    let testID_1:String = "529789400456737"
    let testID_2:String = "391937524289261"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.accountViewUIHelper = AccountViewUIHelper(view: self.view)
        self.topBgImageView = self.accountViewUIHelper.renderTopBgImageView(self.topBgImageView, fbProfileId: self.testID_1)
        self.accountViewUIHelper.initFBPPView(self.topBgImageView, fbProfileId: self.testID_1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logoutButtonOnClick(sender: AnyObject) {
        let actionSheet:UIActionSheet = UIActionSheet(title: "Are you sure to logout", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Log Out")
        actionSheet.showInView(self.view)
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 0 {
            println("Logout")
            FBSession.activeSession().closeAndClearTokenInformation()
            
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let loginViewController:UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("loginViewController") as UIViewController
            loginViewController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
            self.presentViewController(loginViewController, animated: true, completion: { () -> Void in
                println("logout")
            })
            
            
        }
    }
    
    func getFBProfileImage(fbUserId:String) -> UIImage {
        // https://graph.facebook.com/529789400456737/picture?type=large
        let url:String = "https://graph.facebook.com/\(fbUserId)/picture?type=large"
        println(url)
        return UIImage()
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "accountTableViewCell") as UITableViewCell
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Title"
            cell.detailTextLabel?.text = "SubTitle"
            cell.imageView?.image = UIImage(named: "0.png")
        case 1:
            cell.textLabel?.text = "Title"
            cell.detailTextLabel?.text = "SubTitle"
            cell.imageView?.image = UIImage(named: "0.png")
        case 2:
            cell.textLabel?.text = "Title"
            cell.detailTextLabel?.text = "SubTitle"
            cell.imageView?.image = UIImage(named: "0.png")
        default:
            break
        }
        
        return cell
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