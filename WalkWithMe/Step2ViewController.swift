//
//  Step2ViewController.swift
//  WalkWithMe
//
//  Created by yangwenke on 06/06/2016.
//  Copyright © 2016 Wenke Yang. All rights reserved.
//

import UIKit

class Step2ViewController: UIViewController{

    var activeField: UITextField?
    @IBOutlet weak var scrollView: UIScrollView!
 
    @IBOutlet weak var to: UISearchBar!
    @IBOutlet weak var distanceField: UITextField!
    @IBOutlet weak var duration: UIDatePicker!
    @IBOutlet weak var tolabel: UILabel!
    @IBOutlet weak var expectedlabel: UILabel!
    @IBOutlet weak var distancelabel: UILabel!
    @IBOutlet weak var mileslabel: UILabel!
    @IBOutlet weak var durationlabel: UILabel!
    @IBOutlet weak var toimage: UIImageView!
    @IBOutlet weak var distanceimage: UIImageView!
    @IBOutlet weak var durationimage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        
        if (choice2 == 4) {
            toimage.alpha = 0.6
            tolabel.alpha = 0.6
            to.alpha = 0.6
            to.userInteractionEnabled = false
        }
        if (choice3 == 7) {
            distanceimage.alpha = 0.6
            mileslabel.alpha = 0.6
            distancelabel.alpha = 0.6
            expectedlabel.alpha = 0.6
            distancelabel.alpha = 0.6
            distanceField.alpha = 0.6
            distanceField.enabled = false
        } else {
            durationimage.alpha = 0.42
            durationlabel.alpha = 0.6
            duration.alpha = 0.6
            duration.enabled = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        deregisterFromKeyboardNotifications()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func registerForKeyboardNotifications()
    {
        //Adding notifies on keyboard appearing
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Step2ViewController.keyboardWasShown(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Step2ViewController.keyboardWillBeHidden(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
    func deregisterFromKeyboardNotifications()
    {
        //Removing notifies on keyboard appearing
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification)
    {
        //Need to calculate keyboard exact size due to Apple suggestions
        self.scrollView.scrollEnabled = true
        let info : NSDictionary = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue().size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if ((activeField) != nil)
        {
            if (!CGRectContainsPoint(aRect, activeField!.frame.origin))
            {
                self.scrollView.scrollRectToVisible(activeField!.frame, animated: true)
            }
        }
        
        
    }
    
    
    func keyboardWillBeHidden(notification: NSNotification)
    {
        //Once keyboard disappears, restore original positions
        let info : NSDictionary = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue().size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -keyboardSize!.height, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.scrollView.scrollEnabled = false
        
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField!)
    {
        activeField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField!)
    {
        activeField = nil
    }
    
}