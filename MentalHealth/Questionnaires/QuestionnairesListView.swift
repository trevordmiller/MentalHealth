import SwiftUI
import SwiftData

struct QuestionnairesListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var questionnaires: [Questionnaire]
    
    var body: some View {
        Group {
            if questionnaires.isEmpty {
                QuestionnairesEmptyView()
            } else {
                List {
                    ForEach(questionnaires) { questionnaire in
                        NavigationLink {
                            Text("Questionnaire at \(questionnaire.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        } label: {
                            Text(questionnaire.timestamp, format: Date.FormatStyle(date: .long, time: .shortened))
                        }
                    }
                    .onDelete(perform: deleteQuestionnaires)
                }
            }
        }
        .toolbar {
#if os(iOS)
            if !questionnaires.isEmpty {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
#endif
            ToolbarItem {
                Button(action: addQuestionnaire) {
                    Label("Add a questionnaire", systemImage: "plus")
                }
            }
        }
        .navigationTitle("Questionnaires")
    }
    
    private func addQuestionnaire() {
        withAnimation {
            let newQuestionnaire = Questionnaire(timestamp: Date())
            modelContext.insert(newQuestionnaire)
        }
    }
    
    private func deleteQuestionnaires(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(questionnaires[index])
            }
        }
    }
}

#Preview {
    NavigationStack {
        QuestionnairesListView()
            .modelContainer(for: Questionnaire.self, inMemory: true)
    }
}
