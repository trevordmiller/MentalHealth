import SwiftUI
import SwiftData

struct HistoryView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var questionnaires: [Questionnaire]
    
    var body: some View {
        NavigationStack {
            Group {
                if questionnaires.isEmpty {
                    HistoryEmptyView()
                } else {
                    HistoryChartView(questionnaires: questionnaires)
                }
            }
            .navigationTitle("History")
        }
    }
}

#Preview {
    HistoryView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
