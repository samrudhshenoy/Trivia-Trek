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
        
        self.letsGo.layer.cornerRadius = 7
        
        self.instructions.layer.cornerRadius = 7

        // Do any additional setup after loading the view.
    }
    

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
