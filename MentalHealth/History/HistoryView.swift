import SwiftUI
import SwiftData
import Charts

struct HistoryView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var questionnaires: [Questionnaire]
    
    var body: some View {
        NavigationStack {
            Group {
                if questionnaires.isEmpty {
                    HistoryEmptyView()
                } else {
                    Chart {
                        ForEach(questionnaires) { questionnaire in
                            LineMark(
                                x: .value("Date", questionnaire.creationDate),
                                y: .value("Total", Score(questionnaire: questionnaire).total)
                            )
                        }
                    }
                    .padding()
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
