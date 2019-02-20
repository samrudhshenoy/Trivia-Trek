//
//  Bounds.swift
//  Trivia Trek
//
//  Created by Arthur Lafrance on 2/19/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

class MapBounds {

    var x: Int
    final var minX: Int
    final var maxX: Int

    var y: Int
    final var minY: Int
    final var maxY: Int

    init(minX: Int, maxX: Int, minY: Int, maxY: Int) {
        
        self.x = 0
        self.minX = minX
        self.maxX = maxX
        
        self.y = 0
        self.minY = minY
        self.maxY = maxY
        
    }
    
    func move(direction: String) {
        
        switch direction {
            
            case "left":
                self.x -= 1
            
            case "right":
                self.x += 1
            
            case "up":
                self.y += 1
            
            case "down":
                self.y -= 1
            
            default:
                break
            
        }
        
    }
    
}
