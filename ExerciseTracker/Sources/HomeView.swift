import SwiftUI

struct HomeView: View {

    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Exercises", systemImage: "figure.run")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
    }
}

#Preview {
    HomeView()
}
