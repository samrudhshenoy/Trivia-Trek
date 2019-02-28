//
//  InstructionsViewController.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 2/16/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var text: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if text != nil {
            text.clipsToBounds = true
            text.layer.cornerRadius = 15
        }
        
        self.backButton.layer.cornerRadius = 7
        
    }
    
    
//    func setupGestureRecognizer() {
//        let doubleTap = UITapGestureRecognizer(target: self, action: "handleDoubleTap:")
//        doubleTap.numberOfTapsRequired = 2
//        scrollView.addGestureRecognizer(doubleTap)
//    }
//
//    func handleDoubleTap(recognizer: UITapGestureRecognizer) {
//
//        if (scrollView.zoomScale > scrollView.minimumZoomScale) {
//            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
//        } else {
//            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
//        }
//    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
