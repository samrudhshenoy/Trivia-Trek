//
//  HelpIntroViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/10/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class HelpIntroViewController: UIViewController {

    /// The button to start the tutorial
    @IBOutlet weak var startButton: UIButton!
    
    /// The button to quit the tutorial
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// Make the buttons rounded
        self.startButton.layer.cornerRadius = 15
        self.backButton.layer.cornerRadius = 15
        
    }
    
    /// Return to the title screen if the back button is clicked
    @IBAction func backButtonClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "rewindToHome", sender: self)
        
    }

}
