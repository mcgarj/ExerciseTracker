import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var exercises: FetchedResults<Exercise>

    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            List {
                ForEach(exercises) { exercise in
                    VStack {
                        HStack {
                            VStack {
                                Text(exercise.name ?? "")
                                    .font(.headline)
                                Text(exercise.category ?? "")
                            }
                            VStack {
                                Text("Reps: \(exercise.reps)")
                                Text("Weight: \(exercise.weight)")
                            }
                        }
                    }
                }
                .onDelete(perform: deleteExercise)
            }

            .navigationTitle("Exercise Tracker")
            .toolbar {
                EditButton()
                Button {
                    showingAddScreen.toggle()
                } label: {
                    Label("Add Exercise", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddEditExerciseView(exercise: <#Exercise?#>)
            }
        }

    }

    func deleteExercise(at offsets: IndexSet) {
        for index in offsets {
            let exercise = exercises[index]
            moc.delete(exercise)
        }
        do {
            try? moc.save()
        } catch {
            fatalError("Failed to save Core Data")
        }
    }
}

#Preview {
    HomeView()
}
