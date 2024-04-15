import SwiftUI
import SwiftData

struct QuestionView: View {
    let symptom: String
    
    @Binding var answer: Answer?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(symptom)
            
            Picker("Answer", selection: $answer) {
                Text("Select answer")
                    .tag(nil as Answer?)
                
                Text("Not at all")
                    .tag(Optional(Answer.none))
                
                Text("Several days")
                    .tag(Optional(Answer.sometimes))
                
                Text("More than half the days")
                    .tag(Optional(Answer.often))
                
                Text("Nearly every day")
                    .tag(Optional(Answer.continuous))
            }
            .labelsHidden()
        }
    }
}

#Preview {
    Form {
        QuestionView(
            symptom: "Example symptom",
            answer: .constant(Answer.sometimes)
        )
        .modelContainer(for: Questionnaire.self, inMemory: true)
    }
}
