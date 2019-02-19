//
//  Move.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/10/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

typealias MoveVector = (x: Int, y: Int)

// Enumeration of a Move with all possible cases
class Move {
    
    // Move in the left direction
    static let left: MoveVector = (x: -20, y: 0)
    
    // Move in the right direction
    static let right: MoveVector = (x: 20, y: 0)
    
    // Move in the upward direction
    static let up: MoveVector = (x: 0, y: 20)
    
    // Move in the downward direction
    static let down: MoveVector = (x: 0, y: -20)
    
}
