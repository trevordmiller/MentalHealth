import SwiftUI
import SwiftData

struct QuestionnaireRowView: View {
    let questionnaire: Questionnaire
    
    var body: some View {
        NavigationLink {
            QuestionnaireDetailsView(questionnaire: questionnaire)
        } label: {
            HStack {
                Text(questionnaire.creationDate, format: Date.FormatStyle(date: .long, time: .shortened))
            }
        }
    }
}

#Preview {
    NavigationStack {
        List {
            let questionnaire = Questionnaire(
                questions: Questions(
                    interest: .sometimes,
                    hope: .often,
                    sleep: .often,
                    energy: .often,
                    appetite: .sometimes,
                    expectations: .sometimes,
                    concentration: .sometimes,
                    speed: .none,
                    harm: .sometimes
                )
            )
            
            QuestionnaireRowView(questionnaire: questionnaire)
                .modelContainer(for: Questionnaire.self, inMemory: true)
        }
    }
}
