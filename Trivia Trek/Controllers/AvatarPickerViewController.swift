//
//  AvatarPickerViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/16/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import SCSDKLoginKit
import SCSDKBitmojiKit

class AvatarPickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var mainView: UIView!

    
    @IBOutlet weak var male: UIImageView!
    @IBOutlet weak var photos: UIImageView!
    @IBOutlet weak var female: UIImageView!
    
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var photosButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.maleButton.layer.cornerRadius = 7
        self.photosButton.layer.cornerRadius = 7
        self.femaleButton.layer.cornerRadius = 7
        self.photos.layer.cornerRadius = 30
        
        imagePicker.delegate = self
        
        self.mainView.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
        
    }
    
    // Male button is clicked
    @IBAction func maleClicked(_ sender: Any) {
        // SET THE IMAGE CALLED 'cpupicmale'
        self.performSegue(withIdentifier: "rewindToHome", sender: self)
    }
    
    // Female button is clicked
    @IBAction func femaleClicked(_ sender: Any) {
        // SET THE IMAGE CALLED 'cpupicfemale'
        self.performSegue(withIdentifier: "rewindToHome", sender: self)
    }
    
    @IBAction func loadImageButtonTapped(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photosButton.contentMode = .scaleAspectFit
            photos.image = image
            photos.clipsToBounds = true
            self.photos.layer.cornerRadius = 44
            // SET THE IMAGE CALLED 'image'
        }

        dismiss(animated: true, completion: nil)
    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
