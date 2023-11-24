import SwiftUI

struct HomeView: View {
    @FetchRequest(fetchRequest: Exercise.all()) private var exercises

    @State private var showingAddScreen = false

    var provider = DataController.shared

    var body: some View {
        NavigationView {
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

                                } label: {
                                    Label("Edit", systemImage: "pencil")
                                }
                                .tint(.orange)
                            }
                    }
                }
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
                NavigationView {
                    AddExerciseView(viewModel: .init(provider: provider))
                }
            }
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
