import CoreData
import Foundation

final class EditExerciseViewModel: ObservableObject {
    
    @Published var exercise: Exercise

    private let context: NSManagedObjectContext

    init(provider: DataController, exercise: Exercise? = nil) {
        self.context = provider.newContext
        self.exercise = Exercise(context: self.context)
    }

    func save() throws {
        if context.hasChanges {
            try context.save()
        }
    }
}
