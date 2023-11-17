import SwiftUI

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
    @FetchRequest(sortDescriptors: []) var exercises: FetchedResults<Exercise>

    var body: some View {
        NavigationStack {
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
//                .onDelete(perform: deleteExercise)
            }
            .navigationTitle("Exercise Tracker")
            .toolbar {
                Button("Add Exercise", systemImage: "plus", action: addExercise)
            }
        }
    }

    func addExercise() {
        let exercise = Exercise()
        try? modelContext.save()
    }
//
//    func deleteExercise(_ indexSet: IndexSet) {
//        for index in indexSet {
//            let exercise = exercises[index]
//            modelContext.delete(exercise)
//        }
//    }
}

#Preview {
    HomeView()
}
