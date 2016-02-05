//
//  ViewController.swift
//  web-db-sample
//
//  Created by mono on 11/3/15.
//  Copyright © 2015 mono. All rights reserved.
//

import UIKit
import SafariServices

protocol Enumerable {
    typealias Element = Self
}

extension Enumerable where Element: RawRepresentable, Element.RawValue == Int {
    static var enumerate: AnySequence<Element> {
        return AnySequence { () -> AnyGenerator<Element> in
            var i = 0
            return anyGenerator { () -> Element? in
                Element(rawValue: i++)
            }
        }
    }
    static var elements: [Element] {
        return Array(enumerate)
    }
}

private enum Section: Int, Enumerable {
    case
    ForceTouch,
    Search,
    Safari,
    Stack,
    Notification
    
    var title: String {
        switch self {
        case .ForceTouch: return "3D Touch"
        case .Search: return "Serach APIs"
        case Safari: return "SFSafariViewController"
        case .Stack: return "スタックビュー"
        case .Notification: return "通知"
        }
    }
}

private enum ForceTouchRow: Int, Enumerable {
    case
    PeekPop,
    Pressure
}

private enum SearchRow: Int, Enumerable {
    case
    CoreSportlight
}

private enum SafariRow: Int, Enumerable {
    case
    Safari
}

private enum StackRow: Int, Enumerable {
    case
    Stack
}

private enum NotificationRow: Int, Enumerable {
    case
    Local
}


class ViewController: UITableViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Section.elements.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section)! {
        case .ForceTouch: return ForceTouchRow.elements.count
        case .Search: return SearchRow.elements.count
        case .Safari: return SafariRow.elements.count
        case .Stack: return StackRow.elements.count
        case .Notification: return NotificationRow.elements.count
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch Section(rawValue: indexPath.section)! {
        case .ForceTouch:
            switch ForceTouchRow(rawValue: indexPath.row)! {
            case .PeekPop:
                let vc = UIStoryboard(name: "Touch", bundle: nil).instantiateInitialViewController()!
                navigationController!.pushViewController(vc, animated: true)
                return
            case .Pressure:
                let vc = UIStoryboard(name: "Touch", bundle: nil).instantiateViewControllerWithIdentifier("Pressure")
                navigationController!.pushViewController(vc, animated: true)
            }
        case .Search:
            let vc = UIStoryboard(name: "Search", bundle: nil).instantiateInitialViewController()!
            navigationController!.pushViewController(vc, animated: true)
            return
        case .Safari:
            let vc = SFSafariViewController(URL: NSURL(string: "http://mono0926.com")!)
            vc.delegate = self
            presentViewController(vc, animated: true, completion: nil)
        case .Stack:
            let vc = UIStoryboard(name: "Stack", bundle: nil).instantiateInitialViewController()!
            navigationController!.pushViewController(vc, animated: true)
            return
        case .Notification:
            switch NotificationRow(rawValue: indexPath.row)! {
            case .Local:
                let vc = UIStoryboard(name: "Notification", bundle: nil).instantiateInitialViewController()!
                navigationController!.pushViewController(vc, animated: true)
                return
            }
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Section(rawValue: section)!.title
    }
}

extension ViewController: SFSafariViewControllerDelegate {
    @available(iOS 9.0, *)
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        print("safariViewControllerDidFinish")
    }
    @available(iOS 9.0, *)
    func safariViewController(controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("didCompleteInitialLoad")
    }
    @available(iOS 9.0, *)
    func safariViewController(controller: SFSafariViewController, activityItemsForURL URL: NSURL, title: String?) -> [UIActivity] {
        print("activityItemsForURL")
        return []
    }
}