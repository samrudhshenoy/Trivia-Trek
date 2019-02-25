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

/// The game object of which the centrality of the entire game is based on
class Game: SKScene {
    
    /// Maximum number of turns taken by a player
    var maxTurns: Int
    
    /// Current number of turns taken by a player
    var turnsTaken: Int
    
    /// Player object which is stored in the game
    var player: Player
    
    /// Array of questions with answers, sourced from the online database
    var questions: [Question] = []
    
    /// Map object which the game's locations and coordinates are stored in
    var map: Map
    
    /// SpriteKit node of the game's background
    var background: SKSpriteNode?
    
    /// Current amount of points possessed by the player
    var points: Int
    
    /// Current answer streak kept up by the player
    var streak: Int
    
    /// Whether the player has gotten the most recent question correct or incorrect
    var qCorrect: Bool
    
    /**
     Initializes a new game with given maximum turns, player object, and background image
     
     - Parameters:
     - maxTurns: The maximum number of turns the player has opted for
     - player: The player object to be stored in the program
     - mapType: The specific type of map sourced from the Map class
     
     */
    init(maxTurns: Int, player: Player, mapType: Map.MapType) {
        self.maxTurns = maxTurns
        self.player = player
        self.turnsTaken = 1
        self.map = Map.defaultMap(type: .normal)
        self.points = 0
        self.streak = 1
        self.background = SKSpriteNode(imageNamed: "background")
        self.qCorrect = false
        
        super.init()
        
        self.scaleMode = .fill
        
        self.backgroundColor = Map.mapBackgrounds[mapType.rawValue]

        self.loadQuestions()
    }
    
    
    /**
     Initializes a new game with given CGSize for initialization of the SKScene
     
     - Parameters:
     - size: The size value to be used for SKScene initialization
     
     */
    override init(size: CGSize) {
        
        self.maxTurns = 0
        self.player = Player()
        self.turnsTaken = 1
        self.map = Map.defaultMap(type: .normal)
        self.points = 0
        self.streak = 1
        self.background = SKSpriteNode(imageNamed: "background")
        self.qCorrect = false
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
                        
                        let currentQuestion = Question(record: questionRecord)
                        self.questions.append(currentQuestion)
                        
                    }
                    
                }

            }

        })
        
    }
    
    /**
     Moves a player around the board, consistent with a given amount of spaces
     
     - Parameters:
     - numberOfSpaces: Amount of tiles that the player should move forward by
     
     */
    func movePlayer(numberOfSpaces: Int) {
        
        var mvmtChain: SKAction
        var movements: [SKAction] = []
        
        for _ in 0..<numberOfSpaces {
        
            let nextTile = self.map.path[self.player.pos + 1]
            let movement = SKAction.move(to: nextTile.sprite.position, duration: 1.0)
            movements.append(movement)
            self.player.pos += 1
        
        }
        
        mvmtChain = SKAction.sequence(movements)
        self.player.sprite.run(mvmtChain)
        
    }
    
    /// Sets up the player sprite to be used in gameplay
    func setupSprites() {
        
        if self.player.sprite.parent == nil {
            self.player.sprite.position = self.map.path[self.player.pos].sprite.position
            self.addChild(self.player.sprite)
        }
        
//        for tile in self.map.path {
//
//            if tile.sprite.parent == nil {
//                self.addChild(tile.sprite)
//            }
//
//        }
//
//        for decoration in self.map.decorations {
//
//            if decoration.parent == nil {
//                self.addChild(decoration)
//            }
//
//        }
//
//        print(self.map.path.count)
        
    }
    
    /// Sets up the background to be used in gameplay
    func initBackground(size: CGSize) {
        
        self.size = size
        
        self.background!.size = self.size
        self.background!.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        
        if self.background!.parent == nil {
            self.addChild(self.background!)
        }
        
    }
    
    /**
        Initializes the setup of the game, and executes basic game functions
     */
    func start() {
        
        while self.turnsTaken <= self.maxTurns {
            
            /*
             - roll dice
                - show moving number node thing, fast forward through number set behind the scenes
                - when user hits roll button, choose current number -> that's user's roll
                - multiply by answer streak multiplier thing
             - move one tile at a time
            */
            
        }
        
    }
    
    /**
     Serves as a player's or CPU's turn taken
     */
    func takeTurn() {
        
        /*
         Game flow (main loop pseudocode):
         - roll dice (or other do movement decision thing)
         - move
            - do any actions necessary while moving (depending on spaces hit, etc)
            - do final action for space landed on if any
         - pull up minigame screen
            - choose random minigame to do (maybe animate choice screen)
            - do minigame
            - update game state based on results
         - continue to next turn
         */
        
    }
    
}
