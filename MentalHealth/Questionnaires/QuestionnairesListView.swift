import SwiftUI
import SwiftData

struct QuestionnairesListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var questionnaires: [Questionnaire]
    
    @State private var isAdding = false
    @State private var isConfirmingDelete = false
    @State private var pendingDelete: [Questionnaire] = []
    
    var body: some View {
        Group {
            if questionnaires.isEmpty {
                QuestionnairesEmptyView()
            } else {
                List {
                    ForEach(questionnaires) { questionnaire in
                        QuestionnaireRowView(questionnaire: questionnaire)
                    }
                    .onDelete(perform: confirmDelete)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: add) {
                    Label("Add a questionnaire", systemImage: "plus")
                }
            }
        }
        .navigationTitle("Questionnaires")
        .sheet(isPresented: $isAdding) {
            QuestionnaireAddView()
        }
        .confirmationDialog("Delete", isPresented: $isConfirmingDelete) {
            Button("Delete", role: .destructive, action: delete)
            Button("Cancel", role: .cancel, action: cancelDelete)
        }
    }
    
    private func add() {
        isAdding = true
    }
    
    private func confirmDelete(offsets: IndexSet) {
        pendingDelete = offsets.map { questionnaires[$0] }
        isConfirmingDelete = true
    }
    
    private func cancelDelete() {
        pendingDelete = []
        isConfirmingDelete = false
    }
    
    private func delete() {
        withAnimation {
            for questionnaire in pendingDelete {
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
