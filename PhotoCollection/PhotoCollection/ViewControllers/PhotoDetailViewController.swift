//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Chance Payne on 9/20/19.
//  Copyright © 2019 Chance Payne. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
    }
    
    @IBAction func savePhotoAction(_ sender: Any) {
        if photoController != nil {
            if photo != nil {
                photoController?.Update(photo: photo!, imageData: (imageView.image?.pngData())!, title: textField.text ?? "")
    //            photo?.title = textField.text ?? ""
    //            photo?.imageData = (imageView.image?.pngData())!
            } else {
                //photo = Photo(imageData: (imageView.image?.pngData())!, title: textField.text ?? "")
    //            photoController.photos.append(photo!)
                photoController?.Create(imageData: (imageView.image?.pngData())!, title: textField.text ?? "")
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPhotoAction(_ sender: Any) {
        if photoController != nil {
            let picker = UIImagePickerController()
            picker.delegate = self
            
            picker.allowsEditing = false
            picker.sourceType = .photoLibrary
            
            present(picker, animated: true, completion: nil)
        }
    }
    
    func setTheme() {
        if themeHelper?.themePreference == ThemeHelper.Themes.DARK {
            self.view.backgroundColor = ThemeHelper.Colors.DARK
        } else {
            self.view.backgroundColor = ThemeHelper.Colors.LIGHT
        }
    }
    
    func updateViews() {
        setTheme()
        if photo != nil && photo?.imageData != nil {
            imageView.image = UIImage(data: photo!.imageData)
            textField.text = photo?.title
        }
    }
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                                        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any])  {
        let selectedImage = info[.originalImage] as? UIImage
        imageView.image = selectedImage
        
        /*if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }*/
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
