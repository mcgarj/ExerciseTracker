import SwiftUI

struct ProfileView: View {
    let goals = ["Gain muscle mass", "Lose weight", "Tone up"]
    @State private var selectedGoal = "Tone up"
    
    var body: some View {
        // MARK: Store user info in CoreData - make new User entity? Use plist instead?
        // MARK: Once user info has been saved, display in form here
        List {
            Text("Name: Frodo Baggins")
            Text("Age: 33")
            Text("Height: 124 cm")
            Text("Weight: 45 kg")
            Text("Gender: Male")
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
