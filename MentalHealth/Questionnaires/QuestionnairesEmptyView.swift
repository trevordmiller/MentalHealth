import SwiftUI
import SwiftData

struct QuestionnairesEmptyView: View {
    var body: some View {
        ContentUnavailableView {
            Label("Welcome!", systemImage: "list.bullet.clipboard")
        } description: {
            Text("Add a questionnaire to get started.")
        }
    }
}

#Preview {
    QuestionnairesEmptyView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
