//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Chance Payne on 9/20/19.
//  Copyright © 2019 Chance Payne. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
        setTheme()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
//        collectionView.dequeueReusableCellWithReuseIdentifier()
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier, for: indexPath)
            as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        // Configure the cell
        cell.photo = photoController.photos[indexPath.row]
    
        return cell
    }
    
    func setTheme() {
        if themeHelper.themePreference == ThemeHelper.Themes.DARK {
            self.collectionView.backgroundColor = ThemeHelper.Colors.DARK
        } else {
            self.collectionView.backgroundColor = ThemeHelper.Colors.LIGHT
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "PhotoSelected":
            let dest = segue.destination as! PhotoDetailViewController
            dest.photoController = photoController
            dest.themeHelper = themeHelper
            dest.photo = (sender as! PhotosCollectionViewCell).photo
            break
        case "ShowSelectTheme":
            let dest = segue.destination as! ThemeSelectionViewController
            dest.themeHelper = themeHelper
            break
        case "AddPhoto":
            let dest = segue.destination as! PhotoDetailViewController
            dest.photoController = photoController
            dest.themeHelper = themeHelper
            break
        default:
            return
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
