//
//  SetupViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 1/21/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {

    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var playerIncrementButton: UIStepper!
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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.playerIncrementButton.minimumValue = 3
        self.playerIncrementButton.maximumValue = 6
        
        self.playerLabel.text! = "Number of Players: \(Int(self.playerIncrementButton.value))"
        
        self.turnIncrementButton.minimumValue = 10
        self.turnIncrementButton.maximumValue = 20
        
        self.turnLabel.text! = "Number of Turns: \(Int(self.turnIncrementButton.value))"
        
        let navigationTitleFont = UIFont(name: "ChalkboardSE-Bold", size: 16)!
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navigationTitleFont, NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.mapImages = [UIImage(named: "normal-map")!,
                     UIImage(named: "winter-map")!]
        self.mapNames = ["Normal", "Winter"]
        self.mapImageView.image! = self.mapImages[0]
        self.mapLabel.text! = "Map: \(self.mapNames[0])"
        
    }
    
    @IBAction func changeNumberOfPlayers(_ sender: Any) {
        
        let numberOfPlayers = Int(self.playerIncrementButton.value)
        self.playerLabel.text! = "Number of Players: \(numberOfPlayers)"
    
    }
    
    @IBAction func changeTurns(_ sender: Any) {
        
        let numberOfTurns = Int(self.turnIncrementButton.value)
        self.turnLabel.text! = "Number of Turns: \(numberOfTurns)"
        
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
     
        performSegue(withIdentifier: "cancelGameStart", sender: self)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
