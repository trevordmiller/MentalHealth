import SwiftUI
import SwiftData

struct QuestionnairesView: View {
    var body: some View {
        NavigationSplitView {
            QuestionnairesListView()
        } detail: {
            Text("Select A Questionnaire")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
