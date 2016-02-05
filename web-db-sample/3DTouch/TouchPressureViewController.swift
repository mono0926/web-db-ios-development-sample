//
//  TouchPressureViewController.swift
//  web-db-sample
//
//  Created by mono on 12/13/15.
//  Copyright © 2015 mono. All rights reserved.
//

import Foundation
import UIKit

class TouchPressureViewController: UIViewController {
    @IBOutlet weak var pressureLabel: UILabel!
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        switch traitCollection.forceTouchCapability {
        case .Unavailable, .Unknown:
            print("3D Touchが利用出来ません")
            return
        case .Available:
            break
        }
        guard let touch = touches.first else {
            return
        }
        let ratio = touch.force / touch.maximumPossibleForce
        print("ratio: \(ratio)")
        pressureLabel.text = "プレッシャー: \(ratio)"
    }
}