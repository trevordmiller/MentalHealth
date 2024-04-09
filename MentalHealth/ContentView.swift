import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            QuestionnairesView()
                .tabItem {
                    Label("Questionnaires", systemImage: "list.bullet.clipboard")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
