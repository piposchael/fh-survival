//
//  CollectionViewController.swift
//  FH
//
//  Created by Philipp Schael on 23.07.16.
//  Copyright © 2016 Philipp Schael. All rights reserved.
//

import UIKit

private let reuseIdentifier = "collectionCellID"

class CollectionViewController: UICollectionViewController {
    
    @IBOutlet var collView: UICollectionView!
    
    var pics = ["orange","blue","pink","green","purple","gray"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collView.delegate = self
        collView.scrollEnabled = false
        
        //loadStyle()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCellID")

        // Do any additional setup after loading the view.
    }

    override func viewDidDisappear(animated: Bool) {
        collView.reloadData()
        loadStyle()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.pics.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCellID", forIndexPath: indexPath) as! CollectionViewCell
        
        let theme = ThemeSettings()
        let color = pics[indexPath.row]
        let img = UIImage(named: color)
        cell.imageDisplay.image = img
        cell.layer.borderWidth = 0
        
        
        if pics[indexPath.row] == theme.colorString {
            cell.layer.cornerRadius = 5
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = UIColor.grayColor().CGColor
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    /*override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        
        
        return true
    }*/
 

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        
    
    }*/
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = pics[indexPath.row]
        let theme = ThemeSettings()
        
        switch cell {
        case "orange":
            theme.changeColorToString("orange")
        case "blue":
            theme.changeColorToString("blue")
        case "pink":
            theme.changeColorToString("pink")
        case "gray":
            theme.changeColorToString("gray")
        case "purple":
            theme.changeColorToString("purple")
        default:
            theme.changeColorToString("green")
        }
        collView.reloadData()
        loadStyle()
       
    }
    
    func loadStyle(){
        let theme = ThemeSettings()
        
        let tabe = UITableView.appearance()
        tabe.backgroundColor = theme.activeColor[0]
        
        let cell = UITableViewCell.appearance()
        cell.backgroundColor = theme.activeColor[1]
        
        let nav = UINavigationBar.appearance()
        nav.backgroundColor = theme.activeColor[0]
        
        let web = UIWebView.appearance()
        web.backgroundColor = theme.activeColor[1]
        
        let pagecon = UIPageControl.appearance()
        pagecon.backgroundColor = theme.activeColor[1]
        
    }

}
