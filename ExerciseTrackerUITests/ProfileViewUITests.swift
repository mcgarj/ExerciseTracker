import XCTest

final class ProfileViewUITests: XCTestCase {
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

    func test_ProfileView_defaultValues() throws {
        app.tabBars.buttons.element(boundBy: 1).tap()
        XCTAssertEqual(app.cells.count, 6, "There should be 6 rows")
    }

    func test_ProfileView_userEnterInfo() throws {
        app.tabBars.buttons.element(boundBy: 1).tap()
        let userNameField = app.textFields["user-name"]
        let userAgeField = app.textFields["user-age"]
        let userHeightField = app.textFields["user-height"]
        let userWeightField = app.textFields["user-weight"]
        let userGenderField = app.textFields["user-gender"]

        userNameField.tap()
        userNameField.typeText("Bilbo Baggins")

        XCTAssertEqual(userNameField.value as! String, "Bilbo Baggins")
        XCTAssert(userAgeField.exists)
        XCTAssert(userHeightField.exists)
        XCTAssert(userWeightField.exists)

        userGenderField.tap()
        userGenderField.typeText("Prefer not to say")
        XCTAssertEqual(userGenderField.value as! String, "Prefer not to say")
    }
}
