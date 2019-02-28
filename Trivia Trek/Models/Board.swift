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
    
    /// Initializes a new game with given maximum turns, player object, and background image
    init(maxTurns: Int, player: Player, mapType: Map.MapType) {
        self.maxTurns = maxTurns
        self.player = player
        self.turnsTaken = 0
        self.map = Map.defaultMap(type: .normal)
        self.streak = 0
        
        /// Initialize the SKScene superclass
        super.init()
        
        /// Set the scaling to fill the view
        self.scaleMode = .fill
        
        /// Download the questions from the database
        self.loadQuestions()
    }
    
    /// Initializes a new game with given size and default game properties
    override init(size: CGSize) {
        
        self.maxTurns = 0
        self.player = Player()
        self.turnsTaken = 0
        self.map = Map.defaultMap(type: .normal)
        self.streak = 0

        /// Initialize the SKScene superclass
        super.init(size: size)
        
        /// Download the questions from the database
        self.loadQuestions()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Loads the question data from the CloudKit database
    func loadQuestions() {
        
        /// Initialize the database
        let database = CKContainer.default().publicCloudDatabase

        /// Formulate the query
        let query = CKQuery(recordType: "Question", predicate: NSPredicate(value: true))

        /// Perform the query
        database.perform(query, inZoneWith: nil, completionHandler: { questions, error in
            if error != nil {

                /// Print the error to the console if query fails
                print("Query failed with error \(error?.localizedDescription ?? "none")")

            }
            else {

                /// Add each question to the game's question array
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
    
    /// Add the player sprite to the scene
    func addPlayerSprite() {
        
        if self.player.sprite.parent == nil {
            self.player.sprite.position = self.map.path[self.player.pos].sprite.position
            self.addChild(self.player.sprite)
        }
    
    }
    
    /// Add the map background image to the scene
    func initBackground(size: CGSize) {
        
        self.size = size
        
        self.background!.size = self.size
        self.background!.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        
        if self.background!.parent == nil {
            self.addChild(self.background!)
        }
        
    }
    
    /// Change the map type and adjust player position accordingly
    func toggleMapType() {
        
        self.map.toggleType()
        self.player.sprite.position = self.map.path[0].sprite.position
    }
    
}
