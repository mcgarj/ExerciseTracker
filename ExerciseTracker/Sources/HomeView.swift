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
                    }
                }
//                .onDelete(perform: deleteExercise)
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

//    func deleteExercise(at offsets: IndexSet) {
//        for index in offsets {
//            let exercise = exercises[index]
//            moc.delete(exercise)
//        }
//        do {
//            try? moc.save()
//        } catch {
//            fatalError("Failed to save Core Data")
//        }
//    }
}

#Preview {
    HomeView()
}
