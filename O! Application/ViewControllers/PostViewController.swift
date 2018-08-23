//
//  PostViewController.swift
//  O! Application
//
//  Created by Baha Ganyev on 23.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var postArray: [Post] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        ServerManager.shared.getPosts(completion: setPosts, error: showErrorAlert)
    }
    
    func setPosts(post: [Post]) {
        postArray = post
        self.tableView.reloadData()
    }
    
    func shufflePostsArray(post: [Post]) -> [Post]  {
        var tempArray = post
        var shuffledPost = [Post]();
        for _ in 0..<10
        {
            let rand = Int(arc4random_uniform(UInt32(tempArray.count)))
            
            shuffledPost.append(tempArray[rand])
            tempArray.remove(at: rand)
        }
        return shuffledPost
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as! PostCell
        cell.setPostData(postData: postArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        vc.post = postArray[indexPath.row]
        self.show(vc, sender: self)
    }
}
