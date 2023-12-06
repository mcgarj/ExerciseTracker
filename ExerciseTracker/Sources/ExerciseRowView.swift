import SwiftUI

struct ExerciseRowView: View {
    @Environment(\.managedObjectContext) private var moc
    @ObservedObject var exercise: Exercise

    var body: some View {
        HStack {
            VStack {
                Text(exercise.name)
                    .font(.headline)
                Text(exercise.category)
            }
            .padding()
            VStack {
                Text("Reps: \(exercise.reps)")
                Text("Weight: \(exercise.weight, specifier: "%.2f") kg")
            }
            .padding()
        }
    }
}

private extension ExerciseRowView {

}

//#Preview {
//    ExerciseRowView()
//}
