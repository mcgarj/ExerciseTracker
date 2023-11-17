import Foundation
import CoreData

class DataController: ObservableObject {
    // container uses the data model name created
    let container = NSPersistentContainer(name: "ExerciseTracker")

    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
