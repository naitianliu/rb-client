//
//  AppDelegate.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/4/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SWRevealViewControllerDelegate {

    var window: UIWindow?
    var swRevealViewController:SWRevealViewController?
    let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let loginViewController:UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("loginViewController") as UIViewController
        var frontViewController:UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("mainViewController") as UIViewController

        let rearViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("accountViewController") as UIViewController
        let rightViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("rankViewController") as UIViewController

        
        var frontNavigationController:UINavigationController = UINavigationController(rootViewController: frontViewController)
        var rearNavigationController:UINavigationController = UINavigationController(rootViewController: rearViewController)
        
        var revealController:SWRevealViewController = SWRevealViewController(rearViewController: rearNavigationController, frontViewController: frontNavigationController)
        revealController.delegate = self
        revealController.rightViewController = rightViewController
        
        self.swRevealViewController = revealController
        
        
        if FBSession.activeSession().state == FBSessionState.CreatedTokenLoaded {
            println("yes, logged in")
            self.window?.rootViewController = self.swRevealViewController
        } else {
            println("closed")
            self.window?.rootViewController = loginViewController
        }

        //self.window?.rootViewController = self.swRevealViewController
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func loadRevealController() {
        
    }
    
    func revealController(revealController: SWRevealViewController!, animationControllerForOperation operation: SWRevealControllerOperation, fromViewController fromVC: UIViewController!, toViewController toVC: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        if operation.value != SWRevealControllerOperationReplaceRightController.value {
            return nil
        }
        
        return nil
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.

    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        return FBAppCall.handleOpenURL(url, sourceApplication: sourceApplication)
    }
    
    


}

