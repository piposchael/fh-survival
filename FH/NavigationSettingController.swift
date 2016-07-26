//
//  NavigationSettingController.swift
//  FH
//
//  Created by Philipp Schael on 23.07.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import UIKit

class NavigationSettingController: UINavigationController {
    
    @IBOutlet weak var navbar: UINavigationBar!
    
    override func viewDidLoad() {
        let navba = UINavigationBar.appearance()
        let font = UIFont(name: "Open Sans", size: 17)
        navba.titleTextAttributes = [NSFontAttributeName: font!]
    }
    
    
    override func viewWillAppear(animated: Bool) {
        let theme = ThemeSettings()
        
        //NAVBAR
        let navBar = UINavigationBar.appearance()
        
        navBar.setBackgroundImage(imageWithColor(theme.activeColor[0]), forBarMetrics: .Default)
        navBar.barTintColor = UIColor.whiteColor()
        navBar.tintColor = UIColor.whiteColor()
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
    }
    
    func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }

}
