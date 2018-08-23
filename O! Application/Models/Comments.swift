//
//  Comments.swift
//  O! Application
//
//  Created by Baha Ganyev on 23.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation

class Comment: Decodable {
    var postId: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
}
