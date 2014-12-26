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
    let buttonHeight:CGFloat = 20
    let buttonWidth:CGFloat = 20
    let viewHeight:CGFloat!
    let viewWidth:CGFloat!
    var btn_0: UIButton!
    var btn_1: UIButton!
    var view:UIView!
    
    var rbgDelegate:RatingButtonGroupDelegate?
    
    init(view:UIView, delegate:RatingButtonGroupDelegate?){
        super.init()
        
        self.view = view
        
        self.rbgDelegate = delegate
        
        self.viewHeight = self.view.frame.height
        self.viewWidth = self.view.frame.width
        
        self.btn_0 = UIButton(frame: CGRect(x: 20, y: self.viewHeight, width: self.buttonWidth, height: self.buttonHeight))
        self.btn_1 = UIButton(frame: CGRect(x: 50, y: self.viewHeight, width: self.buttonWidth, height: self.buttonHeight))
        
        self.btn_0.setImage(UIImage(named: "0.png"), forState: UIControlState.Normal)
        self.btn_1.setImage(UIImage(named: "1.png"), forState: UIControlState.Normal)
        self.btn_0.setImage(UIImage(named: "0-down.png"), forState: UIControlState.Selected)
        self.btn_1.setImage(UIImage(named: "1-down.png"), forState: UIControlState.Selected)
        
        self.btn_0.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.btn_1.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func showInView(){
        self.view.addSubview(self.btn_0)
        self.view.addSubview(self.btn_1)
        self.buttonAppearAnimation(self.btn_0, delay: 1.0)
        self.buttonAppearAnimation(self.btn_1, delay: 2.0)
    }
    
    func hideInView(view:UIView){
        
    }
    
    func buttonClicked(sender:UIButton!){
        var index:Int = -1
        switch sender {
        case self.btn_0:
            index = 0
            break
        case self.btn_1:
            index = 1
        default:
            println("None")
        }
        
        if self.rbgDelegate != nil {
            self.rbgDelegate!.ratingButtonOnClick(index)
        } else {
            println("delegate is nil")
        }
    }
    
    func buttonAppearAnimation(button:UIButton, delay:NSTimeInterval){
        UIView.animateWithDuration(2.0, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            println("start animation")
            var buttonFrame = button.frame
            buttonFrame.origin.y -= buttonFrame.size.height * 5
            button.frame = buttonFrame
        }) { (finished) -> Void in
            println("down")
        }
    }
}