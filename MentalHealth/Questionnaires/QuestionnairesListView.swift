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
                        NavigationLink {
                            Text("Questionnaire at \(questionnaire.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        } label: {
                            Text(questionnaire.timestamp, format: Date.FormatStyle(date: .long, time: .shortened))
                        }
                    }
                    .onDelete(perform: confirmDelete)
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
                Button(action: add) {
                    Label("Add a questionnaire", systemImage: "plus")
                }
            }
        }
        .navigationTitle("Questionnaires")
        .sheet(isPresented: $isAdding) {
            QuestionnairesAddView()
        }
        .confirmationDialog("Delete", isPresented: $isConfirmingDelete) {
            Button(role: .destructive, action: delete) {
                Label("Delete", systemImage: "trash")
            }
            
            Button(role: .cancel, action: cancelDelete) {
                Label("Cancel", systemImage: "xmark")
            }
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
        isConfirmingDelete = false
        pendingDelete = []
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
