import SwiftUI
import SwiftData

struct EditExerciseView: View {
    @Bindable var exercise: Exercise

    var body: some View {
        Form {
            TextField("Name", text: $exercise.name)
                .accessibilityIdentifier("exerciseName")
            Picker("Category", selection: $exercise.category) {
                Text("Upper body").tag(1)
                Text("Lower body").tag(2)
                Text("Core").tag(3)
                Text("Stretching/mobility").tag(4)
                Text("Cardio").tag(5)
            }
            .pickerStyle(.menu)
            .accessibilityIdentifier("categoryPicker")

            Section {
                HStack {
                    Text("Reps: ")
                    TextField("Reps", value: $exercise.reps, format: .number )
                        .accessibilityIdentifier("repTextField")
                }
                HStack {
                    Text("Weight (kg):")
                    TextField("Weight", value: $exercise.weight, format: .number)
                        .accessibilityIdentifier("weightTextField")
                }

            }
        }
        .navigationTitle("Edit Exercise")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Exercise.self, configurations: config)

        let example = Exercise(name: "Example exericse", category: ["Area of body exercised"], reps: 10, weight: 27.5 )
        return EditExerciseView(exercise: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create a model container")
    }
}
