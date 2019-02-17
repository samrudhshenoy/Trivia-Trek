//
//  TitleViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 1/21/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import GameKit

class TitleViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var reportBug: UIButton!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var avatarButton: UIButton!
    @IBOutlet weak var avatarPicker: UIView!
    
    var playerName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playButton.layer.cornerRadius = 7
        self.connectButton.layer.cornerRadius = 7
        self.helpButton.layer.cornerRadius = 7
        self.reportBug.layer.cornerRadius = 7
        
        self.avatarPicker.alpha = 0
        
    }
    
    @IBAction func rewindToHome(segue: UIStoryboardSegue) {
        
        if segue.source is AvatarPickerViewController {
            
            UIView.animate(withDuration: 0.7, animations: {
                self.avatarPicker.alpha = 0
            })
            
        }
        
    }

    @IBAction func showAvatarPicker(_ sender: Any) {
        
        UIView.animate(withDuration: 0.7, animations: {
            self.avatarPicker.alpha = 1
        })
        
        
    }
}
