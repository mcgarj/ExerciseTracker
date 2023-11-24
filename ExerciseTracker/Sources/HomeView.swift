import SwiftUI

struct HomeView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var exercises: FetchedResults<Exercise>

    @State private var showingAddScreen = false

    var provider = DataController.shared

    var body: some View {
        NavigationView {
            List {
                ForEach(0...10, id: \.self) { exercise in
                    NavigationLink(destination: ExerciseDetailView()) {
                        EmptyView()
                    }
                    ExerciseRowView()
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
                    AddExerciseView(viewModel:.init(provider: provider))
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
