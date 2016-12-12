//
//  CVCollectionViewController.swift
//  My CV
//
//  Created by Maxim  Grozniy on 29.04.16.
//  Copyright © 2016 Maxim  Grozniy. All rights reserved.
//

import UIKit
import Foundation
import CoreData

private let reuseIdentifier = "cv_cell"
var cv_list = [CV_Data]()

class CVCollectionViewController: UICollectionViewController {
    
    var widthItem: CGFloat!
    
    @IBOutlet var cvListCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        cv_list = CV_Data.getAllItems()
        
        // конвертируем картинку
        //let imageData: NSData = UIImagePNGRepresentation(imgRadioStation.image!)!
        
        // обратная конвертация из binary data в картинку
        //let imageData: NSData = UIImagePNGRepresentation(myImage)
        //let image: UIImage = UIImage(data: imageData)
        
        
        
        let sizeScreen = SizeScreen()
        widthItem = sizeScreen.widht()/3 - 2
        

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var id: Int?
        
        if segue.identifier == "detail" {
            let cell = sender as! CVCollectionViewCell
            let index = cvListCollectionView.indexPathForCell(cell)
            id = index?.row
            let vc = segue.destinationViewController as! CVDetailCollectionViewController
            vc.id = id
        }
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        return cv_list.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CVCollectionViewCell
        
        let item = cv_list[indexPath.row]
        
        cell.cvName.text = item.name
        dispatch_async(dispatch_get_main_queue()) {
            cell.cvPhoto.image = UIImage(data: item.photo!)!
        }
        
        cell.layer.cornerRadius = 8
    
        return cell
    }
    

    // MARK: UICollectionViewDelegate

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        return CGSize(width: widthItem, height: widthItem)
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
