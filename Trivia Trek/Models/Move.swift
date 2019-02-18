//
//  Move.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/10/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

// Enumeration of a Move with all possible cases
class Move {
    
    // Move in the left direction
    static let left = (-1, 0)
    
    // Move in the right direction
    static let right = (1, 0)
    
    // Move in the upward direction
    static let up = (0, -1)
    
    // Move in the downward direction
    static let down = (0, 1)
    
    static let map = [up, up, up, up, up, right, up, up, up, right, right, right, right, down, down, down, right,
               down, down, down, down, down, down, down, down, down, down, down, down, left, left, left,
               left, left, left, up, up, up, up, right, right, up, up, up, left, left]
    
}
