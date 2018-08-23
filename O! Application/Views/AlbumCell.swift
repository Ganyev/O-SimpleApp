//
//  AlbumCell.swift
//  O! Application
//
//  Created by Baha Ganyev on 23.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import Kingfisher
class AlbumCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    var bgImage : UIImage?
    func setAlbumData(album: Album) {
       
        label.text = album.title
        
        guard let photos = album.photos else {
            return
        }
        guard !photos.isEmpty else {
            return
        }
        // установка фото на фон
        guard let url = URL(string: photos.first!.thumbnailUrl!) else {
            return
        }
        imgView.kf.setImage(with: url)
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
