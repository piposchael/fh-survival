//
//  MemoryViewController.swift
//  FH
//
//  Created by Philipp Schael on 30.06.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import UIKit

class MemoryViewController: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet var memView: UIView!
    
    
    var text:String!
    
    var date:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textLabel.text = text
        self.dateLabel.text = "Erstellt am: " + date
        
        textLabel.numberOfLines = 0
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        
        navigationItem.backBarButtonItem?.title = " "
        
    }
    
    override func viewWillAppear(animated: Bool) {
        let theme = ThemeSettings()
        self.memView.backgroundColor = theme.activeColor[1]
    }

}
