import SwiftUI
import SwiftData

struct AddExerciseView: View {
    @Environment(\.managedObjectContext) var modelContext

    @State private var name = ""
    @State private var date = ""
    @State private var category = ""
    @State private var reps: Int16? = 0
    @State private var weight: Double? = 0.0
    @State private var distance: Double? = 0.0
    @State private var duration: Double? = 0.0
    let categories = ["Upper body", "Lower body", "Cardio", "Core", "Mobility/Stretching"]

    var body: some View {
        Form {
            TextField("Name", text: $name)
                .accessibilityIdentifier("exerciseName")
            Picker("Category", selection: $category) {
                ForEach(categories, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)
            .accessibilityIdentifier("categoryPicker")

            Section {
                HStack {
                    Text("Reps: ")
                    TextField("Reps", value: $reps, format: .number )
                        .accessibilityIdentifier("repTextField")
                }
                HStack {
                    Text("Weight (kg):")
                    TextField("Weight", value: $weight, format: .number)
                        .accessibilityIdentifier("weightTextField")
                }

            }

            Section {
                Button("Save") {
                    let newExercise = Exercise(context: modelContext)
                    newExercise.id = UUID()
                    newExercise.name = name
                    newExercise.category = category
                    newExercise.reps = reps ?? 0
                    newExercise.weight = weight ?? 0.0
                    newExercise.distance = distance ?? 0.0
                    newExercise.duration = duration ?? 0.0
                }
            }
        }
        .navigationTitle("Add Exercise")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddExerciseView()
}
