//
//  CVViewController.swift
//  My CV
//
//  Created by Maxim  Grozniy on 02.05.16.
//  Copyright © 2016 Maxim  Grozniy. All rights reserved.
//

import UIKit

class CVViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var bottomLine: NSLayoutConstraint!
    
    var isUp: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        createUpDownGestures()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CVViewController.keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CVViewController.keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func adjustingHeight(show:Bool, notification:NSNotification) {
        // 1
        var userInfo = notification.userInfo!
        // 2
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        // 3
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        // 4
        let changeInHeight = (CGRectGetHeight(keyboardFrame) + 40) * (show ? 1 : -1)
        //5
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            if show {
                self.bottomLine.constant += changeInHeight
            } else {
                self.bottomLine.constant = 20
            }
            
        })
        
    }
    
    func keyboardWillShow(notification:NSNotification) {
        if isUp {return}
        adjustingHeight(true, notification: notification)
        isUp = true
    }
    
    func keyboardWillHide(notification:NSNotification) {
        adjustingHeight(false, notification: notification)
        isUp = false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
