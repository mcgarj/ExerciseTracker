@testable import ExerciseTracker
import XCTest

final class ExerciseTrackerUnitTests: XCTestCase {

    private var dataController: DataController!

    override func setUp() {
        dataController = .shared
    }

    override func tearDown()  {
        dataController = nil
    }

    func testExerciseIsEmpty() {
        let exercise = Exercise.empty(context: dataController.viewContext)
        XCTAssertEqual(exercise.name, "")
        XCTAssertEqual(exercise.category, "")
        XCTAssertEqual(exercise.reps, 0)
        XCTAssertEqual(exercise.weight, 0)
        XCTAssertEqual(exercise.distance, 0)
        XCTAssertEqual(exercise.duration, 0)
        XCTAssertTrue(Calendar.current.isDateInToday(exercise.date))
    }

    func testExerciseIsValid() {

    }

    func testExerciseIsNotValid() {

    }

}
