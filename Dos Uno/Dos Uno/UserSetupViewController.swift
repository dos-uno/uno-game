//
//  UserSetupViewController.swift
//  Dos Uno
//
//  Created by Rachael Worthington on 5/3/16.
//  Copyright © 2016 Purplellamas. All rights reserved.
//

import UIKit

class UserSetupViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC = segue.destinationViewController as! GameViewController
        destVC.user.name = userName.text ?? "player 1"
    }
}