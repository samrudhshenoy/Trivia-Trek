//
//  Game.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/10/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import SpriteKit
import CloudKit

// The game object of which the centrality of the entire game is based on
class Board: SKScene {
    
    // Maximum number of turns taken by a player
    var maxTurns: Int
    
    // Current number of turns taken by a player
    var turnsTaken: Int
    
    // Player object which is stored in the game
    var player: Player
    
    // Array of questions with answers, sourced from the online database
    var questions: [Question] = []
    
    var map: Map
    
    var background: SKSpriteNode?
    
    var streak: Double
    
    /**
     Initializes a new game with given maximum turns, player object, and background image
     
     - Parameters:
     - maxTurns: The maximum number of turns the player has opted for
     - player: The player object to be stored in the program
     - map: The background image of the map
     
     */
    init(maxTurns: Int, player: Player, mapType: Map.MapType) {
        self.maxTurns = maxTurns
        self.player = player
        self.turnsTaken = 0
        self.map = Map.defaultMap(type: .normal)
        self.background = SKSpriteNode(imageNamed: "background")
        self.streak = 0
        
        super.init()
        
        self.scaleMode = .fill
        
        self.backgroundColor = Map.mapBackgrounds[mapType.rawValue]

        self.loadQuestions()
    }
    
    override init(size: CGSize) {
        
        self.maxTurns = 0
        self.player = Player()
        self.turnsTaken = 0
        self.map = Map.defaultMap(type: .normal)
        self.background = SKSpriteNode(imageNamed: "background")
        self.streak = 0

        super.init(size: size)
        
        self.backgroundColor = Map.mapBackgrounds[Map.MapType.normal.rawValue]
        
        self.loadQuestions()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Loads all the questions from the online database into the Questions array.
     Prints error description in the console if query fails
     */
    func loadQuestions() {
        
        let database = CKContainer.default().publicCloudDatabase

        let query = CKQuery(recordType: "Question", predicate: NSPredicate(value: true))

        database.perform(query, inZoneWith: nil, completionHandler: { questions, error in
            if error != nil {

                print("Query failed with error \(error?.localizedDescription ?? "none")")

            }
            else {

                for questionRecord in questions! {

                    let queue = DispatchQueue(label: "questionQuery")
                    
                    queue.sync {
                        
                        let currentQuestion = Question(fromRecord: questionRecord)
                        self.questions.append(currentQuestion)
                        
                    }
                    
                }

            }

        })
        
    }
    
    func setupSprites() {
        
        if self.player.sprite.parent == nil {
            self.player.sprite.position = self.map.path[self.player.pos].sprite.position
            self.addChild(self.player.sprite)
        }
        
    }
    
    func initBackground(size: CGSize) {
        
        self.size = size
        
        self.background!.size = self.size
        self.background!.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        
        if self.background!.parent == nil {
            self.addChild(self.background!)
        }
        
    }
    
    class func getBestScore() -> Int {
        
        
        let path = Bundle.main.path(forResource: "Info", ofType: ".plist")
        
        if path != nil {
            
            let data = FileManager.default.contents(atPath: path!)
        }
        
        return 0
        
    }
    
    class func setBestScore(score: Int) {
        
        
    }

}
