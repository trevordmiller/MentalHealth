import SwiftUI
import SwiftData

struct QuestionnairesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var questionnaires: [Questionnaire]
    
    var body: some View {
        NavigationSplitView {
            if questionnaires.isEmpty {
                QuestionnairesEmptyView()
            } else {
                QuestionnairesListView()
            }
        } detail: {
            Text("Select a questionnaire")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
