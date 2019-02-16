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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playButton.layer.cornerRadius = 7
        self.connectButton.layer.cornerRadius = 7
        self.helpButton.layer.cornerRadius = 7
        self.reportBug.layer.cornerRadius = 7
        
    }
    
    @IBAction func rewindToHome(segue: UIStoryboardSegue) {
        
        
    }

}
