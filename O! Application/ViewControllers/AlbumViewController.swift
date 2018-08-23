//
//  AlbumViewController.swift
//  O! Application
//
//  Created by Baha Ganyev on 23.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import Kingfisher

class AlbumViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var albumArray: [Album] = []
    var fullAlbomArray: [Album] = []
    var photoArray: [Photo] = []
    var shufflePhoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getAlbums(completion: setAlbum, error: showErrorAlert)
        ServerManager.shared.getPhotos(completion: setPhoto, error: showErrorAlert)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func setAlbum(album: [Album]) {
        
        DataHelper.shared.addAlbums(albums: album)
        albumArray = DataHelper.shared.albums
        if !photoArray.isEmpty {
            self.tableView.reloadData()
        }
    }
    
    func setPhoto(photo: [Photo]) {
        photoArray = photo
        DataHelper.shared.assignPhotosToAlbum(photos: photo)
        if !albumArray.isEmpty {
            self.tableView.reloadData()
        }
    }
    
    
    
    
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumcell") as! AlbumCell
        cell.setAlbumData(album: albumArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "photovc") as! PhotoViewController
        vc.albumId = albumArray[indexPath.item].id
        self.show(vc, sender: self)
    }
    

    
}
