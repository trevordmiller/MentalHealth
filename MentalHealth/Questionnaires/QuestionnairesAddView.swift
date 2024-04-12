import SwiftUI
import SwiftData

struct QuestionnairesAddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel", action: cancel)
                Spacer()
            }
            
            Spacer()
            
            Button(action: save) {
                Label("Save", systemImage: "plus.square.on.square")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.extraLarge)
        }
        .padding()
    }
    
    private func cancel() {
        dismiss()
    }
    
    private func save() {
        let questionnaire = Questionnaire(timestamp: Date())
        
        modelContext.insert(questionnaire)
        
        dismiss()
    }
}

#Preview {
    QuestionnairesAddView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
