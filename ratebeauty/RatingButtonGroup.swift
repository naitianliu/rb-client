//
//  RatingButtonGroup.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/25/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import Foundation
import UIKit

protocol RatingButtonGroupDelegate {
    func ratingButtonOnClick(buttonIndex:Int)
}

class RatingButtonGroup: NSObject {
    
    let buttonHeight:CGFloat = 50
    let buttonWidth:CGFloat = 50
    let viewHeight:CGFloat!
    let viewWidth:CGFloat!
    let gapHorizon:CGFloat!
    let gapVertical:CGFloat!
    let paddingLeft:CGFloat = 20
    let paddingRight:CGFloat = 20
    let tapDelay:NSTimeInterval = 0.0
    
    var btn_1:UIButton!
    var btn_2:UIButton!
    var btn_3:UIButton!
    var btn_4:UIButton!
    var btn_5:UIButton!
    var btn_6:UIButton!
    var btn_7:UIButton!
    var btn_8:UIButton!
    var btn_9:UIButton!
    var btn_10:UIButton!
    
    var view:UIView!
    
    var rbgDelegate:RatingButtonGroupDelegate?
    
    init(view:UIView, delegate:RatingButtonGroupDelegate?){
        super.init()
        
        self.view = view
        
        self.rbgDelegate = delegate
        
        self.viewHeight = self.view.frame.height
        self.viewWidth = self.view.frame.width
        
        self.gapHorizon = (self.viewWidth - self.paddingLeft - self.paddingRight - self.buttonWidth * 5) / 4
        
        let buttonGap = self.buttonWidth + self.gapHorizon
        
        self.btn_1 = UIButton(frame: CGRect(x: self.paddingLeft, y: self.viewHeight, width: self.buttonWidth, height: self.buttonHeight))
        self.btn_2 = UIButton(frame: CGRect(x: self.paddingLeft + buttonGap, y: self.viewHeight, width: self.buttonWidth, height: self.buttonHeight))
        self.btn_3 = UIButton(frame: CGRect(x: self.paddingLeft + buttonGap * 2, y: self.viewHeight, width: self.buttonWidth, height: self.buttonHeight))
        self.btn_4 = UIButton(frame: CGRect(x: self.paddingLeft + buttonGap * 3, y: self.viewHeight, width: self.buttonWidth, height: self.buttonHeight))
        self.btn_5 = UIButton(frame: CGRect(x: self.paddingLeft + buttonGap * 4, y: self.viewHeight, width: self.buttonWidth, height: self.buttonHeight))
        self.btn_6 = UIButton(frame: CGRect(x: self.paddingLeft, y: self.viewHeight, width: self.buttonWidth, height: self.buttonHeight))
        self.btn_7 = UIButton(frame: CGRect(x: self.paddingLeft + buttonGap, y: self.viewHeight, width: self.buttonWidth, height: self.buttonHeight))
        self.btn_8 = UIButton(frame: CGRect(x: self.paddingLeft + buttonGap * 2, y: self.viewHeight, width: self.buttonWidth, height: self.buttonHeight))
        self.btn_9 = UIButton(frame: CGRect(x: self.paddingLeft + buttonGap * 3, y: self.viewHeight, width: self.buttonWidth, height: self.buttonHeight))
        self.btn_10 = UIButton(frame: CGRect(x: self.paddingLeft + buttonGap * 4, y: self.viewHeight, width: self.buttonWidth, height: self.buttonHeight))
        
        self.btn_1.setImage(UIImage(named: "rating-button-5.png"), forState: UIControlState.Normal)
        self.btn_2.setImage(UIImage(named: "rating-button-5.png"), forState: UIControlState.Normal)
        self.btn_3.setImage(UIImage(named: "rating-button-5.png"), forState: UIControlState.Normal)
        self.btn_4.setImage(UIImage(named: "rating-button-5.png"), forState: UIControlState.Normal)
        self.btn_5.setImage(UIImage(named: "rating-button-5.png"), forState: UIControlState.Normal)
        self.btn_6.setImage(UIImage(named: "rating-button-5.png"), forState: UIControlState.Normal)
        self.btn_7.setImage(UIImage(named: "rating-button-5.png"), forState: UIControlState.Normal)
        self.btn_8.setImage(UIImage(named: "rating-button-5.png"), forState: UIControlState.Normal)
        self.btn_9.setImage(UIImage(named: "rating-button-5.png"), forState: UIControlState.Normal)
        self.btn_10.setImage(UIImage(named: "rating-button-5.png"), forState: UIControlState.Normal)
        
        self.btn_1.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.btn_2.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.btn_3.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.btn_4.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.btn_5.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.btn_6.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.btn_7.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.btn_8.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.btn_9.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.btn_10.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(self.btn_1)
        self.view.addSubview(self.btn_2)
        self.view.addSubview(self.btn_3)
        self.view.addSubview(self.btn_4)
        self.view.addSubview(self.btn_5)
        self.view.addSubview(self.btn_6)
        self.view.addSubview(self.btn_7)
        self.view.addSubview(self.btn_8)
        self.view.addSubview(self.btn_9)
        self.view.addSubview(self.btn_10)
    }
    
    func showInView(){
        self.buttonAppearAnimation1(self.btn_1, delay: self.tapDelay)
        self.buttonAppearAnimation1(self.btn_2, delay: self.tapDelay + 0.1)
        self.buttonAppearAnimation1(self.btn_3, delay: self.tapDelay + 0.2)
        self.buttonAppearAnimation1(self.btn_4, delay: self.tapDelay + 0.3)
        self.buttonAppearAnimation1(self.btn_5, delay: self.tapDelay + 0.4)
        self.buttonAppearAnimation2(self.btn_6, delay: self.tapDelay + 0.9)
        self.buttonAppearAnimation2(self.btn_7, delay: self.tapDelay + 0.8)
        self.buttonAppearAnimation2(self.btn_8, delay: self.tapDelay + 0.7)
        self.buttonAppearAnimation2(self.btn_9, delay: self.tapDelay + 0.6)
        self.buttonAppearAnimation2(self.btn_10, delay: self.tapDelay + 0.5)
    }
    
    func hideInView(){
        self.buttonAppearAnimation3(self.btn_1, delay: self.tapDelay + 0.9)
        self.buttonAppearAnimation3(self.btn_2, delay: self.tapDelay + 0.8)
        self.buttonAppearAnimation3(self.btn_3, delay: self.tapDelay + 0.7)
        self.buttonAppearAnimation3(self.btn_4, delay: self.tapDelay + 0.6)
        self.buttonAppearAnimation3(self.btn_5, delay: self.tapDelay + 0.5)
        self.buttonAppearAnimation4(self.btn_6, delay: self.tapDelay)
        self.buttonAppearAnimation4(self.btn_7, delay: self.tapDelay + 0.1)
        self.buttonAppearAnimation4(self.btn_8, delay: self.tapDelay + 0.2)
        self.buttonAppearAnimation4(self.btn_9, delay: self.tapDelay + 0.3)
        self.buttonAppearAnimation4(self.btn_10, delay: self.tapDelay + 0.4)
    }
    
    func buttonClicked(sender:UIButton!){
        var index:Int = -1
        switch sender {
        case self.btn_1:
            index = 1
            break
        case self.btn_2:
            index = 2
        default:
            println("None")
        }
        
        if self.rbgDelegate != nil {
            self.rbgDelegate!.ratingButtonOnClick(index)
        } else {
            println("delegate is nil")
        }
    }
    
    func buttonAppearAnimation1(button:UIButton, delay:NSTimeInterval){
        UIView.animateWithDuration(0.3, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            println("start animation")
            var buttonFrame = button.frame
            buttonFrame.origin.y -= buttonFrame.size.height * 3
            button.frame = buttonFrame
        }) { (finished) -> Void in
            println("down")
        }
    }
    
    func buttonAppearAnimation2(button:UIButton, delay:NSTimeInterval){
        UIView.animateWithDuration(0.3, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            println("start animation")
            var buttonFrame = button.frame
            buttonFrame.origin.y -= (buttonFrame.size.height * 2)
            button.frame = buttonFrame
            }) { (finished) -> Void in
                println("down")
        }
    }
    
    func buttonAppearAnimation3(button:UIButton, delay:NSTimeInterval){
        UIView.animateWithDuration(0.3, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            println("start animation")
            var buttonFrame = button.frame
            buttonFrame.origin.y += (buttonFrame.size.height * 3)
            button.frame = buttonFrame
            }) { (finished) -> Void in
                println("down")
        }
    }
    
    func buttonAppearAnimation4(button:UIButton, delay:NSTimeInterval){
        UIView.animateWithDuration(0.3, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            println("start animation")
            var buttonFrame = button.frame
            buttonFrame.origin.y += (buttonFrame.size.height * 2)
            button.frame = buttonFrame
            }) { (finished) -> Void in
                println("down")
        }
    }
}