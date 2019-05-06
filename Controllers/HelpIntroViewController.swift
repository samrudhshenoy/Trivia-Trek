//
//  HelpIntroViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/10/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class HelpIntroViewController: UIViewController {

    /// Start button
    @IBOutlet weak var startButton: UIButton!
    
    /// Back button
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.startButton.layer.cornerRadius = 15
        self.backButton.layer.cornerRadius = 15
        
    }
    
    /// Returns to title screen if the back button is clicked
    @IBAction func backButtonClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "rewindToHome", sender: self)
        
    }

}
