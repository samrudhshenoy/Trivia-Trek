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
    @IBOutlet weak var female: UIImageView!
    
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    var player: Player!
    var delegate: TitleViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.maleButton.layer.cornerRadius = 15
        self.femaleButton.layer.cornerRadius = 15
        
        imagePicker.delegate = self
        
        self.mainView.layer.cornerRadius = 10
//        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        // Do any additional setup after loading the view.
        
    }
    
    

    
    // Male button is clicked
    @IBAction func maleClicked(_ sender: Any) {
        // SET THE IMAGE CALLED 'cpupicmale'
        UserDefaults.standard.set("cpupicmale", forKey: "avatar")
        self.player.updateImg()
        self.delegate.toggleAvatarPicker(self)
        
//        self.view.removeFromSuperview()
    }
    
    // Female button is clicked
    @IBAction func femaleClicked(_ sender: Any) {
        // SET THE IMAGE CALLED 'cpupicfemale'
        UserDefaults.standard.set("cpupicfemale", forKey: "avatar")
        self.player.updateImg()
        self.delegate.toggleAvatarPicker(self)

//        self.view.removeFromSuperview()
        
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
