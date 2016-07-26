//
//  WebViewController.swift
//  FH
//
//  Created by Philipp Schael on 05.07.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet var displayedView: UIView!
    
    
    var htmlName: String!
    var pageIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHtmltoWebview(htmlName)
        self.webView.opaque = false

    }
    override func viewWillAppear(animated: Bool) {
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
        
        webView.loadRequest(request)
        
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
        webView.backgroundColor = theme.activeColor[1]
        
        let pagecontrol = UIPageControl.appearance()
        pagecontrol.backgroundColor = theme.activeColor[1]
        
        displayedView.backgroundColor = theme.activeColor[1]
        
    }

}
