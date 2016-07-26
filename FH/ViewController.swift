//
//  ViewController.swift
//  FH
//
//  Created by Philipp Schael on 29.06.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet var newView: UIView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var memory: Memory?
    
    let date = NSDate()
    
    let dateFormatter = NSDateFormatter()
    
    var convertedDate = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTextView()
        self.dateLabel.text = getDate()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        loadStyle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func getDate() -> String {
        self.dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        self.dateFormatter.locale = NSLocale(localeIdentifier: "de_DE")
        self.dateFormatter.dateFormat = "d MMMM yyyy - HH:mm"
        convertedDate = self.dateFormatter.stringFromDate(date)
        
        return convertedDate
    }
    
    func setupTextView() {
        textView.delegate = self
        textView.text = "Gib einen Text ein..."
        textView.textColor = UIColor.blackColor()
        
    }
    
    func textViewDidBeginEditing(textView: UITextView){
        if textView.text == "Gib einen Text ein..." {
            textView.text = nil
            textView.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text == "" {
            textView.text = "Gib einen Text ein..."
            textView.textColor = UIColor.lightGrayColor()
        }
    }
    
    func cutTitle() -> String {
        var firstLetters: String
        let lenght = self.textView.text.characters.count
        
        if lenght > 30 {
            let index = self.textView.text.endIndex.advancedBy(-lenght+30)
            firstLetters = textView.text.substringToIndex(index)
            firstLetters += "..."
        }else{
            let index = self.textView.text.endIndex.advancedBy(0)
            firstLetters = textView.text.substringToIndex(index)
        }
        
        return firstLetters
    }

    // MARK: Navigation
    
    @IBAction func cancelButton(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if saveButton === sender {
            let date = getDate()
            
            let title = cutTitle()
            
            let text = textView.text ?? ""
            
            let checked = false
            
            memory = Memory(title:title, memText: text, checked: checked, date: date)
        }
        
    }
    
    func loadStyle(){
        let theme = ThemeSettings()
        self.newView.backgroundColor = theme.activeColor[1]
        self.textView.backgroundColor = theme.activeColor[1]
    }
    
    
}

