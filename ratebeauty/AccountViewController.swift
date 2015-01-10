//
//  AccountViewController.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/24/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import UIKit
import StoreKit

class AccountViewController: UIViewController, FBLoginViewDelegate, CustomIOS7AlertViewDelegate, UITableViewDelegate, UITableViewDataSource, SKProductsRequestDelegate, SKPaymentTransactionObserver {

    @IBOutlet weak var topBgImageView: UIImageView!
    @IBOutlet weak var accountTableView: UITableView!
    
    var accountViewUIHelper:AccountViewUIHelper!
    
    var myFBID:String!
    
    var customAlertView:CustomIOS7AlertView!
    
    var appSettingsTableViewController:UITableViewController!
    
    var request:SKProductsRequest!
    var skDict:NSMutableDictionary = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        self.appSettingsTableViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("appSettingsTable") as UITableViewController
        
        self.myFBID = Constant().getFBProfileId()
        
        self.accountViewUIHelper = AccountViewUIHelper(view: self.view)
        self.topBgImageView = self.accountViewUIHelper.renderTopBgImageView(self.topBgImageView, fbProfileId: self.myFBID)
        self.accountViewUIHelper.initFBPPView(self.topBgImageView, fbProfileId: self.myFBID)
        
        self.customAlertView = CustomIOS7AlertView()
        self.customAlertView.delegate = self
        self.customAlertView.useMotionEffects = true
        self.customAlertView.buttonTitles = ["$0.99", "$1.99", "$2.99", "Close"]
        self.customAlertView.containerView = CustomAlertViewUIHelper(rootView:self.view).initShoppingView()
        
        self.request = SKProductsRequest(productIdentifiers: NSSet(array: ["ratebeauty", "ratebeauty2", "ratebeauty3"]))
        self.request.delegate = self
        self.request.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func productsRequest(request: SKProductsRequest!, didReceiveResponse response: SKProductsResponse!) {
        var skProducts:NSArray = response.products
        for item in skProducts {
            var skProduct:SKProduct = item as SKProduct
            self.skDict.setObject(skProduct, forKey: skProduct.productIdentifier)
        }
        println(self.skDict)
     }
    
    
    func paymentQueue(queue: SKPaymentQueue!, updatedTransactions transactions: [AnyObject]!) {
        for item in transactions {
            var transaction:SKPaymentTransaction = item as SKPaymentTransaction
            switch transaction.transactionState {
            case SKPaymentTransactionState.Purchased:
                self.completeTransaction(transaction)
            case SKPaymentTransactionState.Restored:
                self.restoreTransaction(transaction)
            case SKPaymentTransactionState.Failed:
                self.failedTransaction(transaction)
            default:
                break
            }
        }
    }
    
    func completeTransaction(transaction:SKPaymentTransaction) {
        println("complete transaction")
        SKPaymentQueue.defaultQueue().finishTransaction(transaction)
    }
    
    func restoreTransaction(transaction:SKPaymentTransaction) {
        println("resotre transaction")
        SKPaymentQueue.defaultQueue().finishTransaction(transaction)
    }
    
    func failedTransaction(transaction:SKPaymentTransaction) {
        println("Failed transaction")
        if transaction.error.code != SKErrorPaymentCancelled {
            println(transaction.error.localizedDescription)
        }
        SKPaymentQueue.defaultQueue().finishTransaction(transaction)
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        ApiHelper(vc:self).logout(myFBID)
    }
    
    func customIOS7dialogButtonTouchUpInside(alertView: AnyObject!, clickedButtonAtIndex: Int) {
        println(clickedButtonAtIndex)
        if clickedButtonAtIndex == 3 {
            self.customAlertView.close()
        } else if clickedButtonAtIndex == 0 {
            var payment:SKPayment = SKPayment(product: self.skDict.objectForKey("ratebeauty") as SKProduct)
            SKPaymentQueue.defaultQueue().addPayment(payment)
            SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        } else if clickedButtonAtIndex == 1 {
            var payment:SKPayment = SKPayment(product: self.skDict.objectForKey("ratebeauty2") as SKProduct)
            SKPaymentQueue.defaultQueue().addPayment(payment)
            SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        } else if clickedButtonAtIndex == 2 {
            var payment:SKPayment = SKPayment(product: self.skDict.objectForKey("ratebeauty3") as SKProduct)
            SKPaymentQueue.defaultQueue().addPayment(payment)
            SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 2 {
            self.customAlertView.show()
        } else if indexPath.section == 1 {
            var navController:UINavigationController = UINavigationController(rootViewController: self.appSettingsTableViewController)
            navController.navigationBar.topItem?.title = "App Settings"
            navController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
            self.presentViewController(navController, animated: true, completion: { () -> Void in
                println("test")
            })
        }
        self.accountTableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 66
        } else {
            return 54.0
        }
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return " "
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "accountTableViewCell") as UITableViewCell
        
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                cell = self.accountViewUIHelper.initScoreCell(cell, score: "9.4")
                self.accountViewUIHelper.animateCursor("14", crownNumStr: "5", flowerPercentage: "0.8", crownPercentage: "0.4")
            } else {
                cell = self.accountViewUIHelper.initFlowerCell(cell, flower: "3", crown: "0")
                cell.userInteractionEnabled = false
            }
        case 1:
            cell.textLabel?.textColor = Constant().themeColor
            cell.textLabel?.text = "App Settings"
            cell.detailTextLabel?.textColor = UIColor.lightGrayColor()
            cell.detailTextLabel?.text = "Account, preference and more"
            cell.imageView?.image = UIImage(named: "settings-icon.png")
        case 2:
            cell.textLabel?.textColor = Constant().themeColor
            cell.textLabel?.text = "Shopping"
            cell.detailTextLabel?.textColor = UIColor.lightGrayColor()
            cell.detailTextLabel?.text = "Get more flowers and crowns"
            cell.imageView?.image = UIImage(named: "cart-icon.png")
        default:
            break
        }
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}