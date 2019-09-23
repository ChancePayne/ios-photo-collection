//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Chance Payne on 9/20/19.
//  Copyright © 2019 Chance Payne. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func Create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }

    func Update(photo:Photo, imageData: Data, title: String) {
        photos.append(photo)
        
        if var existing = photos.first(where: { $0 == photo }) {
            existing.imageData = imageData
            existing.title = title
        }
    }
}
