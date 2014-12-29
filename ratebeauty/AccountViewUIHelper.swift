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
    
    var view:UIView!
    
    init(view:UIView) {
        super.init()
        
        self.view = view
    }
    
    func renderTopBgImageView(topBgImageView:UIImageView, fbProfileId:String) -> UIImageView {
        let profileImageURL = "https://graph.facebook.com/\(fbProfileId)/picture?type=large"
        let block: SDWebImageCompletionBlock! = {(image: UIImage!, error: NSError!, cacheType: SDImageCacheType!, imageURL: NSURL!) -> Void in
            // println(self)
        }
        let url = NSURL(string: profileImageURL)
        topBgImageView.sd_setImageWithURL(url, completed:block)
        
        var blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light)) as UIVisualEffectView
        blurEffectView.frame = topBgImageView.bounds
        blurEffectView.alpha = 1
        topBgImageView.addSubview(blurEffectView)
        
        var vibrancyEffectView = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: UIBlurEffectStyle.Light)))
        vibrancyEffectView.frame = topBgImageView.bounds
        vibrancyEffectView.alpha = 1
        var testLabel:UILabel = UILabel(frame: CGRect(x: 100, y: 5, width: 200, height: 50))
        testLabel.text = "Naitian"
        vibrancyEffectView.contentView.addSubview(testLabel)
        topBgImageView.addSubview(vibrancyEffectView)
        return topBgImageView
    }
    
    func initFBPPView(topBgImageView:UIImageView, fbProfileId:String) {
        let tb_width:CGFloat = topBgImageView.frame.width
        let tb_height:CGFloat = topBgImageView.frame.height
        let tb_x:CGFloat = topBgImageView.frame.origin.x
        let tb_y:CGFloat = topBgImageView.frame.origin.y
        let fbpp_width = tb_height / 1.7
        let fbpp_height = fbpp_width
        let fbpp_x = tb_x + 20
        let fbpp_y = tb_y + (tb_height - fbpp_height) / 2
        var fbPPView:FBProfilePictureView = FBProfilePictureView(frame: CGRect(x: fbpp_x, y: fbpp_y, width: fbpp_width, height: fbpp_height))
        fbPPView.layer.cornerRadius = fbpp_width / 2
        fbPPView.layer.borderColor = UIColor.whiteColor().CGColor
        fbPPView.layer.borderWidth = 2.5
        fbPPView.profileID = fbProfileId
        self.view.addSubview(fbPPView)
    }
}