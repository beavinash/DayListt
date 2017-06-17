//
//  Constants.swift
//  DayListt
//
//  Created by Avinash Reddy on 6/17/17.
//  Copyright © 2017 Avinash Reddy. All rights reserved.
//

import Foundation

import UIKit

let SHADOW_GRAY: CGFloat = 120.0 / 255.0

let SEGUE_ADD = "addSegue"
let SEGUE_SELECT = "selectSegue"

class Utilities {
    
    func ShowAlert (title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
        
}
