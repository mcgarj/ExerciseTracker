import Foundation
import SwiftData

@Model
class Exercise {
    var name: String
    var category: [String]
    var date: Date
    var reps: Int?
    var weight: Double?
    var distance: Double?
    var timeTaken: Int?

    init(name: String = "",
         category: [String] = [""],
         date: Date = .now,
         reps: Int? = nil,
         weight: Double? = nil,
         distance: Double? = nil,
         timeTaken: Int? = nil) {

        self.name = name
        self.category = category
        self.date = date
        self.reps = reps
        self.weight = weight
        self.distance = distance
        self.timeTaken = timeTaken
    }
}
