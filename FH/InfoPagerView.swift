//
//  InfoPagerView.swift
//  FH
//
//  Created by Philipp Schael on 01.07.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import UIKit

class InfoPagerView: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var textLabel: UILabel!
    
    var titlevar:String!
    
    var text: String!
    
    var image: UIImage!
    
    var pageIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = titlevar
        
        self.textLabel.text = text
        
        self.imageView.image = image
        
    }

}
