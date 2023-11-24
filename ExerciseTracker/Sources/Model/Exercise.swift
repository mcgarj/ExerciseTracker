import CoreData
import Foundation

// This class is to manually manage the Entity in CoreData

final class Exercise: NSManagedObject {

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
