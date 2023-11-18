import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var exercises: FetchedResults<Exercise>

    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            List {
                ForEach(exercises) { exercise in
                    VStack {
                        Text(exercise.name ?? "")
                            .font(.headline)
                        Text(exercise.category ?? "")
                        Text("Reps: \(exercise.reps)")
                        Text("Weight: \(exercise.weight)")
                    }
                }
                .onDelete(perform: deleteExercise)
            }

            .navigationTitle("Exercise Tracker")
            .toolbar {
                Button {
                    showingAddScreen.toggle()
                } label: {
                    Label("Add Exercise", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddExerciseView()
            }
        }

    }

    func deleteExercise(_ indexSet: IndexSet) {
        for index in indexSet {
            let exercise = exercises[index]
            moc.delete(exercise)
        }
    }
}

#Preview {
    HomeView()
}
