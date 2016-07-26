//
//  TableWebViewController.swift
//  FH
//
//  Created by Philipp Schael on 05.07.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import UIKit

class TableWebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var infoWebView: UIWebView!
    
    var htmlName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoWebView.delegate = self
        self.loadHtmltoWebview(htmlName)
        
        
        self.infoWebView.backgroundColor = UIColor.whiteColor()
        self.infoWebView.opaque = false

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        loadStyle()
    }
    override func viewDidAppear(animated: Bool) {
        loadStyle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadHtmltoWebview(name: String) {
        let htmlFile = NSBundle.mainBundle().pathForResource(name, ofType: "html")
        let url = NSURL(string: htmlFile!)
        let request = NSURLRequest(URL: url!)
        
        infoWebView.loadRequest(request)
        
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        
        if navigationType == UIWebViewNavigationType.LinkClicked {
            UIApplication.sharedApplication().openURL(request.URL!)
            print(request.URL)
            return false
        }
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func loadStyle(){
        let theme = ThemeSettings()
        
        infoWebView.backgroundColor = theme.activeColor[1]
        
    }

}
