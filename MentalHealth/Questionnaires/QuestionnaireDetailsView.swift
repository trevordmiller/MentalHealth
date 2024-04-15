import SwiftUI
import SwiftData

struct QuestionnaireDetailsView: View {
    let questionnaire: Questionnaire
    
    var body: some View {
        VStack {
            Text(questionnaire.creationDate.formatted())
        }
        .navigationTitle(questionnaire.creationDate.formatted())
    }
}

#Preview {
    NavigationStack {
        QuestionnaireDetailsView(questionnaire: Questionnaire(
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
