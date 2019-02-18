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
    @IBOutlet weak var scoreHistoryButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var reportBug: UIButton!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var avatarButton: UIButton!
    @IBOutlet weak var avatarPicker: UIView!

    @IBOutlet weak var fbLoginButton: UIButton!
    @IBOutlet weak var scLoginButton: UIButton!
    
    var playerName: String!
    var avatar: UIImage!
    
    var avatarPickerController: AvatarPickerViewController?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playButton.layer.cornerRadius = 7
        self.scoreHistoryButton.layer.cornerRadius = 7
        self.helpButton.layer.cornerRadius = 7
        self.reportBug.layer.cornerRadius = 7
        
        self.avatarPicker.alpha = 0
        
        self.avatar = UIImage(named: "avatar-sample")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is AvatarPickerViewController {
            
            let avatarPickerController = segue.destination as? AvatarPickerViewController
            self.avatarPickerController = avatarPickerController ?? nil
            
        }
        
    }
    
    @IBAction func showFbLogin(_ sender: Any) {
        
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withReadPermissions: ["public_profile"], from: self, handler: { (result, error) in
            
            if error != nil {
                
                
            }
            else if result?.isCancelled ?? true {
                
                
            }
            else {
                
                if FBSDKAccessToken.currentAccessTokenIsActive() {
                 
                    let profile = FBSDKProfile.current()
                    //                let profileUrl = URL(string: "http://graph.facebook.com/\(profile?.userID)/picture")
                    //                let data = Data(contentsOf: profileUrl)
                    //                let avatar = UIImage(data: data)
                    self.avatar = UIImage(contentsOfFile: "http://graph.facebook.com/\(String(describing: profile?.userID))/picture")
                    self.avatarButton.imageView?.image = self.avatar
                    
                }
                
            }
            
        })
    }
    
    func downloadBitmojiAvatar() {
        
        SCSDKBitmojiClient.fetchAvatarURL(completion: { avatarUrl, error in
            
            print("fetched bitmoji avatar")
            if error != nil {
                
                print("\(error?.localizedDescription ?? "none")")
            }
            else {
                
                let url = URL(string: avatarUrl!)
                let avatarData = try? Data(contentsOf: url!)
                
                if avatarData != nil {
                    
                    self.avatar = UIImage(data: avatarData!)
                    
                }
                
                self.avatarButton.imageView?.image = self.avatar
                
            }
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
    
    @IBAction func rewindToHome(segue: UIStoryboardSegue) {
        
        
    }

}
