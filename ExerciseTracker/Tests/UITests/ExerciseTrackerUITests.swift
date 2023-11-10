//
//  ExerciseTrackerUITests.swift
//  ExerciseTrackerUITests
//
//  Created by Joe McGarry on 10/11/2023.
//

import XCTest

final class ExerciseTrackerUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppStartsEmpty() throws {
        XCTAssertEqual(app.cells.count, 0, "There should be 0 exercises when the app is first launched")
    }
    
    func testAppCreatingSamples() throws {
        app.buttons["Add Exercise"].tap()
        
        XCTAssertEqual(app.cells.count, 3, "There should be 3 sample exercises after adding sample data")
    }

    
}
