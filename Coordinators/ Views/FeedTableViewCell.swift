//
//  FeedTableViewCell.swift
//  Safe Space
//
//  Created by Mojisola Adebiyi on 22/04/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    private var isLiked = false
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.layer.cornerRadius = 25
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func didPressLike(_ sender: Any) {
        isLiked = !isLiked
        likeButton.setImage(isLiked ? UIImage(named: "Heart") : UIImage(named: "Half-heart"), for: .normal)
    }
}
