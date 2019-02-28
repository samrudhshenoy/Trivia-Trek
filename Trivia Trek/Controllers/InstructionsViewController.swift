//
//  InstructionsViewController.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 2/16/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController, UIScrollViewDelegate {
    
    /// View which allows the user to scroll down the page
    @IBOutlet weak var scrollView: UIScrollView!
    /// Image of the instructions text
    @IBOutlet weak var text: UIImageView!
    /// Back button
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if text != nil {
            text.clipsToBounds = true
            text.layer.cornerRadius = 15
        }
        
        self.backButton.layer.cornerRadius = 15
        
    }
    
    /// Closes the instructions page if the back button is pressed
    @IBAction func close(_ sender: Any) {
        
        self.performSegue(withIdentifier: "close", sender: self)
    }
}
