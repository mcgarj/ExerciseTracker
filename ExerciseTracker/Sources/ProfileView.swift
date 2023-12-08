import SwiftUI

struct ProfileView: View {
    let goals = ["Gain muscle mass", "Lose weight", "Tone up"]
    @State private var name: String = ""
    @State private var age: Int = 0
    @State private var height: Int = 0
    @State private var weight: Double = 0.0
    @State private var gender: String = ""
    @State private var selectedGoal = "Tone up"

    var body: some View {
        // MARK: Store user info in CoreData - make new User entity? Use plist instead?
        // MARK: Once user info has been saved, display in form here
        List {
            HStack {
                Text("Name:")
                TextField("Your name", text: $name)
                    .accessibilityIdentifier("user-name")
            }
            HStack {
                Text("Age:")
                TextField("Your age", value: $age, format: .number)
                    .accessibilityIdentifier("user-age")
            }
            HStack {
                Text("Height (cm):")
                TextField("Your height", value: $height, format: .number)
                    .accessibilityIdentifier("user-height")
            }
            HStack {
                Text("Weight (kg):")
                TextField("Your weight", value: $weight, format: .number)
                    .accessibilityIdentifier("user-weight")
            }
            HStack {
                Text("Gender:")
                TextField("Your gender", text: $gender)
                    .accessibilityIdentifier("user-gender")
            }
            Picker("Goal: ", selection: $selectedGoal) {
                ForEach(goals, id: \.self) {
                    Text($0)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
