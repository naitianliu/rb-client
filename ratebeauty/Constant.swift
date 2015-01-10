//
//  Constant.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 1/1/15.
//  Copyright (c) 2015 Liu, Naitian. All rights reserved.
//

import Foundation
import UIKit

class Constant: NSObject {
    let rearNavBarTitle:String = "Me"
    let rightNavBarTitle:String = "Rank"
    let themeColor:UIColor = UIColor(red: 66/255.0, green: 153/255.0, blue: 221/255.0, alpha: 1.0)
    let apiIP:String = "54.201.66.112"
    let multipicationSign:Character = "\u{00D7}"
    
    func getFBProfileId() -> String {
        var objectID:String = NSKeyedUnarchiver.unarchiveObjectWithData(NSUserDefaults.standardUserDefaults().objectForKey("objectID") as NSData) as String
        return objectID
    }
}