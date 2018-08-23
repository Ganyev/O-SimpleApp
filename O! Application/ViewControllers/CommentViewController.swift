//
//  CommentViewController.swift
//  O! Application
//
//  Created by Baha Ganyev on 23.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var commentsArray: [Comment] = []
    var post: Post!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        ServerManager.shared.getComments(completion: setComments, error: showErrorAlert)
    }
    
//        func printPosts(post: [Comment]) {
//            for i in post {
//                print(i.name)
//            }
//        }

    func setComments(comment: [Comment]) {
        commentsArray = comment
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentcell", for: indexPath) as! CommentCell
        cell.setCommentsData(commentData: commentsArray[indexPath.row])
        return cell
    }

}
