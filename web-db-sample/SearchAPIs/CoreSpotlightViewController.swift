//
//  CoreSpotlightViewController.swift
//  web-db-sample
//
//  Created by mono on 12/6/15.
//  Copyright © 2015 mono. All rights reserved.
//

import Foundation
import UIKit
import CoreSpotlight
import MobileCoreServices
import SVProgressHUD

class CoreSpotlightViewController: UITableViewController {
    private var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search API"
        tableView.registerNib(UINib(nibName: "TouchCell", bundle: nil), forCellReuseIdentifier: "TouchCell")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TouchCell", forIndexPath: indexPath) as! TouchCell
        cell.set(dog: Dog(index: indexPath.row))
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        registerToCoreSpotlight(indexPath.row)
    }
    
    private func registerToCoreSpotlight(index: Int) {
        let dog = Dog(index: index)
        let set = CSSearchableItemAttributeSet(itemContentType: String(kUTTypeImage))
        set.title = dog.name
        set.contentDescription = "name: \(dog.name)"
        set.keywords = ["dog", "line", "stamp"]
        set.thumbnailData = UIImageJPEGRepresentation(dog.image, 1)
        let item = CSSearchableItem(uniqueIdentifier: "com.mono0926:\(dog.name)", domainIdentifier: "dog", attributeSet: set)
        CSSearchableIndex.defaultSearchableIndex().indexSearchableItems([item]) { error in
            assert(error == nil)
            dispatchOnMainThread {
                SVProgressHUD.showSuccessWithStatus("Registered: \(dog.name)")
            }
        }
    }
}