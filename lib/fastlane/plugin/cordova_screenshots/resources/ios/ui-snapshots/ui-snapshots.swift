//
//  ui_snapshots.swift
//  ui-snapshots
//
//  Created by Chris Starkey on 06/08/2020.
//
//

import XCTest

class ui_snapshots: XCTestCase {

    override func setUp() {
        super.setUp()

        let app = XCUIApplication()

        setupSnapshot(app)

        app.launch()

    }

    override func tearDown() {
        super.tearDown()
    }

    func testSnapshots() {
          XCUIApplication().launch()
          sleep(5)
          if XCUIApplication().buttons["Allow"].exists{
               XCUIApplication().buttons["Allow"].tap()
          }
          XCUIApplication().buttons["Menu"].tap()
          sleep(5)
          XCUIApplication().buttons["SIGN IN"].tap()
          sleep(5)
          snapshot("1SignIn")
          XCUIApplication().buttons["Close"].tap()
          sleep(5)
          snapshot("2Auctions")
          let viewAuctionQuery = XCUIApplication().buttons.matching(identifier: "VIEW AUCTION")
          if viewAuctionQuery.count > 0 {
            let firstButton = viewAuctionQuery.element(boundBy: 0)
            firstButton.tap()
          }
          else{
            XCUIApplication().buttons["VIEW AUCTION"].tap()
          }
          sleep(5)
          snapshot("3Catalog")
    }
  }

