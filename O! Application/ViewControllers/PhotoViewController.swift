//
//  PhotoViewController.swift
//  O! Application
//
//  Created by Baha Ganyev on 23.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var photosArray: [Photo] = []
    var album: Album!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        ServerManager.shared.getPhotos(completion: setPhoto, error: showErrorAlert)
    }
    
    func setPhoto(photo: [Photo]) {
        photosArray = photo
        self.collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photocell", for: indexPath) as! PhotoCell
        cell.setPhotoData(photoData: photosArray[indexPath.item])
        return cell
    }

}
