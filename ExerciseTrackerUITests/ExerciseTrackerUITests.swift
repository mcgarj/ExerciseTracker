import XCTest

final class ExerciseTrackerUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }

    func test_AppStartsEmpty() throws {
        XCTAssertEqual(app.cells.count, 0, "There should be 0 exercises when the app is first launched")
    }

    func test_AppAddingExercise() throws {
        app.buttons["Add Exercise"].tap()

        let exerciseNameField = app.textFields["exerciseName"]
        exerciseNameField.tap()
        exerciseNameField.typeText("Example")
        
        app.buttons["doneButton"].tap()

        XCTAssertEqual(app.cells.count, 1, "There should be 1 exercise after adding test data")
    }

    func test_DeletingExercise() throws {
        app.buttons["Add Exercise"].tap()

        let exerciseNameField = app.textFields["exerciseName"]
        exerciseNameField.tap()
        exerciseNameField.typeText("Example")

        app.buttons["doneButton"].tap()

        app.staticTexts["Example"].swipeLeft(velocity: XCUIGestureVelocity.slow)
        app.buttons["Delete"].tap()
        XCTAssertEqual(app.cells.count, 0, "There shouldn't be any exercises in the list")
    }

    func test_EditExercise() throws {
        app.buttons["Add Exercise"].tap()

        let exerciseNameField = app.textFields["exerciseName"]
        exerciseNameField.tap()
        exerciseNameField.typeText("Example")

        app.buttons["doneButton"].tap()

        app.staticTexts["Example"].swipeLeft(velocity: XCUIGestureVelocity.slow)
        app.buttons["Edit"].tap()

        exerciseNameField.tap()
        exerciseNameField.typeText(" Changed")
        app.buttons["doneButton"].tap()
        XCTAssertEqual(app.cells.count, 1, "There should be 1 exercise after adding test data")
    }

    func test_ExerciseDetailView() throws {
        app.buttons["Add Exercise"].tap()

        let exerciseNameField = app.textFields["exerciseName"]
        exerciseNameField.tap()
        exerciseNameField.typeText("Example")

        app.buttons["doneButton"].tap()
        app.staticTexts["Example"].tap()

        XCTAssertEqual(app.cells.count, 4, "There should be 4 pieces of data shown")

    }

}
