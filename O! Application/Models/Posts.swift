//
//  File.swift
//  O! Application
//
//  Created by Baha Ganyev on 23.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation

class Post: Decodable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
}
