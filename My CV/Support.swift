//
//  Support.swift
//  My CV
//
//  Created by Maxim  Grozniy on 29.04.16.
//  Copyright © 2016 Maxim  Grozniy. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public func getManagerContext() -> NSManagedObjectContext {
    return (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
}


extension UIViewController {
    func createUpDownGestures() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        
        swipeUp.direction = .Up
        swipeDown.direction = .Down
        
        self.view.addGestureRecognizer(swipeUp)
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func createRightGestures() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        swipeRight.direction = .Right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    func handleSwipe(sender: UISwipeGestureRecognizer) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

public class SizeScreen {
    
    func widht() -> CGFloat {
        return UIScreen.mainScreen().bounds.size.width
    }
    
    func height() -> CGFloat {
        return UIScreen.mainScreen().bounds.size.height
    }
    
    func modelIphone() -> model {
        if      widht() == 320 && height() == 480 {return .iphone4}
        else if widht() == 320 && height() == 568 {return .iphone5}
        else if widht() == 375 && height() == 667 {return .iphone6}
        else if widht() == 414 && height() == 736 {return .iphone6Plus}
        return .none
    }
    
    
    enum model {
        case none
        case iphone4
        case iphone5
        case iphone6
        case iphone6Plus
    }
}
