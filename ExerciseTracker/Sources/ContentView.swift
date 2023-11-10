import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var exercises: [Exercise]

    var body: some View {
        NavigationStack {
            List {
                ForEach(exercises) { exercise in
                    VStack {
                        Text(exercise.name)
                            .font(.headline)
                        Text(exercise.category[0])
                        Text("Reps: \(exercise.reps!)")
                        Text("Weight: \(exercise.weight!)")
                    }
                }
            }
            .navigationTitle("Exercise Tracker")
            .toolbar {
                Button("Add Exercise", action: addExercise)
            }
        }
    }

    func addExercise() {
        let chestPress = Exercise(name: "Chest Press", category: ["upper body"], reps: 10, weight: 25)
        let shoulderPress = Exercise(name: "Shoulder Press", category: ["upper body"], reps: 8, weight: 12.5)
        let squats = Exercise(name: "Squats", category: ["lower body"], reps: 10, weight: 50)

        modelContext.insert(chestPress)
        modelContext.insert(shoulderPress)
        modelContext.insert(squats)
    }
}

#Preview {
    ContentView()
}
