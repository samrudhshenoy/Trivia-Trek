//
//  SetupViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 1/21/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import SpriteKit

class SetupViewController: UIViewController {
    
    /// Label displaying current map's name
    @IBOutlet weak var mapLabel: UILabel!
    
    /// View displaying current map's image
    @IBOutlet weak var mapImageView: UIImageView!
    
    /// Buttons to shift map left and right
    @IBOutlet weak var leftMapButton: UIButton!
    @IBOutlet weak var rightMapButton: UIButton!
    
    /// Various properties of the two maps
    var mapImages: [UIImage] = []
    var mapNames: [String] = []
    var currentMap: Int = 0
    var numberOfTurns: Int = 0
    
    /// Game model classes to be modified during setup
    var player: Player?
    var game: Board = Board(maxTurns: 0, player: Player(), mapType: .normal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationTitleFont = UIFont(name: "AvenirNext-Bold", size: 16)!
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navigationTitleFont, NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.mapImages = [UIImage(named: "normal-map")!,
                          UIImage(named: "winter-map")!]
        self.mapNames = ["Normal", "Winter"]
        self.mapImageView.image! = self.mapImages[0]
        self.mapLabel.text! = "Map: \(self.mapNames[0])"
        
        self.game.map.type = Map.MapType(rawValue: self.currentMap)!
        self.game.player = self.player ?? Player()
        
    }
    
    /// Prepare to transition to the game board scene, pass along necessary data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is BoardViewController {
            
            let board = segue.destination as? BoardViewController
            board?.game = self.game
            if mapLabel.text == "Map: Normal" {
                board?.game!.background = SKSpriteNode(imageNamed: "background")
            }
            else {
                board?.game!.background = SKSpriteNode(imageNamed: "background-winter")
            }
            
        }
    }
    
    /// Find map to the left of the current one
    @IBAction func moveMapLeft(_ sender: Any) {
        
        if self.currentMap - 1 >= 0 {
            
            self.currentMap -= 1
            
        }
        else {
            
            self.currentMap = self.mapImages.count - 1
            
        }
        
        self.mapImageView.image! = self.mapImages[self.currentMap]
        self.mapLabel.text! = "Map: \(self.mapNames[self.currentMap])"
        self.game.toggleMapType()

    }
    
    /// Find map to the right of the current one
    @IBAction func moveMapRight(_ sender: Any) {
        
        if self.currentMap + 1 <= self.mapImages.count - 1 {
            
            self.currentMap += 1
            
        }
        else {
            
            self.currentMap = 0
            
        }
        
        self.mapImageView.image! = self.mapImages[self.currentMap]
        self.mapLabel.text! = "Map: \(self.mapNames[self.currentMap])"
        self.game.toggleMapType()

    }
    
    /// Return to the home screen if the Cancel button is clicked
    @IBAction func cancelButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "rewindToHome", sender: self)
        
    }
    
    
}
