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
    
     /// Update the sprite's image (called when avatar changes)
    func updateImg() {
        
        self.sprite.texture = SKTexture(image: self.getAvatar())
        
    }
    
    /// Load the avatar from the user's local settings
    func getAvatar() -> UIImage {
        
        var path = UserDefaults.standard.object(forKey: "avatar") as? String
        
        if path == nil {
            
            path = "cpupicmale"
            
        }
        
        var img: UIImage
        
        if path!.starts(with: "@") {
            
            let url = URL(string: String(path![path!.index(path!.startIndex, offsetBy: 1)..<path!.endIndex]))
            let data = try? Data(contentsOf: url!)
            img = UIImage(data: data!)!
            
        }
        else {
            
            img = UIImage(named: path!)!
            
        }
        
        return img
        
    }
    
}
