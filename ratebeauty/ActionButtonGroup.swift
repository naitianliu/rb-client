//
//  ActionButtonGroup.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/28/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import Foundation
import UIKit

protocol ActionButtonGroupDelegate {
    func goToNextBeautyView()
}

class ActionButtonGroup: NSObject {
    
    var view:UIView!
    
    var specialButton:UIButton!
    var flowerButton:UIButton!
    var nextButton:UIButton!
    
    var delegate:ActionButtonGroupDelegate?
    
    init(view:UIView, delegate:ActionButtonGroupDelegate) {
        super.init()
        
        self.view = view
        self.delegate = delegate
        
        self.specialButton = UIButton()
        self.flowerButton = UIButton()
        self.nextButton = UIButton()
        self.specialButton.setImage(UIImage(named: "special"), forState: UIControlState.Normal)
        self.flowerButton.setImage(UIImage(named: "flower"), forState: UIControlState.Normal)
        self.nextButton.setImage(UIImage(named: "next"), forState: UIControlState.Normal)
        
        self.nextButton.addTarget(self, action: Selector("nextButtonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(self.specialButton)
        self.view.addSubview(self.flowerButton)
        self.view.addSubview(self.nextButton)
    }
    
    func nextButtonClicked(sender:AnyObject) {
        self.delegate?.goToNextBeautyView()
    }
    
    func showInView(button10:UIButton, gapHorizon:CGFloat) {
        self.specialButton.hidden = false
        self.flowerButton.hidden = false
        self.nextButton.hidden = false
        let buttonStartFrame:CGRect = button10.frame
        self.specialButton.frame = buttonStartFrame
        self.flowerButton.frame = buttonStartFrame
        self.nextButton.frame = buttonStartFrame
        UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.specialButton.frame.origin.x = buttonStartFrame.origin.x + buttonStartFrame.width + gapHorizon
            self.specialButton.frame.origin.y = buttonStartFrame.origin.y
            self.flowerButton.frame.origin.x = buttonStartFrame.origin.x - buttonStartFrame.width - gapHorizon
            self.flowerButton.frame.origin.y = buttonStartFrame.origin.y
            self.nextButton.frame.origin.x = buttonStartFrame.origin.x
            self.nextButton.frame.origin.y = buttonStartFrame.origin.y + buttonStartFrame.height
        }) { (finished) -> Void in
            if finished {
                
            }
        }
    }
    
    func hideInView(button10:UIButton, gapHorizon:CGFloat) {
        UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            let buttonStartFrame:CGRect = button10.frame
            self.specialButton.frame = buttonStartFrame
            self.flowerButton.frame = buttonStartFrame
            self.nextButton.frame = buttonStartFrame
            }) { (finished) -> Void in
                if finished {
                    self.specialButton.hidden = true
                    self.flowerButton.hidden = true
                    self.nextButton.hidden = true
                }
        }
    }

    
    
}