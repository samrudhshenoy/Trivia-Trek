//
//  PlayerAuth.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/2/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import GameKit

class PlayerAuth: NSObject {

    static let authenticator = PlayerAuth()
    static var isAuthenticated: Bool {
        return GKLocalPlayer.local.isAuthenticated
    }
    
    var authViewController: UIViewController?
    
    override init() {
        
        super.init()
        
        GKLocalPlayer.local.authenticateHandler = { gcAuthController, error in
            
            NotificationCenter.default.post(name: .authChanged, object: GKLocalPlayer.local.isAuthenticated)
            
            if let controller = gcAuthController {
                
                self.authViewController?.present(controller, animated: true, completion: nil)
                
            }
            else {
                
                print("authentication failed with error: \(error?.localizedDescription ?? "none")")
                
            }
            
        }
        
    }
    
}

extension Notification.Name {
    
    static let presentGame = Notification.Name("presentGame")
    static let authChanged = Notification.Name("authChanged")

}
