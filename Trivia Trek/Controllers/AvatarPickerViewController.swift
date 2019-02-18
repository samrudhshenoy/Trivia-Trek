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

class AvatarPickerViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var defaultAvatarView: UIImageView!
    @IBOutlet weak var fbAvatarView: UIImageView!
    @IBOutlet weak var scAvatarView: UIImageView!
    
    @IBOutlet weak var defaultSelectButton: UIButton!
    @IBOutlet weak var fbSelectButton: UIButton!
    @IBOutlet weak var scSelectButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainView.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
        if FBSDKAccessToken.currentAccessTokenIsActive() {
            
            self.fbSelectButton.isEnabled = true
            self.fbSelectButton.alpha = 0.8
            
        }
        else {
            
            self.fbSelectButton.isEnabled = false
            self.fbSelectButton.alpha = 0.5
            
        }
        
    }
    
    @IBAction func cancelSelection(_ sender: Any) {
        self.performSegue(withIdentifier: "rewindToHome", sender: self)
        
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
