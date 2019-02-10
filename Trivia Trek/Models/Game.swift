//
//  Game.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/10/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class Game: NSObject {

    var maxTurns: Int
    var turnsTaken: Int
    var player: Player
    var map: [Move] = []
    var currentRoll: Int
    
    init(maxTurns: Int, player: Player) {
        
        self.maxTurns = maxTurns
        self.player = player
        self.turnsTaken = 0
        self.currentRoll = 0
        
    }
    
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
