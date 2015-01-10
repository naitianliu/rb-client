//
//  RankViewController.swift
//  ratebeauty
//
//  Created by Liu, Naitian on 12/26/14.
//  Copyright (c) 2014 Liu, Naitian. All rights reserved.
//

import UIKit

class RankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var rankTableView: UITableView!
    var refreshControl:UIRefreshControl!
    var scoreRankArray:NSMutableArray = NSMutableArray()
    
    var mark:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        self.refreshControl.addTarget(self, action: "refreshTable", forControlEvents: UIControlEvents.ValueChanged)
        self.rankTableView.addSubview(self.refreshControl)
        self.refreshControl.beginRefreshing()
        self.refreshTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshTable() {
        var manager:AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        manager.POST(ApiHelper(vc:self).urlDisplayRank, parameters: nil, success: { (operation:AFHTTPRequestOperation!, response:AnyObject!) -> Void in
            var data = response as NSDictionary
            self.scoreRankArray = data.objectForKey("boys")?.objectForKey("score_rank") as NSMutableArray
            println(self.scoreRankArray.objectAtIndex(0))
            self.rankTableView.reloadData()
            self.refreshControl.endRefreshing()
            }) { (operation:AFHTTPRequestOperation!, error:NSError!) -> Void in
            println(error)
            self.refreshControl.endRefreshing()
        }
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.scoreRankArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("rankCell") as UITableViewCell
        var profileImageView:UIImageView = cell.viewWithTag(31) as UIImageView
        let fbProfileId:String = self.scoreRankArray.objectAtIndex(indexPath.row).objectForKey("fb_id") as String
        let profileImageURL = "https://graph.facebook.com/\(fbProfileId)/picture?type=large"
        let block: SDWebImageCompletionBlock! = {(image: UIImage!, error: NSError!, cacheType: SDImageCacheType!, imageURL: NSURL!) -> Void in
            // println(self)
        }
        let url = NSURL(string: profileImageURL)
        profileImageView.sd_setImageWithURL(url, completed:block)
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.layer.borderWidth = 1.5
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
        profileImageView.layer.masksToBounds = true
        
        var scoreLabel:UILabel = cell.viewWithTag(52) as UILabel
        let rank:Int = self.scoreRankArray.objectAtIndex(indexPath.row).objectForKey("rank") as Int
        let score:String = self.scoreRankArray.objectAtIndex(indexPath.row).objectForKey("rater_number")?.objectForKey("score") as String
        scoreLabel.text = "\(score)"
        var nameLabel:UILabel = cell.viewWithTag(53) as UILabel
        let first_name:String = self.scoreRankArray.objectAtIndex(indexPath.row).objectForKey("first_name") as String
        nameLabel.text = first_name
        var flowerLabel:UILabel = cell.viewWithTag(54) as UILabel
        let flower:Int = self.scoreRankArray.objectAtIndex(indexPath.row).objectForKey("rater_number")?.objectForKey("flower") as Int
        flowerLabel.text = "\(flower)"
        var crownLabel:UILabel = cell.viewWithTag(55) as UILabel
        let crown:Int = self.scoreRankArray.objectAtIndex(indexPath.row).objectForKey("rater_number")?.objectForKey("special") as Int
        crownLabel.text = "\(crown)"
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
