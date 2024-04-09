import SwiftUI
import SwiftData

struct QuestionnairesListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var questionnaires: [Questionnaire]
    
    @State private var isAdding = false
    
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
        .sheet(isPresented: $isAdding) {
            QuestionnairesAddView()
        }
    }
    
    private func addQuestionnaire() {
        isAdding = true
    }
    
    private func deleteQuestionnaires(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                let questionnaire = questionnaires[index]
                modelContext.delete(questionnaire)
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
