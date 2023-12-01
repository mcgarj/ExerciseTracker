import CoreData
import Foundation

// This class is to manually manage the Entity in CoreData

final class Exercise: NSManagedObject, Identifiable {

    @NSManaged var category: String
    @NSManaged var date: Date
    @NSManaged var name: String
    @NSManaged var reps: Int16
    @NSManaged var weight: Double
    @NSManaged var duration: Double
    @NSManaged var distance: Double

    override func awakeFromInsert() {
        super.awakeFromInsert()

        setPrimitiveValue(Date.now, forKey: "date")
    }
}

extension Exercise {

    private static var exercisesFetchRequest: NSFetchRequest<Exercise> {
        NSFetchRequest(entityName: "Exercise")
    }

    static func all() -> NSFetchRequest<Exercise> {
        let request: NSFetchRequest<Exercise> = exercisesFetchRequest
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Exercise.name, ascending: true)
        ]
        return request
    }

    static func empty(context: NSManagedObjectContext = DataController.shared.viewContext) -> Exercise {
        return Exercise(context: context)
    }
}
