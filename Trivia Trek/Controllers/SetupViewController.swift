//
//  SetupViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 1/21/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {

    @IBOutlet weak var difficultySelector: UISegmentedControl!
    @IBOutlet weak var mapLabel: UILabel!
    @IBOutlet weak var mapImageView: UIImageView!
    @IBOutlet weak var leftMapButton: UIButton!
    @IBOutlet weak var rightMapButton: UIButton!
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var turnIncrementButton: UIStepper!
    
    var mapImages: [UIImage] = []
    var mapNames: [String] = []
    var currentMap: Int = 0
    var numberOfTurns: Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.turnIncrementButton.minimumValue = 10
        self.turnIncrementButton.maximumValue = 20
        
        self.turnLabel.text! = "Number of Turns: \(Int(self.turnIncrementButton.value))"
        
        let navigationTitleFont = UIFont(name: "AvenirNext-Bold", size: 16)!
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navigationTitleFont, NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.mapImages = [UIImage(named: "normal-map")!,
                     UIImage(named: "winter-map")!]
        self.mapNames = ["Normal", "Winter"]
        self.mapImageView.image! = self.mapImages[0]
        self.mapLabel.text! = "Map: \(self.mapNames[0])"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is BoardViewController {
            
            let board = segue.destination as? BoardViewController
            board?.game = Game(maxTurns: self.numberOfTurns, player: Player(avatar: nil), map: self.mapImages[self.currentMap])
            
        }
        
    }
    @IBAction func changeTurns(_ sender: Any) {
        
        let turns = Int(self.turnIncrementButton.value)
        self.turnLabel.text! = "Number of Turns: \(turns)"
        
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

    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
    
        performSegue(withIdentifier: "rewindToHome", sender: self)
        
    }

}
