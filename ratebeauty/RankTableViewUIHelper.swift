//
//  RankTableViewUIHelper.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/29/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import Foundation
import UIKit

class RankTableViewUIHelper: NSObject {
    
    let cell_width:CGFloat!
    let cell_height:CGFloat!
    let cell_x:CGFloat!
    let cell_y:CGFloat!
    
    let profileImageView_width:CGFloat!
    let profileImageView_height:CGFloat!
    let profileImageView_paddingRight:CGFloat! = 10
    let profileImageView_x:CGFloat!
    let profileImageView_y:CGFloat!
    
    let profileImageViewFrame:CGRect!
    let nameLabelFrame:CGRect!
    
    var profileImageView:UIImageView!
    
    init(cell:UITableViewCell) {
        super.init()
        self.cell_height = cell.frame.height
        self.cell_width = cell.frame.width
        self.cell_x = cell.frame.origin.x
        self.cell_y = cell.frame.origin.y
        
        self.profileImageView_height = self.cell_height * 0.8
        self.profileImageView_width = self.profileImageView_height
        self.profileImageView_x = self.cell_width - self.profileImageView_paddingRight - self.profileImageView_width
        self.profileImageView_y = (self.cell_height - self.profileImageView_height) / 2
        
        self.profileImageViewFrame = CGRect(x: self.profileImageView_x, y: self.profileImageView_y, width: self.profileImageView_width, height: self.profileImageView_height)
        
        self.profileImageView = UIImageView(frame: self.profileImageViewFrame)
        
    }
    
    func initTableViewCell(cell:UITableViewCell, fbProfileId:NSString) -> UITableViewCell {
        let profileImageURL = "https://graph.facebook.com/\(fbProfileId)/picture?type=small"
        let block: SDWebImageCompletionBlock! = {(image: UIImage!, error: NSError!, cacheType: SDImageCacheType!, imageURL: NSURL!) -> Void in
            // println(self)
        }
        let url = NSURL(string: profileImageURL)
        self.profileImageView.sd_setImageWithURL(url, completed:block)
        self.profileImageView.layer.cornerRadius = self.profileImageView_width / 2
        self.profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
        self.profileImageView.layer.borderWidth = 1.0

        cell.addSubview(self.profileImageView)
        return cell
    }
}
