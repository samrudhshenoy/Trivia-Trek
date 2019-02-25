//
//  SetupViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 1/21/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {
    
    @IBOutlet weak var mapLabel: UILabel!
    @IBOutlet weak var mapImageView: UIImageView!
    @IBOutlet weak var leftMapButton: UIButton!
    @IBOutlet weak var rightMapButton: UIButton!
    
    var mapImages: [UIImage] = []
    var mapNames: [String] = []
    var currentMap: Int = 0
    var numberOfTurns: Int = 0
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is BoardViewController {
            
            let board = segue.destination as? BoardViewController
            board?.game = self.game
            
        }
    }
    
    @IBAction func moveMapLeft(_ sender: Any) {
        
        if self.currentMap - 1 >= 0 {
            
            self.currentMap -= 1
            
        }
        else {
            
            self.currentMap = self.mapImages.count - 1
            
        }
        
        self.mapImageView.image! = self.mapImages[self.currentMap]
        self.mapLabel.text! = "Map: \(self.mapNames[self.currentMap])"
        self.game.map.type = Map.MapType(rawValue: self.currentMap)!
        
    }
    
    @IBAction func moveMapRight(_ sender: Any) {
        
        if self.currentMap + 1 <= self.mapImages.count - 1 {
            
            self.currentMap += 1
            
        }
        else {
            
            self.currentMap = 0
            
        }
        
        self.mapImageView.image! = self.mapImages[self.currentMap]
        self.mapLabel.text! = "Map: \(self.mapNames[self.currentMap])"
        self.game.map.type = Map.MapType(rawValue: self.currentMap)!
        
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "rewindToHome", sender: self)
        
    }
    
}
