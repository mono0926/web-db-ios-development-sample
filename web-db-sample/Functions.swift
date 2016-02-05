//
//  Functions.swift
//  web-db-sample
//
//  Created by mono on 12/29/15.
//  Copyright © 2015 mono. All rights reserved.
//

import Foundation

func dispatchOnMainThread(delay delay: NSTimeInterval = 0, block: () -> ()) {
    if delay == 0 {
        dispatch_async(dispatch_get_main_queue()) {
            block()
        }
        return
    }
    
    let d = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    dispatch_after(d, dispatch_get_main_queue()) {
        block()
    }
}