import CoreData
import Foundation

final class EditExerciseViewModel: ObservableObject {
    @Published var exercise: Exercise
    private let context: NSManagedObjectContext

    let isNew: Bool

    init(provider: DataController, exercise: Exercise? = nil) {
        self.context = provider.newContext
        if let exercise,
           let existingExerciseCopy = try? context.existingObject(with: exercise.objectID) as? Exercise {
            self.exercise = existingExerciseCopy
            self.isNew = false
        } else {
            self.exercise = Exercise(context: self.context)
            self.isNew = true
        }
    }

    func save() throws {
        if context.hasChanges {
            try context.save()
        }
    }
}
