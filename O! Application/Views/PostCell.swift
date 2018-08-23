//
//  PostCell.swift
//  O! Application
//
//  Created by Baha Ganyev on 23.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var postView: UIView!

    
    func setPostData(postData: Post) {
        titleLabel.text = postData.title
        bodyLabel.text = postData.body
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        postView.layer.cornerRadius = 5.0
        postView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
