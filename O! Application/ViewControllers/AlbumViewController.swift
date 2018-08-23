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
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getAlbums(completion: setAlbum, error: showErrorAlert)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setAlbum(album: [Album]) {
        albumArray = album
        self.tableView.reloadData()
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
        self.show(vc, sender: self)
    }
    
}
