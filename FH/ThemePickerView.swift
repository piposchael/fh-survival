//
//  ThemePickerView.swift
//  FH
//
//  Created by Philipp Schael on 23.07.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import UIKit

class ThemePickerView: UIViewController {
    
    let images = [UIImage(named: "orange"), UIImage(named: "pink")]
    
    
    let theme = ThemeSettings()
    
    override func viewDidLoad() {
    }
    
    @IBAction func greenBtn(sender: AnyObject) {
        theme.changeColorToString("green")
    }
    
    
    @IBAction func blueBtn(sender: AnyObject) {
        theme.changeColorToString("blue")
        print("save")
    }
    
    
    

}
