//
//  CustomAlertViewUIHelper.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 1/4/15.
//  Copyright (c) 2015 Liu, Naitian. All rights reserved.
//

import Foundation
import UIKit

class CustomAlertViewUIHelper: NSObject {
    
    var view:UIView!
    let rootWidth:CGFloat!
    let rootHeight:CGFloat!
    let viewFrame:CGRect!
    
    init(rootView:UIView) {
        self.rootWidth = rootView.frame.width
        self.rootHeight = rootView.frame.height
        self.viewFrame = CGRect(x: 0, y: 0, width: self.rootWidth * 0.9, height: self.rootHeight * 0.5)
        self.view = UIView(frame: self.viewFrame)
    }
    
    func initShoppingView() -> UIView {
        let itemPaddingX:CGFloat = 10.0
        let itemPaddingY:CGFloat = 10.0
        let itemViewWidth:CGFloat = self.viewFrame.width - itemPaddingX * 2
        let itemViewHeight:CGFloat = self.viewFrame.height / 3 - itemPaddingY * 2
        let itemViewFrame1:CGRect = CGRect(x: itemPaddingX, y: itemPaddingY, width: itemViewWidth, height: itemViewHeight)
        let itemViewFrame2:CGRect = CGRect(x: itemPaddingX, y: itemViewFrame1.origin.y + itemViewHeight + itemPaddingY * 2, width: itemViewWidth, height: itemViewHeight)
        let itemViewFrame3:CGRect = CGRect(x: itemPaddingX, y: itemViewFrame2.origin.y + itemViewHeight + itemPaddingY * 2, width: itemViewWidth, height: itemViewHeight)
        
        var itemView1:UIView = self.initItemView(itemViewFrame1, flower: "20", crown: "10", price: "$0.99")
        var itemView2:UIView = self.initItemView(itemViewFrame2, flower: "50", crown: "30", price: "$1.99")
        var itemView3:UIView = self.initItemView(itemViewFrame3, flower: "200", crown: "100", price: "$2.99")
        
        //self.addItemViewClickedAction(itemView1)
        //self.addItemViewClickedAction(itemView1)
        //self.addItemViewClickedAction(itemView1)
        
        self.view.addSubview(itemView1)
        self.view.addSubview(itemView2)
        self.view.addSubview(itemView3)
        
        return self.view
    }
    
    private func initItemView(viewFrame:CGRect, flower:String, crown:String, price:String) -> UIView {
        var itemView:UIView = UIView(frame: viewFrame)
        itemView.backgroundColor = UIColor.whiteColor()
        itemView.layer.cornerRadius = 5.0
        itemView.layer.borderWidth = 1.0
        itemView.layer.borderColor = Constant().themeColor.CGColor
        let paddingX:CGFloat = 20.0
        let paddingY:CGFloat = 10.0
        let imageWidth:CGFloat = viewFrame.height / 2 - paddingY
        let flowerFrame:CGRect = CGRect(x: paddingX, y: paddingY, width: imageWidth, height: imageWidth)
        var flowerImageView:UIImageView = UIImageView(frame: flowerFrame)
        flowerImageView.image = UIImage(named: "rose.png")
        let crownFrame:CGRect = CGRect(x: paddingX, y: paddingY + imageWidth, width: imageWidth, height: imageWidth)
        var crownImageView:UIImageView = UIImageView(frame: crownFrame)
        crownImageView.image = UIImage(named: "crown.png")
        let labelWidth:CGFloat = viewFrame.width / 4
        let labelHeight:CGFloat = imageWidth
        let flowerLabelFrame:CGRect = CGRect(x: flowerFrame.origin.x + imageWidth, y: flowerFrame.origin.y, width: labelWidth, height: labelHeight)
        var flowerLabel:UILabel = UILabel(frame: flowerLabelFrame)
        flowerLabel.font = UIFont(name: "Arial", size: 18)
        flowerLabel.text = "\(Constant().multipicationSign) \(flower)"
        let crownLabelFrame:CGRect = CGRect(x: crownFrame.origin.x + imageWidth, y: crownFrame.origin.y, width: labelWidth, height: labelHeight)
        var crownLabel:UILabel = UILabel(frame: crownLabelFrame)
        crownLabel.font = UIFont(name: "Arial", size: 18)
        crownLabel.text = "\(Constant().multipicationSign) \(crown)"
        let priceLabelWidth:CGFloat = 80.0
        let cartWidth:CGFloat = 40.0
        let cartFrame:CGRect = CGRect(x: viewFrame.width - priceLabelWidth - cartWidth, y: (viewFrame.height - cartWidth) / 2, width: cartWidth, height: cartWidth)
        var cartImageView:UIImageView = UIImageView(frame: cartFrame)
        cartImageView.image = UIImage(named: "cart-icon.png")
        let priceLabelFrame:CGRect = CGRect(x: cartFrame.origin.x + cartWidth, y: 0, width: priceLabelWidth, height: viewFrame.height)
        var priceLabel:UILabel = UILabel(frame: priceLabelFrame)
        priceLabel.font = UIFont(name: "Arial", size: 22)
        priceLabel.textColor = UIColor.lightGrayColor()
        // priceLabel.textAlignment = NSTextAlignment.Right
        priceLabel.text = "\(price)"
        
        itemView.addSubview(flowerImageView)
        itemView.addSubview(crownImageView)
        itemView.addSubview(flowerLabel)
        itemView.addSubview(crownLabel)
        itemView.addSubview(priceLabel)
        itemView.addSubview(cartImageView)
        
        return itemView
    }
    }