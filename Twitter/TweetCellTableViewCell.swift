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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
