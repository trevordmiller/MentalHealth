import SwiftUI
import SwiftData

struct QuestionnaireDetailsView: View {
    let questionnaire: Questionnaire
    let score: Score
    
    var body: some View {
        Group {
            VStack {
                GroupBox("Total") {
                    Text("\(score.total)")
                }
                
                GroupBox("Severity") {
                    switch score.severity {
                    case .minimal:
                        Text("Minimal")
                        
                    case .mild:
                        Text("Mild")
                        
                    case .moderate:
                        Text("Moderate")
                        
                    case .moderatelySevere:
                        Text("Moderately Severe")
                        
                    case .severe:
                        Text("Severe")
                    }
                }
                
                GroupBox("Recommendation") {
                    switch score.severity {
                    case .minimal:
                        Text("None")
                        
                    case .mild:
                        Text("Repeat PHQ-9 at follow-up")
                        
                    case .moderate:
                        Text("Make treatment plan, consider counseling, follow-up, and/or prescription drugs")
                        
                    case .moderatelySevere:
                        Text("Prescribe prescription drugs and counseling")
                        
                    case .severe:
                        Text("Prescribe prescription drugs. If there are poor responses to treatment, immediately refer the patient to a mental health specialist for counseling.")
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(questionnaire.creationDate.formatted())
    }
}

#Preview {
    let questionnaire = Questionnaire(
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
    )
    
    let score = Score(questionnaire: questionnaire)
    
    return NavigationStack {
        QuestionnaireDetailsView(
            questionnaire: questionnaire,
            score: score
        )
        .modelContainer(for: Questionnaire.self, inMemory: true)
    }
}
