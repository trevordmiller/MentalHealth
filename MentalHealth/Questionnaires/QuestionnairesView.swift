import SwiftUI
import SwiftData

struct QuestionnairesView: View {
    var body: some View {
        NavigationSplitView {
            QuestionnairesListView()
#if os(macOS)
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
        } detail: {
            Text("Select A Questionnaire")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
