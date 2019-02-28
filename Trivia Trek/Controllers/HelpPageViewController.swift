//
//  HelpPageViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 1/22/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit



class HelpPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    /// An array of all the available pages to display
    var pages: [UIViewController] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        /// Set the data source for the pages to be itself
        self.dataSource = self
        
        /// Load the pages into the property array
        self.pages = [self.loadPage(number: "One"),
                      self.loadPage(number: "Two"),
                      self.loadPage(number: "Three"),
                      self.loadPage(number: "Four")]
        
        /// Load the initial page into the view controller
        self.setViewControllers([self.pages[0]], direction: .forward, animated: true, completion: nil)
        
    }
    
    /// The function for determining which controller to display when moving left
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        /// Make sure the current view controller is in the array
        guard let index = self.pages.firstIndex(of: viewController) else {

            return nil

        }

        /// Use the view controller to the left of the current one
        let prevIndex = index - 1

        /// Make sure there is a controller to the left, otherwise don't return one
        guard prevIndex >= 0 else {

            return nil

        }
        
        return self.pages[prevIndex]

    }
    
    /// The function for determining which controller to display when moving right
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        /// Make sure the current view controller is in the array
        guard let index = self.pages.firstIndex(of: viewController) else {

            return nil

        }

        /// Use the view controller to the right of the current one
        let nextIndex = index + 1

        /// Make sure there is a controller to the right, otherwise don't return one
        guard nextIndex <= self.pages.count - 1 else {
            
            return nil

        }

        return self.pages[nextIndex]

    }
    
    /// Load the given page from the storyboard
    private func loadPage(number: String) -> UIViewController {
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Page\(number)")
        
    }
    
}
