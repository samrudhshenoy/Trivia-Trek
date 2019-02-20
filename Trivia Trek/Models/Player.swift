//
//  Player.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 1/26/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import GameKit

// Represents the current player object and properties
class Player {
    
    // The tile the player is currently positioned on
    var pos: Int
    
    // The image (optional) of the player
    var sprite: SKSpriteNode
    
    // Initializes a new player with an optional photo
    init(photo: UIImage = UIImage(named: "avatar-sample")!) {
        self.sprite = SKSpriteNode(texture: SKTexture(image: photo))
        self.sprite.size = CGSize(width: 30, height: 30)
        
        self.pos = 0
    }
    
}
