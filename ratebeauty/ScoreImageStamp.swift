//
//  ScoreImageStamp.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/27/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import Foundation
import UIKit

protocol ScoreImageStampDelegate {
    func readyToSwitchCardView()
}

class ScoreImageStamp: NSObject {
    let image_x:CGFloat!
    let image_y:CGFloat!
    
    var scoreImage_10:UIImageView!
    var scoreImage_9:UIImageView!
    var scoreImage_8:UIImageView!
    
    var view:UIView!
    var fbPPView:FBProfilePictureView!
    
    var sisDelegate:ScoreImageStampDelegate?
    
    init(view:UIView, cardView:UIView, fbPPView:FBProfilePictureView, delegate:ScoreImageStampDelegate?) {
        super.init()
        
        self.view = view
        self.fbPPView = fbPPView
        
        self.sisDelegate = delegate
        
        self.image_x = cardView.frame.origin.x + self.fbPPView.frame.origin.x + 10
        self.image_y = cardView.frame.origin.y + self.fbPPView.frame.origin.y + 10
        
        self.scoreImage_10 = UIImageView(frame: CGRect(x: self.image_x, y: self.image_y, width: 100, height: 100))
        self.scoreImage_9 = UIImageView(frame: CGRect(x: self.image_x, y: self.image_y, width: 100, height: 100))
        self.scoreImage_8 = UIImageView(frame: CGRect(x: self.image_x, y: self.image_y, width: 100, height: 100))
        
        self.scoreImage_10.image = UIImage(named: "stamp-10.png")
        self.scoreImage_9.image = UIImage(named: "stamp-9.png")
        self.scoreImage_8.image = UIImage(named: "stamp-8.png")
        
        self.scoreImage_10.hidden = true
        self.scoreImage_9.hidden = true
        self.scoreImage_8.hidden = true
    }
    
    func addSubViewToTop() {
        self.view.addSubview(self.scoreImage_10)
        self.view.addSubview(self.scoreImage_9)
        self.view.addSubview(self.scoreImage_8)
    }
    
    func showInView(scoreIndex:Int) {
        switch scoreIndex {
        case 10:
            self.imageAnimation(self.scoreImage_10)
        case 9:
            self.imageAnimation(self.scoreImage_9)
        case 8:
            self.imageAnimation(self.scoreImage_8)
        default:
            println("No Image found")
        }
    }
    
    func hideInView() {
        self.scoreImage_10.hidden = true
        self.scoreImage_9.hidden = true
        self.scoreImage_8.hidden = true
    }
    
    func reviseImageFrame(cardView:UIView, fbPPView:FBProfilePictureView) {
        self.scoreImage_10.frame.origin.x = cardView.frame.origin.x + fbPPView.frame.origin.x + 10
        self.scoreImage_9.frame.origin.x = cardView.frame.origin.x + fbPPView.frame.origin.x + 10
        self.scoreImage_8.frame.origin.x = cardView.frame.origin.x + fbPPView.frame.origin.x + 10
        self.scoreImage_10.frame.origin.y = cardView.frame.origin.y + fbPPView.frame.origin.y + 10
        self.scoreImage_9.frame.origin.y = cardView.frame.origin.y + fbPPView.frame.origin.y + 10
        self.scoreImage_8.frame.origin.y = cardView.frame.origin.y + fbPPView.frame.origin.y + 10
    }
    
    func showSingleImageStamp(scoreImage:UIImageView) {
        func is_hidden(imageView:UIImageView) -> Bool{
            if imageView == scoreImage {
                return false
            } else {
                return true
            }
        }
        self.scoreImage_10.hidden = is_hidden(self.scoreImage_10)
        self.scoreImage_9.hidden = is_hidden(self.scoreImage_9)
        self.scoreImage_8.hidden = is_hidden(self.scoreImage_8)
    }
    
    func imageAnimation(scoreImage:UIImageView) {
        self.showSingleImageStamp(scoreImage)
        scoreImage.transform = CGAffineTransformMakeScale(5.0, 5.0)
        UIView.animateWithDuration(0.1, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            scoreImage.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }) { (finished) -> Void in
                if finished {
                    self.sisDelegate?.readyToSwitchCardView()
                }
        }

    }
}