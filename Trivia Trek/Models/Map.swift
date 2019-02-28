//
//  Map.swift
//  Trivia Trek
//
//  Created by Arthur Lafrance on 2/18/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import SpriteKit

typealias Bounds = (left: Int, right: Int, up: Int, down: Int)
typealias MoveVector = (x: Int, y: Int)

class Map {

    enum MapType: Int {
        
        case normal = 0
        case winter = 1
        
    }
    
    /// A tuple storing the map selection images for the two map variations
    static let mapImages = [UIImage(named: "normal-map"), UIImage(named: "winter-map")]
    
    /// A tuple storing the background color for the two map variations
    static let mapBackgrounds = [UIColor(red: 18/255, green: 126/255, blue: 13/255, alpha: 1), UIColor.white]
    
    /// An array of tile nodes representing the map path
    var path: [Tile]
    
    /// An array of decorative nodes representing the map decorations
    var decorations: [SKSpriteNode]
    
    /// A property representing the type of map
    var type: MapType
    
    /**
     Initializes a new map with given MapType
     
     - Parameters:
     - type: Declared type of map
     */
    init(type: MapType = .normal) {
        
        self.path = []
        self.decorations = []
        self.type = type
        
    }
    
    /**
     Initializes a new game with given maximum turns, player object, and background image
     
     - Parameters:
     - type: MapType considered when calculating precise coordinates
     
     - Returns:
     - The entire map represented as a series of coordinates
     
     */
    static func defaultMap(type: MapType) -> Map {
        
        let defaultMap = Map(type: type)
        
        var tilePos: CGPoint
        
        if type == .normal {
            
            tilePos = CGPoint(x: 60, y: 56)

        }
        else {
            
            tilePos = CGPoint(x: 57, y: 56)

        }
        
        var tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
        defaultMap.path.append(tile)
        
        /// 3 up
        for _ in 0..<3 {
            
            tilePos.y += 36
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// 2 right
        for _ in 0..<2 {
            
            tilePos.x += 37
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// 3 up
        for _ in 0..<3 {
            
            tilePos.y += 36
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// 2 left
        for _ in 0..<2 {
            
            tilePos.x -= 37
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// 5 up
        for _ in 0..<5 {
            
            tilePos.y += 36
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// 1 right
        tilePos.x += 37
        tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
        defaultMap.path.append(tile)
        
        /// 3 up
        for _ in 0..<3 {
            
            tilePos.y += 35
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// 4 right
        for _ in 0..<4 {
            
            tilePos.x += 37
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// 3 down
        for _ in 0..<3 {
            
            tilePos.y -= 36
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// 1 right
        tilePos.x += 37
        tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
        defaultMap.path.append(tile)
        
        /// 11 down
        for _ in 0..<6 {
            
            tilePos.y -= 36
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        for _ in 0..<5 {
            
            tilePos.y -= 35
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        return defaultMap
        
    }
    
    /**
     Initializes, generates, and returns a new map with given maximum size and type
     
     - Parameters:
     - size: Physical size of the map
     - type: Type of map
     
     - Returns:
     - The new, initialized map
     
     */
    static func generateMap(size: Int, type: MapType) -> Map {
        
        let moves = ["left" : (-40, 0),
            "right" : (40, 0),
            "up" : (0, 40),
            "down" : (0, -40)
        ]
        
        let map = Map(type: type)

        // Choose random starting point
        let x = Int.random(in: 68...308)
        let y = Int.random(in: 68...528)
        
        // Calculate maximum number of tiles allowed in each direction
        let leftRange = x - 68
        let rightRange = 308 - x
        let upRange = 528 - x
        let downRange = x - 68
        
        let bounds = MapBounds(minX: Int(leftRange / 40),
                               maxX: Int(rightRange / 40),
                               minY: Int(downRange / 40),
                               maxY: Int(upRange / 40))
        
        // Add starting tile to path
        var tile = Tile(x: x, y: y)
        map.path.append(tile)
        
        var prevDirection: String?
        
        for i in 1 ..< (size - 1) {
            
            // Choose a random number to represent the direction on a 1-100 scale
            let directionChoice = Int.random(in: 1...100)
            var direction: String!
            
            // Calculate all possible directions that the tile can move in
            var possibleMoves = ["left" : true, "right" : true, "up" : true, "down" : true]
            
            if bounds.x - 1 < bounds.minX {
                possibleMoves["left"] = false
            }
            
            if bounds.x + 1 > bounds.maxX {
                possibleMoves["right"] = false
            }
            
            if bounds.y + 1 > bounds.maxY {
                possibleMoves["up"] = false
            }
            
            if bounds.y - 1 < bounds.minY {
                possibleMoves["down"] = false
            }
            
            // Find which direction to move in before placing next tile
            if prevDirection != nil {
                
                switch directionChoice {
                    
                    // 70% chance of moving in the same direction (and 0% chance of moving backward)
                    case 1 ... 70:
                        direction = prevDirection!
                    
                    // 30% chance of moving in either of the two directions remaining (15% each)
                    case 71 ... 100:
                        // one of other directions
                        if prevDirection! == "left" || prevDirection! == "right" {
                            // prev was horizontal - go vertical
                            if (71 ... 85).contains(directionChoice) {
                                // go up
                                direction = "up"
                            }
                            else {
                                // go down
                                direction = "down"                            }
                        }
                        else {
                            // prev was vertical - go horizontal
                            if (71 ... 85).contains(directionChoice) {
                                // go left
                                direction = "left"
                            }
                            else {
                                // go right
                                direction = "right"
                            }
                        }
                    
                    default:
                        break
                    
                }
                
            }
            else {
                
                switch directionChoice {
                    
                    case 1 ... 25:
                        // left if possible
                        direction = "left"
                    
                    case 26 ... 50:
                        // right if possible
                        direction = "right"
                    
                    case 51 ... 75:
                        // up if possible
                        direction = "up"
                    
                    case 76 ... 100:
                        // down if possible
                        direction = "down"
                    
                    default:
                        break
                    
                }
                
            }
            
            var index = possibleMoves.index(ofKey: direction)
            var canMove = possibleMoves[index]
            
            // find closest valid direction to move in, turning 90 degrees if not valid
            while !canMove {
                if index + 1 < possibleMoves.count {
                    index += 1
                }
                else {
                    index = 0
                }
                
                canMove = possibleMoves[index]
            }
            
            direction = possibleMoves.key(forIndex: index)
            bounds.move(direction: direction)
            prevDirection = direction
            
            // make tile
            let prevTile = map.path[i - 1]
            let newX = prevTile.sprite.position.x + CGFloat(moves[direction]!.0)
            let newY = prevTile.sprite.position.y + CGFloat(moves[direction]!.1)

            tile = Tile(x: Int(newX), y: Int(newY))
            map.path.append(tile)
            
        }
        
        return map
        
    }
    
}


extension Dictionary {
    
    func index(ofKey key: Key) -> Int {
        
        for i in 0..<self.keys.count {
            let k = self.key(forIndex: i)
            
            if key == k {
                return i
            }
        }
        
        return -1
        
    }
    
    func key(forIndex index: Int) -> Key {
        
        return Array(self.keys)[index]
    
    }
    
    subscript(index: Int) -> Value {
        
        return self[Array(self.keys)[index]]!
        
    }
    
}
