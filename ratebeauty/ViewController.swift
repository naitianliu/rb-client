//
//  ViewController.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/4/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RatingButtonGroupDelegate {

    @IBOutlet weak var ratingSlider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var beautyFBProfilePictureView: FBProfilePictureView!
    
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
        
        //391937524289261
        //529789400456737
        self.beautyFBProfilePictureView.profileID = "529789400456737"
        
        self.ratingButtonGroup = RatingButtonGroup(view: self.view, delegate: self)
        var tapGR:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "showAndHideRatingButtonGroup")
        self.view.addGestureRecognizer(tapGR)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ratingSliderValueChanged(sender: AnyObject) {
        var currentValue = self.ratingSlider.value
        var score:Int = (Int)(currentValue * 10)
        self.scoreLabel.text = String(score)
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
    
    func ratingButtonOnClick(buttonIndex: Int) {
        println("button index is \(buttonIndex)")
    }

}

