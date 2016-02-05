//
//  WebDbSampleUITests.swift
//  WebDbSampleUITests
//
//  Created by OnoMasayuki on 1/11/16.
//  Copyright © 2016 mono. All rights reserved.
//

import XCTest

class WebDbSampleUITests: XCTestCase {
    
    // テストケース実行前に毎回呼ばれる
    override func setUp() {
        super.setUp()
        // 失敗してもテストを継続するか(false→中断する)
        continueAfterFailure = false
        // UIテストはアプリが起動している必要があるのでsetup内で必須な処理
        XCUIApplication().launch()
    }
    
    // テストケース実行後に毎回呼ばれる
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        // アプリのインスタンス取得
        let app = XCUIApplication()
        // 要素のクエリー・操作
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Search APIs"].tap()
        // 検証
        XCTAssertEqual(tablesQuery.cells.count, 10)
    }
    
}
