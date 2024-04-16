import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            QuestionnairesView()
                .tabItem {
                    Label("Questionnaires", systemImage: "list.bullet.clipboard")
                }
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "chart.xyaxis.line")
                }
            
            AboutView()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
