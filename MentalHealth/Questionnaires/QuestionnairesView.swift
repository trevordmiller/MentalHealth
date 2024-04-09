import SwiftUI
import SwiftData

struct QuestionnairesView: View {
    var body: some View {
        NavigationSplitView {
            QuestionnairesListView()
        } detail: {
            Text("Select a questionnaire")
        }
    }
}

#Preview {
    QuestionnairesView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
