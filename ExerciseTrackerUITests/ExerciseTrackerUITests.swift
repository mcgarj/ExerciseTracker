import XCTest

final class ExerciseTrackerUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }

    func testAppStartsEmpty() throws {
        XCTAssertEqual(app.cells.count, 0, "There should be 0 exercises when the app is first launched")
    }

    func testAppAddingExercise() throws {
        app.buttons["Add Exercise"].tap()

        let exerciseNameField = app.textFields["exerciseName"]
        exerciseNameField.tap()
        exerciseNameField.typeText("Example")
        
        let save = app.buttons["saveButton"]
        save.tap()

        XCTAssertEqual(app.cells.count, 1, "There should be 1 exercise after adding test data")
    }

    func testDeletingExercise() throws {
        app.buttons["Add Exercise"].tap()

        let exerciseNameField = app.textFields["exerciseName"]
        exerciseNameField.tap()
        exerciseNameField.typeText("Example")

        app.navigationBars.buttons.element(boundBy: 0).tap()

        app.staticTexts["Example"].swipeLeft(velocity: XCUIGestureVelocity.slow)
        app.buttons["Delete"].tap()
        XCTAssertEqual(app.cells.count, 0, "There shouldn't be any exercises in the list")
    }

}
