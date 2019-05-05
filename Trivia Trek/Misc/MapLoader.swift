//
//  MapLoader.swift
//  Trivia Trek
//
//  Created by Arthur Lafrance on 3/29/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import SpriteKit

class MapLoader: NSObject, XMLParserDelegate {

    var map: Map
    
    init(mapType: Map.MapType) {
        self.map = Map(type: mapType)
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
//        if elementName == "asset" {
//
//            var assetName: String?
//            var x: Int?
//            var y: Int?
//
//            // load asset
//            if let type = attributeDict["type"] {
//                assetName = type + "-" + self.map.type.rawValue
//            }
//
//            if let xValue = attributeDict["x"] {
//                x = Int(xValue)!
//            }
//
//            if let yValue = attributeDict["y"] {
//                y = Int(yValue)!
//            }
//
//            let asset = SKSpriteNode(imageNamed: assetName!)
//            asset.position = CGPoint(x: x!, y: y!)
//
//            if assetName!.starts(with: "tile") {
//                self.map.path.append(asset)
//            }
//            else {
//                self.map.decorations.append(asset)
//            }
//
//        }
        
    }
    
    class func loadMap(ofType type: Map.MapType, fromXML data: Data) -> Map {
        
        let parser = XMLParser(data: data)
        let loader = MapLoader(mapType: type)
        
        parser.delegate = loader
        parser.parse()
        
        return loader.map
        
    }
    
}
