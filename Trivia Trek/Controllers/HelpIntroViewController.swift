//
//  HelpIntroViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/4/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class HelpIntroViewController: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.getStartedButton.layer.cornerRadius = 5
        self.backButton.layer.cornerRadius = 5

    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "backToHome", sender: self)
        
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
