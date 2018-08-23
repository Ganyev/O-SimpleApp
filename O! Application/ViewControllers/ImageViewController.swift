//
//  ImageViewController.swift
//  O! Application
//
//  Created by Baha Ganyev on 23.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import Kingfisher

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    var image: Photo?
    override func viewDidLoad() {
        backButton.layer.borderWidth = 0.5
        backButton.layer.masksToBounds = false
        backButton.layer.borderColor = UIColor.lightGray.cgColor
        backButton.layer.cornerRadius = backButton.frame.height/2
        backButton.clipsToBounds = true
        super.viewDidLoad()
        guard let imagePath = image?.url else {
            return
        }
        guard let url = URL(string: imagePath) else {
            return
        }
        imgView.kf.setImage(with: url)
    }
    
    @IBAction func backButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
