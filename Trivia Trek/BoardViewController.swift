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

        let board = SKScene(fileNamed: "Board")
        
        if let player = board?.childNode(withName: "player") as? SKSpriteNode {
            
            player.texture = SKTexture(imageNamed: "avatar-sample")
            
        }
        
        self.boardView.presentScene(board)
        
    }
    
    @IBAction func moveRight(_ sender: Any) {
        
        let moveRight = SKAction(named: "moveLeft")
        let board = SKScene(fileNamed: "Board")
        
        if let player = board?.childNode(withName: "player") as? SKSpriteNode {
            print("hi")
            player.run(moveRight!)
            
        }
        
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
