//
//  AlbumManager.swift
//  O! Application
//
//  Created by Baha Ganyev on 24.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation

class DataHelper {
    static let shared = DataHelper()
    var albums: [Album] = []
    
    func addAlbums(albums: [Album]) {
        self.albums = albums
        self.albums = shuffleAlbumArray()
    }
    
    //рандомно заполняется массив из 10 альбомов
    func shuffleAlbumArray() -> [Album]  {
        var tempArray = albums
        var shuffledAlbum = [Album]();
        for _ in 0..<10
        {
            let rand = Int(arc4random_uniform(UInt32(tempArray.count)))
            
            shuffledAlbum.append(tempArray[rand])
            tempArray.remove(at: rand)
        }
        return shuffledAlbum
    }
    
    //рандомный выбор изображения
    func assignPhotosToAlbum(photos: [Photo])  {
        for p in photos {
            for (index, a) in albums.enumerated() {
                if p.albumId == a.id {
                    if albums[index].photos != nil {
                       albums[index].photos!.append(p)
                    } else {
                         albums[index].photos = [p]
                    }
                }
            }
        }
    }
    
    func shufflePostsArray(post: [Post]) -> [Post]  {
        var tempArray = post
        var shuffledPost = [Post]();
        for _ in 0..<20
        {
            let rand = Int(arc4random_uniform(UInt32(tempArray.count)))
            
            shuffledPost.append(tempArray[rand])
            tempArray.remove(at: rand)
        }
        return shuffledPost
    }
    
    
    
}
