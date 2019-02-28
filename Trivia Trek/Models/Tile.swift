//
//  Tile.swift
//  Trivia Trek
//
//  Created by Arthur Lafrance on 2/18/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import Foundation
import SpriteKit

class Tile {
    
    /// The tile's graphical node that appears on the game board
    var sprite: SKSpriteNode
    
    /// Initializes a tile with given coordinates
    init(x: Int, y: Int) {
        
        self.sprite = SKSpriteNode(imageNamed: "trail-normal")
        self.sprite.size = CGSize(width: 40, height: 40)
        self.sprite.position = CGPoint(x: x, y: y)
                
    }
    
}
