//
//  CommentCell.swift
//  O! Application
//
//  Created by Baha Ganyev on 23.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    
    func setCommentsData(commentData: Comment) {
        nameLabel.text = commentData.name
        emailLabel.text = commentData.email
        bodyLabel.text = commentData.body
        commentView.layer.cornerRadius = 5.0
        commentView.clipsToBounds = true
        
        logoImage.layer.borderWidth = 0.5
        logoImage.layer.masksToBounds = false
        logoImage.layer.borderColor = UIColor.white.cgColor
        logoImage.layer.cornerRadius = logoImage.frame.height/2
        logoImage.clipsToBounds = true
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
