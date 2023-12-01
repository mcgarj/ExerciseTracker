import SwiftUI

struct ExerciseDetailView: View {
    let exercise: Exercise

    var body: some View {
        List {
            Text(exercise.name)
                .accessibilityIdentifier("exerciseName")
            Text(exercise.category)
            .accessibilityIdentifier("category")

            Section {
                HStack {
                    Text("Reps: \(exercise.reps)")
                        .accessibilityIdentifier("reps")
                }
                HStack {
                    Text("Weight (kg): \(exercise.weight)")
                        .accessibilityIdentifier("weightText")
                }

            }
        }
        .navigationTitle(exercise.name)
    }
}

//#Preview {
//    NavigationView {
//        ExerciseDetailView()
//    }
//}
