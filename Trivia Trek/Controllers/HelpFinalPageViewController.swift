//
//  HelpFinalPageViewController.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 1/26/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class HelpFinalPageViewController: UIViewController {
    
    @IBOutlet weak var letsGo: UIButton!
    
    @IBOutlet weak var instructions: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.letsGo.layer.cornerRadius = 15
        
        self.instructions.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "rewindToHome", sender: self)
        
    }
    
    @IBAction func closeInstructions(segue: UIStoryboardSegue) {
        
        
    }

}
