//
//  ThemeSettings.swift
//  FH
//
//  Created by Philipp Schael on 23.07.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import UIKit

class ThemeSettings: NSObject, NSCoding {
    
    
    var activeColor = [UIColor]()
    
    var colorString: String!
    
    
    override init(){
       super.init()
        
        let color = loadTheme()
        
        if let _: String = color {
            activeColor = setColor(color)
            colorString = color
        }else{
            loadDefaultColor()
        }
        //loadDefaultColor()
        
        
    }
    
    init(color:String){
        super.init()
        activeColor = setColor(color)
        colorString = color
    }
    
    
    func setColor(color:String) -> [UIColor] {
        
        let lightgreen = UIColor(red: 207/255, green: 213/255, blue: 143/255, alpha: 1.0)
        let lightpink = UIColor(red: 232/255, green: 156/255, blue: 192/255, alpha: 1.0)
        let lightgray = UIColor(red: 156/255, green: 157/255, blue: 162/255, alpha: 1.0)
        let lightblue = UIColor(red: 142/255, green: 205/255, blue: 224/255, alpha: 1.0)
        let lightpurple = UIColor(red: 169/255, green: 141/255, blue: 189/255, alpha: 1.0)
        let lightorange = UIColor(red: 252/255, green: 203/255, blue: 140/255, alpha: 1.0)
        
        let green = UIColor(red: 161/255, green: 175/255, blue: 0/255, alpha: 1.0)
        let pink = UIColor(red: 215/255, green: 29/255, blue: 122/255, alpha: 1.0)
        let gray = UIColor(red: 76/255, green: 76/255, blue: 84/255, alpha: 1.0)
        let blue = UIColor(red: 1/255, green: 154/255, blue: 195/255, alpha: 1.0)
        let purple = UIColor(red: 100/255, green: 33/255, blue: 141/255, alpha: 1.0)
        let orange = UIColor(red: 245/255, green: 153/255, blue: 2/255, alpha: 1.0)
        
        var willbecolor = [UIColor]()
        
        switch color {
        case "blue":
            willbecolor = [blue,lightblue]
        case "gray":
            willbecolor = [gray,lightgray]
        case "purple":
            willbecolor = [purple,lightpurple]
        case "pink":
            willbecolor = [pink,lightpink]
        case "orange":
            willbecolor = [orange,lightorange]
        default:
            willbecolor = [green, lightgreen]
        }
        
        return willbecolor
    }
    
    func changeColorToString(color:String) {
        self.colorString = color
        self.saveTheme()
    }
    
    
    func loadDefaultColor() {
        activeColor = [UIColor(red: 161/255, green: 175/255, blue: 0/255, alpha: 1.0), UIColor(red: 207/255, green: 213/255, blue: 143/255, alpha: 1.0)]
        colorString = "green"
    }
    
    struct PropertyKey{
        
        static let colorKey = "color"
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(colorString, forKey: PropertyKey.colorKey)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let colorString = aDecoder.decodeObjectForKey(PropertyKey.colorKey) as? String
        
        // Must call designated initializer.
        
        self.init(color: colorString!)
        
    }
    
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("Theme")
    
    // SAVE AND LOAD
    
    func saveTheme() {
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(colorString, toFile: ThemeSettings.ArchiveURL.path!)
        
        if !isSuccessfulSave {
            print("error")
        }
    }
    
    func loadTheme() -> String {
        let t = NSKeyedUnarchiver.unarchiveObjectWithFile(ThemeSettings.ArchiveURL.path!) as! String
        return t
    }
    
    
}