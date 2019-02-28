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
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var reportBug: UIButton!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var avatarButton: UIButton!
    @IBOutlet weak var avatarPicker: UIView!
    
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    var player: Player = Player()
    var avatarPickerShowing: Bool = false
    
    var avatarPickerController: AvatarPickerViewController?
    
    let goldColor = UIColor(red: 1, green: 0.8, blue: 0.196, alpha: 0.8).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playButton.layer.cornerRadius = 15
        
        self.helpButton.layer.cornerRadius = 15
        
        self.reportBug.layer.cornerRadius = 15
        
        self.avatarPicker.alpha = 0
        
        let loginButton = FBSDKLoginButton(frame: CGRect(x: view.center.x - 45, y: view.center.y * 1.6, width: 90, height: 30))
    
        if UserDefaults.standard.hasObject(forKey: "bestScore") {
            
            let score = UserDefaults.standard.object(forKey: "bestScore") as! Int
            self.highScoreLabel.text = "Best Score: \(score == -1 ? "N/A" : "\(score)")"
            
        }
        else {
            
            self.highScoreLabel.text = "Best Score: N/A"

        }
        
        view.addSubview(loginButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.avatarButton.setImage(self.player.getAvatar(), for: .normal)
        
        if UserDefaults.standard.hasObject(forKey: "bestScore") {
            
            let score = UserDefaults.standard.object(forKey: "bestScore") as! Int
            self.highScoreLabel.text = "Best Score: \(score == -1 ? "N/A" : "\(score)")"
            
        }
        else {
            
            self.highScoreLabel.text = "Best Score: N/A"
            
        }

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is AvatarPickerViewController {
            
            let avatarPickerController = segue.destination as? AvatarPickerViewController
            self.avatarPickerController = avatarPickerController ?? nil
            self.avatarPickerController!.player = self.player
            self.avatarPickerController!.delegate = self
            
        }
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("User Logged In")
        if ((error) != nil) {}
        else if result.isCancelled {}
        else { if result.grantedPermissions.contains("public_profile") {} }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
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
    
    @IBAction func rewindToHome(segue: UIStoryboardSegue) {
        
        
    }

}
