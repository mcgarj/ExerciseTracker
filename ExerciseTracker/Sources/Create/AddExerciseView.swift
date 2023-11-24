import SwiftUI
import SwiftData

struct AddExerciseView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: EditExerciseViewModel

    let categories = ["Upper body", "Lower body", "Cardio", "Core", "Mobility/Stretching"]

    var body: some View {
        Form {
            TextField("Name", text: $viewModel.exercise.name)
                .accessibilityIdentifier("exerciseName")
            Picker("Category", selection: $viewModel.exercise.category) {
                ForEach(categories, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)
            .accessibilityIdentifier("categoryPicker")

            Section {
                HStack {
                    Text("Reps: ")
                    TextField("Reps", value: $viewModel.exercise.reps, format: .number )
                        .keyboardType(.numberPad)
                        .accessibilityIdentifier("repTextField")
                }
                HStack {
                    Text("Weight (kg):")
                    TextField("Weight", value: $viewModel.exercise.weight, format: .number)
                        .keyboardType(.numberPad)
                        .accessibilityIdentifier("weightTextField")
                }

            }
        }
        .navigationTitle(viewModel.isNew ? "Add Exercise" : "Update Exercise")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    do {
                        try viewModel.save()
                        dismiss()
                    } catch {
                        print(error)
                    }
                }
            }

            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
}
