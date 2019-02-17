//
//  Move.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/10/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

// Enumerator class to keep track of all possible moves (each Move represents the action necessary to reach the next space)
class Move {
    
    // Move in the left direction
    let left = (-1, 0)
    
    // Move in the right direction
    let right = (1, 0)
    
    // Move in the upward direction
    let up = (0, -1)
    
    // Move in the downward direction
    let down = (0, 1)
    
    // Represents the final space in a game
    let end = (0, 0)
    
}
