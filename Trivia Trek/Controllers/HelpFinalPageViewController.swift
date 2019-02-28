//
//  HelpFinalPageViewController.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 1/26/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

/// Represents the last page of the series of help pages
class HelpFinalPageViewController: UIViewController {
    
    /// Button which returns user to title screen
    @IBOutlet weak var letsGo: UIButton!
    
    /// Button which redirects user to the detailed instructions page
    @IBOutlet weak var instructions: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.letsGo.layer.cornerRadius = 7
        
        self.instructions.layer.cornerRadius = 7

        // Do any additional setup after loading the view.
    }
    

    /// Returns the user to the title screen after the letsGo button is clicked
    @IBAction func buttonClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "rewindToHome", sender: self)
        
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
