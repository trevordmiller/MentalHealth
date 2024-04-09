import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var questionnaires: [Questionnaire]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(questionnaires) { questionnaire in
                    NavigationLink {
                        Text("Questionnaire at \(questionnaire.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(questionnaire.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteQuestionnaires)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addQuestionnaire) {
                        Label("Add Questionnaire", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select A Questionnaire")
        }
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
    ContentView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
