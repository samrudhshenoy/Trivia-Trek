//
//  Player.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 1/26/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import GameKit

class Player {
    
    var pos: Int
    var numberCorrect: Int
    var photo: UIImage?
    
    init(photo: UIImage?) {
        if photo != nil {
            self.photo = photo
        }
        
        self.pos = 0
        self.numberCorrect = 0
    }
    
}
