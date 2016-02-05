//
//  web_db_sampleTests.swift
//  web-db-sampleTests
//
//  Created by mono on 11/3/15.
//  Copyright © 2015 mono. All rights reserved.
//

import XCTest
@testable import WebDbSample

class web_db_sampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDog() {
        let target = Dog(index: 0)
        XCTAssertEqual(target.name, "love0")
    }
    
}
