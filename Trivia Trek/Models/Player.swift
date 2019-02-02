//
//  Player.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 1/26/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class Player {
    
    var pos: Int
    var qRight: Int
    var numQuestion: Int
    var photo: UIImage?
    
    init(photo: UIImage?) {
        if photo != nil {
            self.photo = photo
        }
        
        self.pos = 0
        self.qRight = 0
        self.numQuestion = 1
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
    
    func correct () {
        qRight += 1
        numQuestion += 1
    }
    
    func incorrect () {
        numQuestion += 1
    }
    
    
}
