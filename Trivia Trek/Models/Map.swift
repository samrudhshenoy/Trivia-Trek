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

    enum MapType: String {
        
        case normal = "normal"
        case winter = "winter"
        
    }
    
//    var path: [SKSpriteNode] = []
//    var decorations: [SKSpriteNode] = []
//
//    var type: MapType
//
//    var background: UIImage
//
//    init(type: MapType) {
//        self.type = type
//        self.background = UIImage(named: "background")!
//    }
    

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

            tilePos = CGPoint(x: 56, y: 56)

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

    /// Toggle the map type and adjust the path position accordingly
    func toggleType() {

        switch self.type {

            case .normal:
                for tile in self.path {
                    tile.sprite.position.x -= 4
                }
                self.type = .winter

            case .winter:
                for tile in self.path {
                    tile.sprite.position.x += 4
                }
                self.type = .normal

        }

    }
    
}


extension Dictionary {
    
    /// Find the index of a given key
    func index(ofKey key: Key) -> Int {
        
        for i in 0..<self.keys.count {
            let k = self.key(forIndex: i)
            
            if key == k {
                return i
            }
        }
        
        return -1
        
    }
    
    /// Find the key at a given index
    func key(forIndex index: Int) -> Key {
        
        return Array(self.keys)[index]
    
    }
    
    /// Direct subscript from index to value
    subscript(index: Int) -> Value {
        
        return self[Array(self.keys)[index]]!
        
    }
    
}
