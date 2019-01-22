//
//  TitleViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 1/21/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.playButton.layer.cornerRadius = 20
        self.connectButton.layer.cornerRadius = 20
        self.settingsButton.layer.cornerRadius = 20
        self.helpButton.layer.cornerRadius = 20

    }
    
    @IBAction func cancelGameStart(segue: UIStoryboardSegue) {
        
        
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
