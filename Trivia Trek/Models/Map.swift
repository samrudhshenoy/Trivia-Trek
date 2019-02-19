//
//  Map.swift
//  Trivia Trek
//
//  Created by Arthur Lafrance on 2/18/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class Map {

    // An array of Moves representing the map
    static let map = [Move.up, Move.up, Move.up, Move.up, Move.up, Move.right, Move.up, Move.up, Move.up, Move.right, Move.right,
                      Move.right, Move.right, Move.down, Move.down, Move.down, Move.right, Move.down, Move.down, Move.down,
                      Move.down, Move.down, Move.down, Move.down, Move.down, Move.down, Move.down, Move.down, Move.down, Move.left,
                      Move.left, Move.left, Move.left, Move.left, Move.left, Move.up, Move.up, Move.up, Move.up, Move.right,
                      Move.right, Move.up, Move.up, Move.up, Move.left, Move.left]
    
    // A tuple representing the initial position of a player on the map
    static let initialPosition = (x: 41, y: 300)
    
    // A tuple storing the map selection images for the two map variations
    static let mapImages = ()
    
    // A tuple storing the map background images for the two map variations
    static let mapBackgrounds = ()
    
}
