import CoreData
import Foundation

// This class is to manually manage the Person Entity in CoreData

final class Person: NSManagedObject, Identifiable {

    @NSManaged var name: String
    @NSManaged var age: Int16
    @NSManaged var height: Double
    @NSManaged var weight: Double
    @NSManaged var gender: String
    @NSManaged var goal: String
}

extension Person {
    private static var personFetchRequest: NSFetchRequest<Person> {
        NSFetchRequest(entityName: "Person")
    }

    static func all() -> NSFetchRequest<Person> {
        let request: NSFetchRequest<Person> = personFetchRequest
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Person.name, ascending: true)
        ]
        return request
    }

    static func empty(context: NSManagedObjectContext = DataController.shared.viewContext) -> Person {
        return Person(context: context)
    }
}
