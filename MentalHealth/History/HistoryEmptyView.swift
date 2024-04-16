import SwiftUI
import SwiftData

struct HistoryEmptyView: View {
    var body: some View {
        ContentUnavailableView {
            Label("No History", systemImage: "chart.xyaxis.line")
        } description: {
            Text("There isn't enough data yet.")
        }
    }
}

#Preview {
    HistoryEmptyView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
