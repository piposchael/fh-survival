//
//  Page.swift
//  FH
//
//  Created by Philipp Schael on 01.07.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import UIKit

class Page: NSObject {
    
    var title: String
    
    var text: String
    
    var image: UIImage
    
    
    
    init(title: String, text: String, image: UIImage) {
        
        self.title = title
        self.text = text
        self.image = image
        
    }
    
    
}