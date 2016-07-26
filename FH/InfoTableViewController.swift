//
//  InfoTableViewController.swift
//  FH
//
//  Created by Philipp Schael on 05.07.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    
    
    var pages = ["rooms","fuhrer","ilias","module","termine","net","bib"]
    
    let cellID = "InfoTableCellID"
    
    let segue = "infoTableSegue"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.scrollEnabled = false

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
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
    
    //MARK: - Custom Funcs
    
    func createTitleForCell(title:String) -> String {
        var realTitle: String
        
        switch title {
        case "rooms":
            realTitle = "Räume"
        case "fuhrer":
            realTitle = "Studienführer"
        case "ilias":
            realTitle = "Ilias"
        case "module":
            realTitle = "Modulhandbuch"
        case "termine":
            realTitle = "Termine"
        case "net":
            realTitle = "Hochschulnetz"
        default:
            realTitle = "Bibliothek"
        }
        return realTitle
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.pages.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! InfoTableViewCell

        // Configure the cell...
        
        //cell.infoLabel.text = pages[indexPath.row]
        
        cell.infoLabel.text = createTitleForCell(pages[indexPath.row])

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("infoTableSegue", sender: self)
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "infoTableSegue" {
            
            // upcoming is set to NewViewController (.swift)
            let next: TableWebViewController = segue.destinationViewController
                as! TableWebViewController
            // indexPath is set to the path that was tapped
            let indexPath = self.tableView.indexPathForSelectedRow
            
            let page:String = self.pages[indexPath!.row]
            
            next.htmlName = page
            
            self.tableView.deselectRowAtIndexPath(indexPath!, animated: true)
        }
        
        
    }
   func loadStyle(){
        let theme = ThemeSettings()
        
        //table.backgroundColor = theme.activeColor[0]
        let tabe = UITableView.appearance()
        tabe.backgroundColor = theme.activeColor[0]
        
        let cell = UITableViewCell.appearance()
        cell.backgroundColor = theme.activeColor[1]
        
    }
}
