//
//  ViewController.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/4/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RatingButtonGroupDelegate, ScoreImageStampDelegate, CardGroupViewHelperDelegate {

    var scoreImageStamp:ScoreImageStamp!
    var cardGroupViewHelper:CardGroupViewHelper!
    
    var ratingButtonGroup: RatingButtonGroup!
    var ratingButtonGroupShowHideMark:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var revealController:SWRevealViewController = appDelegate.swRevealViewController!
        appDelegate.window?.rootViewController = revealController
        revealController.panGestureRecognizer()
        revealController.tapGestureRecognizer()
        
        var revealButtonItem:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "reveal-icon.png"), style: UIBarButtonItemStyle.Bordered, target: revealController, action: Selector("revealToggle:"))
        var rightRevealButtonItem:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "reveal-icon.png"), style: UIBarButtonItemStyle.Bordered, target: revealController, action: Selector("rightRevealToggle:"))

        
        self.navigationItem.leftBarButtonItem = revealButtonItem
        self.navigationItem.rightBarButtonItem = rightRevealButtonItem
        
        self.cardGroupViewHelper = CardGroupViewHelper(view:self.view, delegate: self)
        
        self.ratingButtonGroup = RatingButtonGroup(view: self.view, delegate: self)
        var tapGR:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "showAndHideRatingButtonGroup")
        self.view.addGestureRecognizer(tapGR)
        
        self.scoreImageStamp.addSubViewToTop()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAndHideRatingButtonGroup(){
        if self.ratingButtonGroupShowHideMark == 0 {
            self.ratingButtonGroup.showInView()
            self.ratingButtonGroupShowHideMark = 1
        } else {
            self.ratingButtonGroup.hideInView()
            self.ratingButtonGroupShowHideMark = 0
        }
    }
    
    func loadLoginView() {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController:UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("loginViewController") as UIViewController
        loginViewController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        self.presentViewController(loginViewController, animated: true, completion: { () -> Void in
            println("complete")
        })
    }
    
    func returnCurrentView(currentCardView: UIView, currentFBPPView: FBProfilePictureView) {
        self.scoreImageStamp = ScoreImageStamp(view: self.view, cardView: currentCardView, fbPPView: currentFBPPView, delegate: self)
    }
    
    func ratingButtonOnClick(buttonIndex: Int) {
        //self.scoreImageStamp.showInView(buttonIndex)
        self.scoreImageStamp.showInView(buttonIndex)
    }
    
    func readyToSwitchCardView() {
        println("finished")
        self.scoreImageStamp.hideInView()
        self.cardGroupViewHelper.switchCardView("", nextFBProfileID: "")
    }

}

