//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Mary Martinez on 10/31/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import AFNetworking

class TweetTableViewCell: UITableViewCell {

    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text!
            timestampLabel.text = tweet.display(date: tweet.timestamp!)
            retweetCountLabel.text = "\(tweet.retweetCount)"
            favoritesCountLabel.text = "\(tweet.favoritesCount)"
            
            userImageView.setImageWith((tweet.user?.profileURL)!)
            userNameLabel.text = tweet.user?.name
            userHandleLabel.text = "@\((tweet.user?.screenname)!)"
        }
    }
    
    @IBOutlet weak var retweetNameLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userHandleLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoritesCountLabel: UILabel!
    
    
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBAction func onReplyButton(_ sender: AnyObject) {

    }
    
    @IBAction func onRetweetButton(_ sender: AnyObject) {
        print("tweet button id: \(tweet.id)")

        self.retweetButton.setImage(UIImage(named: "retweetFilled"), for: .normal)
    }
    
    @IBAction func onLikeButton(_ sender: AnyObject) {
        print("like button")

        // post via Twitter API - POST
        TwitterClient.sharedInstance?.favoriteTweet(id: tweet.id, success: {_ in
            
            // update count label
            self.tweet.favoritesCount += 1
            self.favoritesCountLabel.text = "\(self.tweet.favoritesCount)"
            
            // update image
            self.likeButton.setImage(UIImage(named: "likeFilled"), for: .normal)
            
        }) { (error: Error) in
            print("error: \(error.localizedDescription)")
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImageView.layer.cornerRadius = 3
        userImageView.clipsToBounds = true
    }

}