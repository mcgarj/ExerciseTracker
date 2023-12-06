import SwiftUI

struct HomeView: View {
    @FetchRequest(fetchRequest: Exercise.all()) private var exercises
    @State private var exerciseToEdit: Exercise?

    var provider = DataController.shared

    var body: some View {
        NavigationView {
            ZStack {
                if exercises.isEmpty {
                    NoExerciseView()
                } else {
                    List {
                        ForEach(exercises) { exercise in
                            NavigationLink {
                                ExerciseDetailView(exercise: exercise)
                            } label: {
                                ExerciseRowView(exercise: exercise)
                                    .swipeActions(allowsFullSwipe: true) {
                                        Button(role: .destructive) {
                                            do {
                                                try delete(exercise)
                                            } catch {
                                                print(error)
                                            }
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                        .tint(.red)

                                        Button {
                                            exerciseToEdit = exercise
                                        } label: {
                                            Label("Edit", systemImage: "pencil")
                                        }
                                        .tint(.orange)
                                    }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Exercise Tracker")
            .toolbar {
                Button {
                    exerciseToEdit = .empty(context: provider.newContext)
                } label: {
                    Label("Add Exercise", systemImage: "plus")
                }
            }
            .sheet(item: $exerciseToEdit, onDismiss: {
                exerciseToEdit = nil
            }, content: { exercise in
                NavigationView {
                    AddExerciseView(viewModel: .init(provider: provider,
                                                     exercise: exercise))
                }
            })
        }
    }

}

extension HomeView {

    func delete(_ exercise: Exercise) throws {
        let context = provider.viewContext
        let existingExercise =  try context.existingObject(with: exercise.objectID)
        context.delete(existingExercise)
        Task(priority: .background) {
            try await context.perform {
                try context.save()
            }
        }
    }
}

#Preview {
    HomeView()
}
