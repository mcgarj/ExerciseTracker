import SwiftUI
import SwiftData

struct AddEditExerciseView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var date = ""
    @State private var category = ""
    @State private var reps: Int16? = 0
    @State private var weight: Double? = 0.0
    @State private var distance: Double? = 0.0
    @State private var duration: Double? = 0.0
    @State private var newExercise = false

    let categories = ["Upper body", "Lower body", "Cardio", "Core", "Mobility/Stretching"]
    let exercise: Exercise? // prevents nil being passed if new exercise

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
                    if newExercise {
                        let newExercise = Exercise(context: moc)
                        newExercise.id = UUID()
                        newExercise.name = name
                        newExercise.category = category
                        newExercise.reps = reps ?? 0
                        newExercise.weight = weight ?? 0.0
                        newExercise.distance = distance ?? 0.0
                        newExercise.duration = duration ?? 0.0
                    } else {
                        exercise?.name = name
                        exercise?.category = category
                        exercise?.reps = reps ?? 0
                        exercise?.weight = weight ?? 0.0
                        exercise?.distance = distance ?? 0.0
                        exercise?.duration = duration ?? 0.0
                    }


                    try? moc.save()
                    dismiss()
                }
            }
        }
        .navigationTitle((newExercise ? "Add Exercise" : exercise?.name ?? "Unknown exercise"))
    }
}
