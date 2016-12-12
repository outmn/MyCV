//
//  PersonalViewController.swift
//  My CV
//
//  Created by Maxim  Grozniy on 02.05.16.
//  Copyright © 2016 Maxim  Grozniy. All rights reserved.
//

import UIKit

class PersonalViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var middlename: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUpDownGestures()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(PersonalViewController.keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(PersonalViewController.keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
