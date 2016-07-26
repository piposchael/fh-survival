//
//  MemoryTableController.swift
//  FH
//
//  Created by Philipp Schael on 29.06.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import UIKit

class MemoryTableController: UITableViewController {
    
    var memories = [Memory]()
    
    let cellID = "memorycellidentifer"
    
    
    func loadMemories(){
        
        let mem1 = Memory(title: "test1", memText: "testetesttest1", checked: false, date: "test")
        
        let mem2 = Memory(title: "test2", memText: "testetesttest2", checked: false, date: "test")
        
        let mem3 = Memory(title: "test3", memText: "testetesttest3", checked: false, date: "test")
        
        memories += [mem1,mem2,mem3]
    }
    
    func setCheckMark(tableView: UITableView, cell: UITableViewCell, index: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(index) {
            if cell.accessoryType == .Checkmark {
                cell.accessoryType = .None
                memories[index.row].isChecked = false
            } else {
                cell.accessoryType = .Checkmark
                memories[index.row].isChecked = true
            }
            saveMems()
        }
    }
    
    func deleteMemory(tableView: UITableView, index: NSIndexPath) {
        memories.removeAtIndex(index.row)
        saveMems()
        tableView.deleteRowsAtIndexPaths([index], withRowAnimation: .Fade)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.loadMemories()

        if let savedMems:[Memory] = loadMems() {
            memories += savedMems
        }else {
            loadMemories()
        }
        
        //navigationController?.navigationBar.barTintColor = UIColor.init(red: 138, green: 43, blue: 226, alpha: 100)
        //UINavigationBar.appearance().backgroundColor = UIColor.brownColor()
        
        
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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memories.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! MemoryCell

        // Configure the cell...
        
        if !memories[indexPath.row].isChecked {
            cell.accessoryType = .None
        }else if memories[indexPath.row].isChecked {
            cell.accessoryType = .Checkmark
        }
        /*
        if !checked[indexPath.row] {
            cell.accessoryType = .None
        } else if checked[indexPath.row] {
            cell.accessoryType = .Checkmark
        }*/
        
        let mem = memories[indexPath.row]
        
        cell.celltitle.text = mem.title

        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
       /* if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            memories.removeAtIndex(indexPath.row)
            saveMems()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }*/
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        var check:UITableViewRowAction
        
        if memories[indexPath.row].isChecked {
            check = UITableViewRowAction(style: .Normal, title: "Uncheck") { action, index in
                self.setCheckMark(tableView, cell: cell!, index: indexPath)}
        }else{
            check = UITableViewRowAction(style: .Normal, title: "Check") { action, index in
                self.setCheckMark(tableView, cell: cell!, index: indexPath)}
        }
        
        let delete = UITableViewRowAction(style: .Normal, title: "Löschen") { action, index in
            self.deleteMemory(tableView, index: indexPath)}
        check.backgroundColor = UIColor.blueColor()
        delete.backgroundColor = UIColor.redColor()
        
        return [delete,check]
    }
   /* override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }*/

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       self.performSegueWithIdentifier("segueToMemoryView", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToMemoryView" {
            
            // upcoming is set to NewViewController (.swift)
            let upcoming: MemoryViewController = segue.destinationViewController
                as! MemoryViewController
            // indexPath is set to the path that was tapped
            let indexPath = self.tableView.indexPathForSelectedRow
            // titleString is set to the title at the row in the objects array.
            let text = self.memories[indexPath!.row].memText
            let title = self.memories[indexPath!.row].title
            let date = self.memories[indexPath!.row].date
            // the titleStringViaSegue property of NewViewController is set.
            upcoming.text = text
            upcoming.navigationItem.title = title
            upcoming.date = date
            
            
            self.tableView.deselectRowAtIndexPath(indexPath!, animated: true)
        }
    }


    
    @IBAction func unwindToMemList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as?
            ViewController, memory = sourceViewController.memory{
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                //Update from File
                memories[selectedIndexPath.row] = memory
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
                
            }else{
                
                //Add new Memory
                let newIndexPath = NSIndexPath(forRow: memories.count, inSection: 0)
                memories.append(memory)
                
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
                
            }
            saveMems()
        }
        
    }
    
    // MARK: NSCoding
    
    func saveMems() {
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(memories, toFile: Memory.ArchiveURL.path!)
        
        if !isSuccessfulSave {
            print("error")
        }
    }
    
    func loadMems() -> [Memory] {
        let t = NSKeyedUnarchiver.unarchiveObjectWithFile(Memory.ArchiveURL.path!) as! [Memory]
        return t
    }
    
    func loadStyle(){
        let theme = ThemeSettings()
        
        let cell = UITableViewCell.appearance()
        cell.backgroundColor = theme.activeColor[1]
        
    }

}
