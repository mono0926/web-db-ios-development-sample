//
//  TouchPreviewVIewController.swift
//  web-db-sample
//
//  Created by mono on 12/6/15.
//  Copyright © 2015 mono. All rights reserved.
//

import Foundation
import UIKit

class TouchPreviewVIewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    private var dog: Dog!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = dog.image
    }
    
    func set(dog dog: Dog) {
        self.dog = dog
    }
    
    @available(iOS 9.0, *)
    override func previewActionItems() -> [UIPreviewActionItem] {
        let item = UIPreviewAction(title: "タイトル", style: UIPreviewActionStyle.Default) { action, vc in
            
        }
        return [item]
    }
}