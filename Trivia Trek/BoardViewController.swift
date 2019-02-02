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

//public extension SKView {
//
//    func isIphoneX() -> Bool {
//
//        let screenHeight = 2436.0
//        let screenWidth = 1125.0
//        let iphoneXAspectRatio = screenHeight / screenWidth
//
//        let aspectRatio = Double(self.frame.width/self.frame.height)
//        return (aspectRatio == iphoneXAspectRatio) ? true : false
//
//    }
//
//}
