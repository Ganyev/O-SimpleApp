//
//  PhotoCell.swift
//  O! Application
//
//  Created by Baha Ganyev on 23.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!

    
    func setPhotoData(photoData: Photo) {
        imageView.layer.cornerRadius = 10.0
        imageView.clipsToBounds = true
        
        guard let imagePath = photoData.thumbnailUrl else {
            return
        }
        guard let url = URL(string: imagePath) else {
            return
        }
        imageView.image = #imageLiteral(resourceName: "gray_placeholder")
        imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "gray_placeholder"), options: nil, progressBlock: nil) { (kfImage, nil, cache, url) in
            UIView.transition(with: self.imageView,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.imageView.image = kfImage },
                              completion: nil)
        }
    }
}
