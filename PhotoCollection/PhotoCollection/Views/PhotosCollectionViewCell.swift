//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Chance Payne on 9/20/19.
//  Copyright © 2019 Chance Payne. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        label.text = photo?.title
        // TODO Set image
        
    }
}
