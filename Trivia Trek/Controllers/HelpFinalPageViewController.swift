//
//  HelpFinalPageViewController.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 1/26/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class HelpFinalPageViewController: UIViewController {
    
    /// The button to return to the home screen
    @IBOutlet weak var letsGo: UIButton!
    
    /// The button to show a more detailed game tutorial
    @IBOutlet weak var instructions: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Make the buttons rounded
        self.letsGo.layer.cornerRadius = 15
        self.instructions.layer.cornerRadius = 15

    }
    
    /// Return to the home screen when the "Let's Go!" button is clicked
    @IBAction func buttonClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "rewindToHome", sender: self)
        
    }
    
    /// A placeholder function for the segue leading back from the instructions page
    @IBAction func closeInstructions(segue: UIStoryboardSegue) {
        
        
    }

}
