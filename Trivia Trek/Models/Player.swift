//
//  Player.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 1/26/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import GameKit

/// Represents the current player object and properties
class Player {
    
    /// The number of the tile the player is currently positioned on
    var pos: Int
    
    /// The player object represented as a SpriteKit node
    var sprite: SKSpriteNode
    
    /// Initializes a new player with a photo and dimensions
    init() {
        self.pos = 0
        
        self.sprite = SKSpriteNode(texture: SKTexture(image: UIImage(named: "cpupicmale")!))
        self.sprite.size = CGSize(width: 30, height: 30)
        self.updateImg()
    }
    
    /// Updates the sprite's image based on a the chosen avatar (called when the avatar changes)
    func updateImg() {
        
        self.sprite.texture = SKTexture(image: self.getAvatar())
        
    }
    
    /// Loads the user's avatar from their local settings
    func getAvatar() -> UIImage {
        
        var path = UserDefaults.standard.object(forKey: "avatar") as? String
        
        /// If the path doesn't exist, set it to a default
        if path == nil {
            
            path = "cpupicmale"
            
        }
        
        /// Load the image at the given path
        let img = UIImage(named: path!)!
        
        return img
        
    }
    
}
