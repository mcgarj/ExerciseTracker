//
//  ExerciseRowView.swift
//  ExerciseTracker
//
//  Created by Joe McGarry on 24/11/2023.
//

import SwiftUI

struct ExerciseRowView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Title")
                    .font(.headline)
                Text("Category")
            }
            VStack {
                Text("Reps: ")
                Text("Weight: ")
            }
        }
    }
}

#Preview {
    ExerciseRowView()
}
