//
//  Map.swift
//  Trivia Trek
//
//  Created by Arthur Lafrance on 2/18/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import SpriteKit

/// A model class representing a map course in Trivia Trek
class Map {

    /// The two possible types of maps
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
    
    /// A property representing the type of map
    var type: MapType
    
    /// Initializes a new map with given MapType
    init(type: MapType = .normal) {
        
        self.path = []
        self.type = type
        
    }
    
    /// Initializes and returns a new instance of the default map, as loaded from the appropriate asset
    static func defaultMap(type: MapType) -> Map {
        
        let defaultMap = Map(type: type)
        
        var tilePos: CGPoint
        
        /// Use the appropriate starting coordinate
        if type == .normal {
            
            tilePos = CGPoint(x: 60, y: 56)

        }
        else {
            
            tilePos = CGPoint(x: 56, y: 56)

        }
        
        /// Add the first tile
        var tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
        defaultMap.path.append(tile)
        
        /// Add 3 tiles up
        for _ in 0..<3 {
            
            tilePos.y += 36
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// Add 2 tiles right
        for _ in 0..<2 {
            
            tilePos.x += 37
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// Add 3 tiles up
        for _ in 0..<3 {
            
            tilePos.y += 36
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// Add 2 tiles left
        for _ in 0..<2 {
            
            tilePos.x -= 37
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// Add 5 tiles up
        for _ in 0..<5 {
            
            tilePos.y += 36
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// Add 1 tile right
        tilePos.x += 37
        tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
        defaultMap.path.append(tile)
        
        /// Add 3 tiles up
        for _ in 0..<3 {
            
            tilePos.y += 35
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// Add 4 tiles right
        for _ in 0..<4 {
            
            tilePos.x += 37
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// Add 3 tiles down
        for _ in 0..<3 {
            
            tilePos.y -= 36
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// Add 1 tile right
        tilePos.x += 37
        tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
        defaultMap.path.append(tile)
        
        /// Add 6 tiles down
        for _ in 0..<6 {
            
            tilePos.y -= 36
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        /// Add 5 additional tiles down
        for _ in 0..<5 {
            
            tilePos.y -= 35
            tile = Tile(x: Int(tilePos.x), y: Int(tilePos.y))
            defaultMap.path.append(tile)
            
        }
        
        return defaultMap
        
    }
    
    /// Switch the map type, adjusting the position of its path accordingly
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
