//
//  AlbumViewController.swift
//  O! Application
//
//  Created by Baha Ganyev on 23.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var albumArray: [Album] = []
    var fullAlbomArray: [Album] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getAlbums(completion: setAlbum, error: showErrorAlert)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func setAlbum(album: [Album]) {
        albumArray = shuffleAlbumArray(album: album)
        self.tableView.reloadData()
    }
    
    func shuffleAlbumArray(album: [Album]) -> [Album]  {
        var tempArray = album
        var shuffledAlbum = [Album]();
        for _ in 0..<10
        {
            let rand = Int(arc4random_uniform(UInt32(tempArray.count)))

            shuffledAlbum.append(tempArray[rand])
            tempArray.remove(at: rand)
        }
        return shuffledAlbum
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumcell") as! AlbumCell
        cell.textLabel?.text = albumArray[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "photovc") as! PhotoViewController
        vc.albumId = albumArray[indexPath.item].id
        self.show(vc, sender: self)
    }
    

    
}
