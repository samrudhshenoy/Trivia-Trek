//
//  BoardViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 1/27/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import SpriteKit

class BoardViewController: UIViewController {

    @IBOutlet weak var boardView: SKView!
    @IBOutlet weak var tapTester: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let board = SKScene(size: self.boardView.bounds.size)

        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: board.size.width / 2, y: board.size.height / 2)
        background.size = CGSize(width: board.size.width, height: board.size.height)
        board.addChild(background)
        
        let player = SKSpriteNode(imageNamed: "avatar-sample")
        player.position = CGPoint(x: board.size.width / 2, y: board.size.height / 2)
        player.size = CGSize(width: 60, height: 60)
        board.addChild(player)
        
        self.boardView.presentScene(board)
        
    }
    
    @IBAction func moveRight(_ sender: Any) {
        
        let moveRight = SKAction(named: "moveLeft")
        let board = SKScene(fileNamed: "Board")
        
        if let player = board?.childNode(withName: "player") as? SKSpriteNode {
            
            player.run(moveRight!)
            
        }
        
    }

}
