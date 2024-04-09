import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        QuestionnairesView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
