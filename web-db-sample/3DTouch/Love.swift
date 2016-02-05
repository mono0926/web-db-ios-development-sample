//
//  Love.swift
//  web-db-sample
//
//  Created by mono on 12/6/15.
//  Copyright © 2015 mono. All rights reserved.
//

import Foundation
import UIKit

struct Dog {
    let name: String
    let image: UIImage
    init(index: Int) {
        name = "love\(index)"
        image = UIImage(named: name)!
    }
}