import SwiftUI
import SwiftData

struct QuestionnaireRowView: View {
    let questionnaire: Questionnaire
    
    var body: some View {
        NavigationLink {
            Text("Questionnaire at \(questionnaire.creationDate, format: Date.FormatStyle(date: .numeric, time: .standard))")
        } label: {
            Text(questionnaire.creationDate, format: Date.FormatStyle(date: .long, time: .shortened))
        }
    }
}

#Preview {
    NavigationStack {
        List {
            QuestionnaireRowView(questionnaire: Questionnaire(
                questions: Questions(
                    interest: .sometimes,
                    hope: .sometimes,
                    sleep: .sometimes,
                    energy: .sometimes,
                    appetite: .sometimes,
                    expectations: .sometimes,
                    concentration: .sometimes,
                    speed: .sometimes,
                    harm: .sometimes
                )
            ))
            .modelContainer(for: Questionnaire.self, inMemory: true)
        }
    }
}
