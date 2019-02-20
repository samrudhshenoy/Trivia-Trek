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
    @IBOutlet weak var text: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if text != nil {
            self.text.layer.cornerRadius = 10
            self.text.isUserInteractionEnabled = false
        }
//
//        let text = UILabel()
//        self.text.layer.cornerRadius = 10
//        scrollView.backgroundColor = UIColor.white
//        scrollView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
//        scrollView.contentOffset = CGPoint(x: 1000, y: 450) //  Maybe change to be flexible to all phone sizes
//
//
//        scrollView.delegate = self
////        setZoomScale()
//        setupGestureRecognizer()
//
//        scrollView.addSubview(text)
//        view.addSubview(scrollView)
        
    }
    
    

    
//    override func viewWillLayoutSubviews() {
//        setZoomScale()
//    }
    
    
//    func scrollViewDidZoom(scrollView: UIScrollView) {
//        let scrollViewSize = scrollView.bounds.size
//
//        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
//        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
//
//        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
//    }
//
//    func setZoomScale() {
//        let scrollViewSize = scrollView.bounds.size
//        let widthScale = scrollViewSize.width / imageViewSize.width
//        let heightScale = scrollViewSize.height / imageViewSize.height
//
//        scrollView.minimumZoomScale = min(widthScale, heightScale)
//        scrollView.zoomScale = 1.0
//    }
    

    func setupGestureRecognizer() {
        let doubleTap = UITapGestureRecognizer(target: self, action: "handleDoubleTap:")
        doubleTap.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTap)
    }
    
    func handleDoubleTap(recognizer: UITapGestureRecognizer) {
        
        if (scrollView.zoomScale > scrollView.minimumZoomScale) {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        } else {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        }
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
