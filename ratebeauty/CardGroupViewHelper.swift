//
//  CardViewHelper.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/27/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

// 529789400456737

// 391937524289261

import Foundation
import UIKit

protocol CardGroupViewHelperDelegate {
    func returnCurrentView(currentCardView:UIView, currentFBPPView:FBProfilePictureView)
}

class CardGroupViewHelper: NSObject {
    
    let testID_1:String = "529789400456737"
    let testID_2:String = "391937524289261"
    
    var currentCardView:UIView!
    var nextCardView:UIView!
    var currentFBPPView:FBProfilePictureView!
    var nextFBPPView:FBProfilePictureView!
    
    var view:UIView!
    let viewWidth:CGFloat!
    let viewHeight:CGFloat!
    let cardView_x:CGFloat! = 10
    let cardView_y:CGFloat! = 80
    let cardViewWidth:CGFloat!
    let cardViewHeight:CGFloat!
    
    let currentCardViewFrame:CGRect!
    let nextCardViewFrame:CGRect!
    let currentFBPPViewFrame:CGRect!
    let nextFBPPViewFrame:CGRect!
    
    let nextFBPPViewTag:Int = 22
    
    var testMark:Int = 0
    
    var cgvhDelegate:CardGroupViewHelperDelegate?
    
    init(view:UIView, delegate:CardGroupViewHelperDelegate) {
        super.init()
        
        self.view = view
        self.cgvhDelegate = delegate
        
        self.viewWidth = view.frame.width
        self.viewHeight = view.frame.height
        cardViewWidth = self.viewWidth - 20
        cardViewHeight = self.cardViewWidth * 1.2
        
        self.currentCardViewFrame = CGRect(x: self.cardView_x, y: self.cardView_y, width: self.cardViewWidth, height: self.cardViewHeight)
        self.nextCardViewFrame = CGRect(x: self.cardView_x + 5, y: self.cardView_y + 5, width: self.cardViewWidth - 10, height: self.cardViewHeight)
        self.currentFBPPViewFrame = CGRect(x: 5, y: 5, width: self.cardViewWidth - 10, height: cardViewWidth - 10)
        self.nextFBPPViewFrame = CGRect(x: 5, y: 5, width: self.cardViewWidth - 20, height: cardViewWidth - 20)
        
        self.currentCardView = self.initCurrentCardView(testID_1)
        self.nextCardView = self.initNextCardView(testID_2)
        
        self.view.addSubview(self.nextCardView)
        self.view.addSubview(self.currentCardView)
        
    }
    
    func initCurrentCardView(fbProfileID:String) -> UIView {
        var cardView:UIView = UIView(frame: self.currentCardViewFrame)
        cardView.backgroundColor = UIColor.whiteColor()
        cardView.layer.cornerRadius = 5.0
        cardView.layer.borderColor = UIColor.blackColor().CGColor
        cardView.layer.borderWidth = 0.3
        cardView.clipsToBounds = true
        
        var fbPPView:FBProfilePictureView = FBProfilePictureView(frame: self.currentFBPPViewFrame)
        fbPPView.profileID = fbProfileID
        cardView.addSubview(fbPPView)
        
        self.cgvhDelegate?.returnCurrentView(cardView, currentFBPPView: fbPPView)
        
        return cardView
    }
    
    func initNextCardView(fbProfileID:String) -> UIView {
        var cardView:UIView = UIView(frame: self.nextCardViewFrame)
        cardView.backgroundColor = UIColor.whiteColor()
        cardView.layer.cornerRadius = 5.0
        cardView.layer.borderColor = UIColor.blackColor().CGColor
        cardView.layer.borderWidth = 0.3
        cardView.clipsToBounds = true
        
        var fbPPView:FBProfilePictureView = FBProfilePictureView(frame: self.nextFBPPViewFrame)
        fbPPView.profileID = fbProfileID
        fbPPView.tag = self.nextFBPPViewTag
        cardView.addSubview(fbPPView)
        
        return cardView
    }
    
    func switchCardView(currentFBProfileID:String, nextFBProfileID:String) {
        self.animationSideOut(self.currentCardView)
    }
    
    func animationSideOut(cardView:UIView) {
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            cardView.transform = CGAffineTransformMakeRotation(CGFloat(Float(-M_PI_4)))
            var cardViewFrame = cardView.frame
            cardViewFrame.origin.x -= cardViewFrame.size.width + 50
            cardViewFrame.origin.y += cardViewFrame.size.height + 30
            cardView.frame = cardViewFrame
        }) { (finished) -> Void in
            if finished {
                self.animationMerge(self.nextCardView)
            }
        }
    }
    
    func animationMerge(cardView:UIView) {
        var fbPPView = cardView.viewWithTag(self.nextFBPPViewTag) as FBProfilePictureView
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            cardView.frame = self.currentCardViewFrame
            fbPPView.frame = self.currentFBPPViewFrame
        }) { (finished) -> Void in
            if finished {
                self.currentCardView.removeFromSuperview()
                self.currentCardView = self.nextCardView
                if self.testMark == 0{
                    self.nextCardView = self.initNextCardView(self.testID_1)
                    self.testMark = 1
                } else {
                    self.nextCardView = self.initNextCardView(self.testID_2)
                    self.testMark = 0
                }
                
                self.view.insertSubview(self.nextCardView, belowSubview: self.currentCardView)
            }
        }
    }
}