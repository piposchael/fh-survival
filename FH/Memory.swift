//
//  Memory.swift
//  FH
//
//  Created by Philipp Schael on 29.06.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import Foundation

class Memory: NSObject, NSCoding{
    
    var title: String
    
    var memText: String
    
    var isChecked: Bool
    
    var date: String
    
    init(title: String, memText: String, checked: Bool, date: String){
        
        self.title = title
        self.memText = memText
        self.isChecked = checked
        self.date = date
        
    }
    
    
    struct PropertyKey{
        
        static let nameKey = "title"
        
        static let textKey = "text"
    
        static let checkedKey = "false"
        
        static let date = "date"
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
     
        aCoder.encodeObject(title, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(memText, forKey: PropertyKey.textKey)
        aCoder.encodeObject(isChecked, forKey: PropertyKey.checkedKey)
        aCoder.encodeObject(date, forKey: PropertyKey.date)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
    
        let title = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as? String
        
        let memText = aDecoder.decodeObjectForKey(PropertyKey.textKey) as? String
        
        let isChecked = aDecoder.decodeObjectForKey(PropertyKey.checkedKey) as? Bool
        
        let date = aDecoder.decodeObjectForKey(PropertyKey.date) as? String
        
        // Must call designated initializer.
        
        self.init(title:title!, memText: memText!, checked: isChecked!, date: date!)
        
    }
    
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("Memories")
    
}