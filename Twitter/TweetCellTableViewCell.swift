//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Bryan Lopez on 10/31/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
//    @IBOutlet weak var retweetButton: UIButton!
//    @IBOutlet weak var favoriteButton: UIButton!
//    
//    @IBAction func favoriteTweet(_ sender: Any) {
//    }
//    
//    @IBAction func retweet(_ sender: Any) {
//    }
//
    var retweeted:Bool = false
    var favorited:Bool = false
    var tweetId:Int = -1
    
    func setRetweeted(_ isRetweeted:Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true

        }
        
        
        
    }
    
    func setFavorited(_ isFavorited:Bool){
            favorited = isFavorited
        if(favorited){
            favoriteButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favoriteButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
        
    }
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func retweetAction(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (Error) in
            print("Error retweeting. Oh no! \(Error)")
        })
        
    }
    
    @IBAction func favoriteAction(_ sender: Any) {
        let tobeFavorited = !favorited
        
        if(tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(true)
            }, failure: { (Error) in
                print("Couldnt favorite your tweet. Oh no! \(Error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(false)
            }, failure: { (Error) in
                print("Coulnt unfavorite your tweet. Oh no! \(Error)")
            })
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
