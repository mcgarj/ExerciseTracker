import SwiftUI

struct ExerciseDetailView: View {
    var body: some View {
        List {
            Text("Name")
                .accessibilityIdentifier("exerciseName")
            Text("Category")
            .accessibilityIdentifier("category")

            Section {
                HStack {
                    Text("Reps: 10")
                        .accessibilityIdentifier("reps")
                }
                HStack {
                    Text("Weight (kg): 50")
                        .accessibilityIdentifier("weightText")
                }

            }
        }
        .navigationTitle("Exercise")
    }
}

#Preview {
    NavigationView {
        ExerciseDetailView()
    }
}
