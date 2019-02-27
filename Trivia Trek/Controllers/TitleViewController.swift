//
//  TitleViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 1/21/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import GameKit
import CloudKit
import SCSDKLoginKit
import FBSDKLoginKit
import SCSDKBitmojiKit

class TitleViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
//    @IBOutlet weak var scoreHistoryButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var reportBug: UIButton!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var avatarButton: UIButton!
    @IBOutlet weak var avatarPicker: UIView!

    @IBOutlet weak var loginButton: FBSDKLoginButton!
    @IBOutlet weak var scLoginButton: UIButton!
    
    var player: Player = Player()
    var avatarPickerShowing: Bool = false
    
    var avatarPickerController: AvatarPickerViewController?
    
    let goldColor = UIColor(red: 1, green: 0.8, blue: 0.196, alpha: 0.8).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playButton.layer.cornerRadius = 15
        self.playButton.layer.borderWidth = 3
        self.playButton.layer.borderColor = self.goldColor
        
//        self.scoreHistoryButton.layer.cornerRadius = 15
//        self.scoreHistoryButton.layer.borderWidth = 3
//        self.scoreHistoryButton.layer.borderColor = self.goldColor
        
        self.helpButton.layer.cornerRadius = 15
        self.helpButton.layer.borderWidth = 3
        self.helpButton.layer.borderColor = self.goldColor
        
        self.reportBug.layer.cornerRadius = 15
        self.reportBug.layer.borderWidth = 2
        self.reportBug.layer.borderColor = self.goldColor
        
        let loginButton = FBSDKLoginButton(frame: CGRect(x: 170, y: 573, width: 90, height: 30))
        
        self.avatarPicker.alpha = 0
        
        
        view.addSubview(loginButton)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.avatarButton.setImage(self.player.getAvatar(), for: .normal)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is AvatarPickerViewController {
            
            let avatarPickerController = segue.destination as? AvatarPickerViewController
            self.avatarPickerController = avatarPickerController ?? nil
            self.avatarPickerController!.player = self.player
            self.avatarPickerController!.delegate = self
            
        }
        
    }
    
    @IBAction func toggleAvatarPicker(_ sender: Any) {

        if self.avatarPickerShowing {

            UIView.animate(withDuration: 1.2, animations: {
                self.avatarPicker.alpha = 0
            })

        }
        else {

            UIView.animate(withDuration: 1.2, animations: {
                self.avatarPicker.alpha = 1
            })

        }

        self.avatarButton.setImage(self.player.getAvatar(), for: .normal)
        self.avatarPickerShowing = !self.avatarPickerShowing

    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("User Logged In")
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("public_profile")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    func downloadBitmojiAvatar() {
        
        SCSDKBitmojiClient.fetchAvatarURL(completion: { avatarUrl, error in
            
//            print("fetched bitmoji avatar")
//            if error != nil {
//
//                print("\(error?.localizedDescription ?? "none")")
//            }
//            else {
//
//                let url = URL(string: avatarUrl!)
//                let avatarData = try? Data(contentsOf: url!)
//
//                if avatarData != nil {
//
//                    self.avatar = UIImage(data: avatarData!)
//
//                }
//
//                self.avatarButton.imageView?.image = self.avatar
//
//            }
        })
        
    }
    
    @IBAction func showScLogin(_ sender: Any) {
        
        SCSDKLoginClient.login(from: self, completion: { success, error in

            print("hi") 
            if error != nil {
                
                print("\(error?.localizedDescription ?? "none")")
            }

            if success {
                
                self.downloadBitmojiAvatar()
                
            }
        })
        
    }
    
//    @IBAction func showAvatarPicker(_ sender: Any) {
//        
////        UIView.animate(withDuration: 0.7, animations: {
////            self.avatarPicker.alpha = 1
////        })
//        
//        let avatarVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "avatarVC")
//        self.addChild(avatarVC)
//        avatarVC.view.frame = self.view.frame
//        self.view.addSubview(avatarVC.view)
//        avatarVC.didMove(toParent: self)
//        
//        
//    }
    
    @IBAction func rewindToHome(segue: UIStoryboardSegue) {
        
        
    }

}
