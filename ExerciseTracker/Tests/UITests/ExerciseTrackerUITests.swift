//
//  ExerciseTrackerUITests.swift
//  ExerciseTrackerUITests
//
//  Created by Joe McGarry on 10/11/2023.
//

import XCTest

final class ExerciseTrackerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppStartsEmpty() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertEqual(app.cells.count, 0, "There should be 0 exercises when the app is first launched")
    }

    
}
