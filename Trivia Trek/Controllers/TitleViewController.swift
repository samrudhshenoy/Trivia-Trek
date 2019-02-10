//
//  TitleViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 1/21/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import GameKit

class TitleViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var gameCenterLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playButton.layer.cornerRadius = 5
        self.connectButton.layer.cornerRadius = 5
        self.settingsButton.layer.cornerRadius = 5
        self.helpButton.layer.cornerRadius = 5
        
        self.gameCenterLogo.layer.cornerRadius = 5
        self.gameCenterLogo.layer.borderColor = UIColor(red: 0, green: 0.78, blue: 0, alpha: 1).cgColor

        if GKLocalPlayer.local.isAuthenticated {
            
            self.gameCenterLogo.layer.borderWidth = 3
            
        }
        else {
            
            self.gameCenterLogo.layer.borderWidth = 0
            
        }
        
        GKLocalPlayer.local.authenticateHandler = { authScreen, error in
            
            NotificationCenter.default.post(name: .authChanged, object: GKLocalPlayer.local.isAuthenticated)
            
            if GKLocalPlayer.local.isAuthenticated {
                
                
            }
            else if authScreen != nil {
                
                self.present(authScreen!, animated: true, completion: nil)
                
            }
            else {
                
                print("Authentication failed with error: \(error?.localizedDescription ?? "none")")
                
            }
            
        }
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.authChanged(notification:)),
            name: .authChanged,
            object: nil
        )
        
    }
    
    @IBAction func cancelGameStart(segue: UIStoryboardSegue) {
        
        
    }
    
    @objc func authChanged(notification: Notification) {
        
        let isLoggedIn = notification.object as? Bool ?? false

        if isLoggedIn {
            
            self.gameCenterLogo.layer.borderWidth = 3
            
        }
        else {
            
            self.gameCenterLogo.layer.borderWidth = 0

        }
        
    }
    
}

extension Notification.Name {
    
    static let presentGame = Notification.Name("presentGame")
    static let authChanged = Notification.Name("authChanged")
    
}

