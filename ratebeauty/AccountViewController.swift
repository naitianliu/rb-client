//
//  AccountViewController.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/24/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, FBLoginViewDelegate, UIActionSheetDelegate {

    @IBOutlet weak var topBgImageView: UIImageView!
    @IBOutlet weak var fbPPView: FBProfilePictureView!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.fbPPView.profileID = "529789400456737"
        
        let profileImageURL = "https://graph.facebook.com/391937524289261/picture?type=large"
        let block: SDWebImageCompletionBlock! = {(image: UIImage!, error: NSError!, cacheType: SDImageCacheType!, imageURL: NSURL!) -> Void in
            // println(self)
        }
        let url = NSURL(string: profileImageURL)
        self.topBgImageView.sd_setImageWithURL(url, completed:block)
        
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light)) as UIVisualEffectView
        visualEffectView.frame = self.topBgImageView.bounds
        visualEffectView.alpha = 0.8
        self.topBgImageView.addSubview(visualEffectView)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}