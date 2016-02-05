//
//  TouchDetailViewController.swift
//  web-db-sample
//
//  Created by mono on 12/6/15.
//  Copyright © 2015 mono. All rights reserved.
//

import Foundation
import UIKit

class TouchDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    private var dog: Dog!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = dog.name
        imageView.image = dog.image
        titleLabel.text = dog.name
    }
    
    func set(dog dog: Dog) {
        self.dog = dog
    }
}