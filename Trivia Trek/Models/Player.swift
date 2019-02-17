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
    
    /// The tile the player is currently positioned on
    var pos: Int
    /// The number of points the player currently has
    var points: Int
    /// The image (optional) of the player
    var avatar: UIImage?
    
    /// Initializes a new player with an optional photo
    init(avatar: UIImage?) {
        if avatar != nil {
            self.avatar = avatar
        }
        
        self.pos = 0
        self.points = 0
    }
    
}
