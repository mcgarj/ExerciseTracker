//
//  ExerciseRowView.swift
//  ExerciseTracker
//
//  Created by Joe McGarry on 24/11/2023.
//

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
            VStack {
                Text("Reps: \(exercise.reps)")
                Text("Weight: \(exercise.weight)")
            }
        }
    }
}

private extension ExerciseRowView {

}

//#Preview {
//    ExerciseRowView()
//}
