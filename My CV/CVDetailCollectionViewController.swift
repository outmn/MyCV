//
//  CVDetailCollectionViewController.swift
//  My CV
//
//  Created by Maxim  Grozniy on 01.05.16.
//  Copyright © 2016 Maxim  Grozniy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class CVDetailCollectionViewController: UICollectionViewController {
    
    var widthItem: CGFloat!
    var id: Int?
    var elements = ["Личное", "Информация",
                    "Образование", "Опыт работы",
                    "Достижения", "Навыки",
                    "Ожидания", "Проекты"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createRightGestures()
        
        let sizeScreen = SizeScreen()
        widthItem = sizeScreen.widht()/2 - 6

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return elements.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CVDetailCollectionViewCell
    
        cell.layer.cornerRadius = 8
        cell.label.text = elements[indexPath.row]
        cell.imageView.image = UIImage(named: "vc_\(indexPath.row)")
        cell.tag = indexPath.row
        
        if indexPath.row == 0 {
            cell.imageView.backgroundColor = UIColor.clearColor()
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        return CGSize(width: widthItem, height: widthItem)
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc: PersonalViewController = storyboard.instantiateViewControllerWithIdentifier("PersonalController") as! PersonalViewController
            self.presentViewController(vc, animated: true, completion: nil)
        } else {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc: CVViewController = storyboard.instantiateViewControllerWithIdentifier("CVController") as! CVViewController
            self.presentViewController(vc, animated: true, completion: nil)
        }
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

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
    
    }
    */

}
