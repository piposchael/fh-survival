//
//  InfoPagerController.swift
//  FH
//
//  Created by Philipp Schael on 01.07.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import UIKit

class InfoPagerController: UIViewController, UIPageViewControllerDataSource {
    
    @IBOutlet var backgroundView: UIView!
    
    var pageViewController: UIPageViewController!
    
    var pages = ["steps","grundhaltung","rythmus","notes","ordnung","learngroups","eandr","bafog","books"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.backgroundView.backgroundColor = UIColor.whiteColor()
        
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewControllerID") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0) as WebViewController
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 80)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
        
    }
    override func viewWillAppear(animated: Bool) {
        loadStyle()
    }
    

    func viewControllerAtIndex(index: Int) -> WebViewController {
        
        if (self.pages.count == 0) || (index >= self.pages.count) {
            return WebViewController()
        }
        
        let vc: WebViewController = self.storyboard?.instantiateViewControllerWithIdentifier("WebViewPager") as! WebViewController
        
        
        vc.pageIndex = index
        vc.htmlName = pages[index]
        
        return vc
        
    }
    
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! WebViewController
        var index = vc.pageIndex as Int
        
        if (index == 0 || index == NSNotFound)
        {
            return nil
            
        }
        
        index -= 1
        return self.viewControllerAtIndex(index)
        
    }

    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! WebViewController
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound)
        {
            return nil
        }
        
        index += 1
        
        if (index == self.pages.count)
        {
            return self.viewControllerAtIndex(0)
        }
        
        return self.viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pages.count
    }
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func loadStyle(){
        let theme = ThemeSettings()
        
        self.backgroundView.backgroundColor = theme.activeColor[1]
    }
    
}
