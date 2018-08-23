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
        imageView.kf.setImage(with: url)
    }
}
