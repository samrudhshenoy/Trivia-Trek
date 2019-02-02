//
//  Player.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 2/2/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class CPU {
    
    var pos: Int
    var qRight: Int
    var numQuestion: Int
    var photo: UIImage!
    var diff: Int
    
    init(photo: UIImage!, diff: Int, numCPU: Int) {
        if (numCPU % 2 == 0) {
            self.photo = UIImage(named: "cpupicmale")
        }
        else {
            self.photo = UIImage(named: "cpupicfemale")
        }
        
        self.pos = 0
        self.qRight = 0
        self.numQuestion = 1
        self.diff = diff
    }
    
    func getPos () -> Int {
        return pos
    }
    
    func getQuestionsRight () -> Int {
        return qRight
    }
    
    func getNumQuestion () -> Int {
        return numQuestion
    }
    
    func getQuestionsWrong () -> Int {
        return numQuestion - qRight
    }
    
    func nextPos () {
        pos += 1
    }
    
    func act(playerCorrect: Int) -> Bool{
        if (diff == 1) { // easy
            if (qRight - playerCorrect <= -3) {
                qRight += 1
                numQuestion += 1
                return true
            }
            numQuestion += 1
            return false
            
        }
        else if (diff == 2) { //medium
            if (qRight - playerCorrect <= -1) {
                qRight += 1
                numQuestion += 1
                return true
            }
            numQuestion += 1
            return false
        }
        else { //hard
            if (qRight - playerCorrect > 0) {
                numQuestion += 1
                return false
            }
            qRight += 1
            numQuestion += 1
            return true
            
        }
    }
    
    func getDiff() -> Int {
        return diff
    }
    
    
}
