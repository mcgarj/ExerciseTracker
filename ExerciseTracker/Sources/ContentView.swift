import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var exercises: [Exercise]
    @State private var path = [Exercise]()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(exercises) { exercise in
                    NavigationLink(value: exercise) {
                        VStack {
                            Text(exercise.name)
                                .font(.headline)
                            Text(exercise.category[0])
                            Text("Reps: \(exercise.reps ?? 0)")
                            Text("Weight: \(exercise.weight ?? 0.0)")
                        }
                    }
                }
                .onDelete(perform: deleteExercise)
            }
            .navigationTitle("Exercise Tracker")
            .navigationDestination(for: Exercise.self, destination: EditExerciseView.init)
            .toolbar {
                Button("Add Exercise", systemImage: "plus", action: addExercise)
            }
        }
    }

    func addExercise() {
        let exercise = Exercise()
        modelContext.insert(exercise)
        path = [exercise]
    }

    func deleteExercise(_ indexSet: IndexSet) {
        for index in indexSet {
            let exercise = exercises[index]
            modelContext.delete(exercise)
        }
    }
}

#Preview {
    ContentView()
}
