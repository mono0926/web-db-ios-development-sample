//
//  TouchListViewController.swift
//  web-db-sample
//
//  Created by mono on 12/6/15.
//  Copyright © 2015 mono. All rights reserved.
//

import Foundation
import UIKit

class TouchCell: UITableViewCell {
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func set(dog dog: Dog) {
        thumbnailView.image = dog.image
        titleLabel.text = dog.name
    }
}

class TouchListViewController: UITableViewController {
    private var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Peek・Pop"
        tableView.registerNib(UINib(nibName: "TouchCell", bundle: nil), forCellReuseIdentifier: "TouchCell")
        registerForPreviewingWithDelegate(self, sourceView: view)
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
        navigateToDetail(indexPath.row)
    }
    
    /**
     詳細画面へ遷移
     
     - parameter index: データのindex
     */
    private func navigateToDetail(index: Int) {
        let vc = storyboard!.instantiateViewControllerWithIdentifier("Detail") as! TouchDetailViewController
        vc.set(dog: Dog(index: index))
        navigationController!.pushViewController(vc, animated: true)
    }
}

extension TouchListViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = tableView.indexPathForRowAtPoint(location) else {
            return nil
        }
        previewingContext.sourceRect = tableView.rectForRowAtIndexPath(indexPath)
        let previewingViewController = storyboard!.instantiateViewControllerWithIdentifier("Preview") as! TouchPreviewVIewController
        currentIndex = indexPath.row
        previewingViewController.set(dog: Dog(index: currentIndex))
        return previewingViewController
    }
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        navigateToDetail(currentIndex)
    }
    
}