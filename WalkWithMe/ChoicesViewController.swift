//
//  ChoicesViewController.swift
//  WalkWithMe
//
//  Created by yangwenke on 04/06/2016.
//  Copyright © 2016 Wenke Yang. All rights reserved.
//

import UIKit

var choice1 = 0//between tag = [1,2,3] relate to speed
var choice2 = 0//between tag = [4,5] disable TO if tag = 4
var choice3 = 0//between tag = [6,7]


class ChoicesViewController: UIViewController{
    
   
    @IBOutlet weak var walk: UIButton!
    @IBOutlet weak var cycle: UIButton!
    @IBOutlet weak var run: UIButton!
    
    @IBOutlet weak var round: UIButton!
    @IBOutlet weak var oneway: UIButton!
    
    @IBOutlet weak var fixed_end: UIButton!
    @IBOutlet weak var fixed_time: UIButton!
    

    @IBOutlet weak var goto_step2: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func clicked(sender: UIButton) {
        
        switch sender.tag {
        case 1:
            clearClickedImage(choice1)
            choice1 = 1
        case 2:
            clearClickedImage(choice1)
            choice1 = 2
        case 3:
            clearClickedImage(choice1)
            choice1 = 3
        case 4:
            clearClickedImage(choice2)
            choice2 = 4
        case 5:
            clearClickedImage(choice2)
            choice2 = 5
        case 6:
            clearClickedImage(choice3)
            choice3 = 6
        case 7:
            clearClickedImage(choice3)
            choice3 = 7
        default:
            print("error")
        }
        clickedImage(sender)
    }
    
    func clickedImage(sender:UIButton) {
        sender.setBackgroundImage(UIImage(named: "selected.png"), forState: .Normal)
        if (choice1 > 0 && choice2 > 0 && choice3 > 0) {
            goto_step2.enabled = true
        }
    }
    
    func clearClickedImage(tag:Int) {
        if (tag > 0) {
            if let button = self.view.viewWithTag(tag) as? UIButton {
                button.setBackgroundImage(nil, forState: .Normal)
            }
        }
    }
    
}


