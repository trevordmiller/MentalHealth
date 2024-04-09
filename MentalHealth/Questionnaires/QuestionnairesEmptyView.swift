import SwiftUI
import SwiftData

struct QuestionnairesEmptyView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var questionnaires: [Questionnaire]

    var body: some View {
        ContentUnavailableView {
            Label("Questionnaires", systemImage: "list.bullet.clipboard")
        } description: {
            Text("Answer some questions to get started")
            
            Button(action: addQuestionnaire) {
                Label("Add a questionnaire", systemImage: "plus")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.extraLarge)
        }
    }

    private func addQuestionnaire() {
        withAnimation {
            let newQuestionnaire = Questionnaire(timestamp: Date())
            modelContext.insert(newQuestionnaire)
        }
    }
}

#Preview {
    QuestionnairesEmptyView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
