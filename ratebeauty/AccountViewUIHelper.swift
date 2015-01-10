//
//  AccountViewUIHelper.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/28/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import Foundation
import UIKit

class AccountViewUIHelper: NSObject {
    
    var vc:UIViewController!
    var view:UIView!
    var cursorScore:UIImageView!
    var cursorPercentage:UIImageView!
    var scoreLabel:UILabel!
    var percentageLabel:UILabel!
    var progressBgImageView:UIImageView!
    var flowerImageView:UIImageView!
    var flowerLabel:UILabel!
    var crownImageView:UIImageView!
    var crownLabel:UILabel!
    var smFlowerImageView:UIImageView!
    var smCrownImageView:UIImageView!
    
    let topBgImageViewFrame:CGRect!
    
    init(view:UIView) {
        super.init()
        
        self.view = view
        
        // self.topBgImageViewFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
    }
    
    func renderTopBgImageView(topBgImageView:UIImageView, fbProfileId:String) -> UIImageView {
        let profileImageURL = "https://graph.facebook.com/\(fbProfileId)/picture?type=large"
        let block: SDWebImageCompletionBlock! = {(image: UIImage!, error: NSError!, cacheType: SDImageCacheType!, imageURL: NSURL!) -> Void in
            // println(self)
        }
        let url = NSURL(string: profileImageURL)
        // topBgImageView.frame = self.topBgImageViewFrame
        
        topBgImageView.sd_setImageWithURL(url, completed:block)
        
        var blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light)) as UIVisualEffectView
        blurEffectView.frame = topBgImageView.frame
        blurEffectView.alpha = 1.0
        topBgImageView.addSubview(blurEffectView)
        /*
        var vibrancyEffectView = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: UIBlurEffectStyle.Light)))
        vibrancyEffectView.frame = topBgImageView.frame
        vibrancyEffectView.alpha = 1
        var testLabel:UILabel = UILabel()
        testLabel.text = "Naitian"
        testLabel.frame = CGRect(x: (self.view.frame.width - 60 - testLabel.frame.width) / 2, y: 100, width: testLabel.frame.width, height: testLabel.frame.height)
        vibrancyEffectView.contentView.addSubview(testLabel)
        topBgImageView.addSubview(vibrancyEffectView)
        */
        return topBgImageView
    }
    
    func initFBPPView(topBgImageView:UIImageView, fbProfileId:String) {
        let tb_width:CGFloat = topBgImageView.frame.width
        let tb_height:CGFloat = topBgImageView.frame.height
        let tb_x:CGFloat = topBgImageView.frame.origin.x
        let tb_y:CGFloat = topBgImageView.frame.origin.y
        let fbpp_width = tb_height / 2.5
        let fbpp_height = fbpp_width
        let fbpp_x = (self.view.frame.width - 60 - fbpp_width) / 2
        let fbpp_y = tb_y + (tb_height - fbpp_height + 64) / 2
        var fbPPView:FBProfilePictureView = FBProfilePictureView(frame: CGRect(x: fbpp_x, y: fbpp_y, width: fbpp_width, height: fbpp_height))
        fbPPView.layer.cornerRadius = fbpp_width / 2
        fbPPView.layer.borderColor = UIColor.whiteColor().CGColor
        fbPPView.layer.borderWidth = 2.5
        fbPPView.profileID = fbProfileId
        var nameLabel:UILabel = UILabel(frame: CGRect(x: 20, y: fbpp_y + fbpp_height + 10, width: self.view.frame.width - 100, height: 30))
        nameLabel.textAlignment = NSTextAlignment.Center
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.font = UIFont(name: "Arial-BoldMT", size: 20)
        nameLabel.text = "Naitian"
        self.view.addSubview(fbPPView)
        self.view.addSubview(nameLabel)
    }
    
    func initFlowerCell(cell:UITableViewCell, flower:String, crown:String) -> UITableViewCell {
        let cellWidth:CGFloat = self.view.frame.width - 60
        let cellHeight:CGFloat = 54.0
        let paddingX:CGFloat = 40.0
        let paddingY:CGFloat = 15.0
        let imageViewWidth:CGFloat = cellHeight - paddingY * 2
        let labelWidth:CGFloat = cellWidth / 2 - paddingX * 2 - imageViewWidth
        let labelHeight:CGFloat = imageViewWidth
        let flowerImageViewFrame:CGRect = CGRect(x: paddingX, y: paddingY, width: imageViewWidth, height: imageViewWidth)
        self.flowerImageView = UIImageView(frame: flowerImageViewFrame)
        self.flowerImageView.image = UIImage(named: "rose.png")
        let flowerLabelFrame:CGRect = CGRect(x: self.flowerImageView.frame.origin.x + self.flowerImageView.frame.width, y: paddingY, width: labelWidth, height: labelHeight)
        self.flowerLabel = UILabel(frame: flowerLabelFrame)
        self.flowerLabel.text = "\(Constant().multipicationSign) \(flower)"
        self.flowerLabel.font = UIFont(name: "Arial", size: 17)
        let crownImageViewFrame:CGRect = CGRect(x: cellWidth / 2 + paddingX, y: paddingY, width: imageViewWidth, height: imageViewWidth)
        self.crownImageView = UIImageView(frame: crownImageViewFrame)
        self.crownImageView.image = UIImage(named: "crown.png")
        let crownLabelFrame:CGRect = CGRect(x: self.crownImageView.frame.origin.x + self.crownImageView.frame.width, y: paddingY, width: labelWidth, height: labelHeight)
        self.crownLabel = UILabel(frame: crownLabelFrame)
        self.crownLabel.text = "\(Constant().multipicationSign) \(crown)"
        self.crownLabel.font = UIFont(name: "Arial", size: 17)
        
        cell.addSubview(self.flowerImageView)
        cell.addSubview(self.flowerLabel)
        cell.addSubview(self.crownLabel)
        cell.addSubview(self.crownImageView)
        
        return cell
    }
    
    func initScoreCell(cell:UITableViewCell, score:String) -> UITableViewCell {
        let cellWidth:CGFloat = self.view.frame.width
        let cellHeight:CGFloat = 66
        let padding:CGFloat = 10.0
        
        let bigScoreFrame:CGRect = CGRect(x: 5, y: 0, width: cellHeight, height: cellHeight)
        var bigScoreLabel:UILabel = UILabel(frame: bigScoreFrame)
        bigScoreLabel.textAlignment = NSTextAlignment.Center
        bigScoreLabel.font = UIFont(name: "Arial", size: 40)
        bigScoreLabel.text = "\(score)"
        bigScoreLabel.textColor = Constant().themeColor
        
        let progressBgFrameWidth:CGFloat = cellWidth - 60 - padding * 2 - bigScoreFrame.width - 5
        let progressBgFrameHeight:CGFloat = 8.0
        let progressBgImageViewFrame:CGRect = CGRect(x: bigScoreFrame.origin.x + bigScoreFrame.width + padding, y: (cellHeight - progressBgFrameHeight) / 2, width: progressBgFrameWidth, height: progressBgFrameHeight)
        self.progressBgImageView = UIImageView(frame: progressBgImageViewFrame)
        self.progressBgImageView.image = UIImage(named: "progress-bg.png")
        
        let cursorWidth:CGFloat = 1.0
        let cursorHeight:CGFloat = 14.0
        let startCursorFrame:CGRect = CGRect(x: progressBgImageViewFrame.origin.x, y: (cellHeight - cursorHeight) / 2, width: cursorWidth, height: cursorHeight)
        self.cursorScore = UIImageView(frame: startCursorFrame)
        self.cursorScore.image = UIImage(named: "cursor.png")
        self.cursorPercentage = UIImageView(frame: startCursorFrame)
        self.cursorPercentage.image = UIImage(named: "cursor.png")
        let startScoreLabelFrame:CGRect = CGRect(x: startCursorFrame.origin.x, y: startCursorFrame.origin.y - 15, width: 40, height: 16)
        self.scoreLabel = UILabel(frame: startScoreLabelFrame)
        self.scoreLabel.textAlignment = NSTextAlignment.Left
        self.scoreLabel.font = UIFont(name: "Arial", size: 14)
        self.scoreLabel.textColor = Constant().themeColor
        self.scoreLabel.text = "0"
        self.smFlowerImageView = UIImageView(frame: CGRect(x: startScoreLabelFrame.origin.x - 16, y: startScoreLabelFrame.origin.y, width: 16, height: 16))
        self.smFlowerImageView.image = UIImage(named: "rose.png")
        let startPercentageLabelFrame:CGRect = CGRect(x: startScoreLabelFrame.origin.x, y: startCursorFrame.origin.y + startCursorFrame.height, width: startScoreLabelFrame.width, height: startScoreLabelFrame.height)
        self.percentageLabel = UILabel(frame: startPercentageLabelFrame)
        self.percentageLabel.textAlignment = NSTextAlignment.Left
        self.percentageLabel.font = UIFont(name: "Arial", size: 14)
        self.percentageLabel.textColor = Constant().themeColor
        self.percentageLabel.text = "0"
        self.smCrownImageView = UIImageView(frame: CGRect(x: startPercentageLabelFrame.origin.x - 16, y: startPercentageLabelFrame.origin.y, width: 16, height: 16))
        self.smCrownImageView.image = UIImage(named: "crown.png")
        
        cell.addSubview(bigScoreLabel)
        cell.addSubview(self.progressBgImageView)
        cell.addSubview(self.cursorScore)
        cell.addSubview(self.cursorPercentage)
        cell.addSubview(self.scoreLabel)
        cell.addSubview(self.percentageLabel)
        cell.addSubview(self.smCrownImageView)
        cell.addSubview(self.smFlowerImageView)

        return cell
    }
    
    func animateCursor(flowerNumStr:NSString, crownNumStr:NSString, flowerPercentage:NSString, crownPercentage:NSString) {
        let velocity:NSTimeInterval = 2.0
        let delay:NSTimeInterval = 0.5
        let ratio:Double = flowerPercentage.doubleValue
        let ratioFloat:Float = flowerPercentage.floatValue / 10.0
        
        
        UIView.animateWithDuration(velocity * flowerPercentage.doubleValue, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.scoreLabel.frame.origin.x += self.progressBgImageView.frame.width * CGFloat(flowerPercentage.floatValue)
            self.cursorScore.frame.origin.x += self.progressBgImageView.frame.width * CGFloat(flowerPercentage.floatValue)
            self.smFlowerImageView.frame.origin.x += self.progressBgImageView.frame.width * CGFloat(flowerPercentage.floatValue)
            self.scoreLabel.text = flowerNumStr
        }) { (finished) -> Void in
            println(2)
        }
        
        UIView.animateWithDuration(velocity * crownPercentage.doubleValue, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.percentageLabel.frame.origin.x += self.progressBgImageView.frame.width * CGFloat(crownPercentage.floatValue)
            self.cursorPercentage.frame.origin.x += self.progressBgImageView.frame.width * CGFloat(crownPercentage.floatValue)
            self.smCrownImageView.frame.origin.x += self.progressBgImageView.frame.width * CGFloat(crownPercentage.floatValue)
            self.percentageLabel.text = crownNumStr
            }) { (finished) -> Void in
                println(2)
        }
        
    }
    
    
    /*
    func initScoreCell(cell:UITableViewCell, score:String, flower:String, crown:String) -> UITableViewCell {
        let cellWidth = cell.frame.width
        let cellHeight:CGFloat = 100.0
        println(cellHeight)
        let paddiself.ng:CGFloat = 5.0
        let scoreLabelFrame:CGRect = CGRect(x: padding, y: padding, width: cellHeight - padding * 2, height: cellHeight - padding * 2)
        var scoreLabel:UILabel = UILabel(frame: scoreLabelFrame)
        scoreLabel.textAlignment = NSTextAlignment.Center
        // scoreLabel.textColor = UIColor.redColor()
        scoreLabel.backgroundColor = UIColor.lightGrayColor()
        scoreLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 60)
        scoreLabel.text = score
        let flowerImageViewFrame:CGRect = CGRect(x: scoreLabelFrame.width + padding, y: padding, width: scoreLabelFrame.width * 0.5 - padding * 4, height: scoreLabelFrame.width * 0.5 - padding * 4)
        var flowerImageView:UIImageView = UIImageView(frame: flowerImageViewFrame)
        flowerImageView.image = UIImage(named: "rose.png")
        let flowerLabelFrame:CGRect = CGRect(x: flowerImageViewFrame.origin.x + flowerImageViewFrame.width, y: flowerImageViewFrame.origin.y, width: cell.frame.width - flowerImageViewFrame.width - scoreLabelFrame.width, height: flowerImageViewFrame.height)
        var flowerLabel:UILabel = UILabel(frame: flowerLabelFrame)
        flowerLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 25)
        flowerLabel.text = "\(Constant().multipicationSign) \(flower)"
        let crownImageViewFrame:CGRect = CGRect(x: sc, y: <#CGFloat#>, width: <#CGFloat#>, height: <#CGFloat#>)
        
        cell.addSubview(scoreLabel)
        cell.addSubview(flowerImageView)
        cell.addSubview(flowerLabel)
        return cell
    }
    */
}