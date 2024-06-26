import SwiftUI
import SwiftData

struct QuestionnaireAddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var isConfirmingCancel = false
    
    @State private var interest: Answer?
    @State private var hope: Answer?
    @State private var sleep: Answer?
    @State private var energy: Answer?
    @State private var appetite: Answer?
    @State private var expectations: Answer?
    @State private var concentration: Answer?
    @State private var speed: Answer?
    @State private var harm: Answer?
    
    var body: some View {
        NavigationStack {
            Form {
                Text("Over the last 2 weeks, how often have you been bothered by any of the following problems?")
                    .font(.headline)
                
                QuestionView(
                    symptom: "Little interest or pleasure in doing things",
                    answer: $interest
                )
                
                QuestionView(
                    symptom: "Feeling down, depressed, or hopeless",
                    answer: $hope
                )
                
                QuestionView(
                    symptom: "Trouble falling or staying asleep, or sleeping too much",
                    answer: $sleep
                )
                
                QuestionView(
                    symptom: "Feeling tired or having little energy",
                    answer: $energy
                )
                
                QuestionView(
                    symptom: "Poor appetite or overeating",
                    answer: $appetite
                )
                
                QuestionView(
                    symptom: "Feeling bad about yourself — or that you are a failure or have let yourself or your family down",
                    answer: $expectations
                )
                
                QuestionView(
                    symptom: "Trouble concentrating on things, such as reading the newspaper or watching television",
                    answer: $concentration
                )
                
                QuestionView(
                    symptom: "Moving or speaking so slowly that other people could have noticed? Or the opposite — being so fidgety or restless that you have been moving around a lot more than usual",
                    answer: $speed
                )
                
                QuestionView(
                    symptom: "Thoughts that you would be better off dead or of hurting yourself in some way",
                    answer: $harm
                )
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", action: confirmCancel)
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button("Save", action: save)
                        .disabled(!isComplete)
                }
            }
            .navigationTitle("Questionnaire")
            .interactiveDismissDisabled(hasUnsavedChanges)
            .confirmationDialog(
                "There are unsaved changes that will be lost",
                isPresented: $isConfirmingCancel,
                titleVisibility: .visible
            ) {
                Button("Delete", role: .destructive, action: cancel)
                Button("Continue", role: .cancel, action: stopCancel)
            }
        }
    }
    
    private var answers: [Answer?] {
        [
            interest,
            hope,
            sleep,
            energy,
            appetite,
            expectations,
            concentration,
            speed,
            harm
        ]
    }
    
    private var hasUnsavedChanges: Bool {
        answers.contains(where: { $0 != nil })
    }
    
    private var isComplete: Bool {
        answers.allSatisfy { $0 != nil }
    }
    
    private func confirmCancel() {
        if hasUnsavedChanges {
            isConfirmingCancel = true
        } else {
            cancel()
        }
    }
    
    private func stopCancel() {
        isConfirmingCancel = false
    }
    
    private func cancel() {
        dismiss()
    }
    
    private func save() {
        guard let interest,
              let hope,
              let sleep,
              let energy,
              let appetite,
              let expectations,
              let concentration,
              let speed,
              let harm
        else { return }
        
        let questions = Questions(
            interest: interest,
            hope: hope,
            sleep: sleep,
            energy: energy,
            appetite: appetite,
            expectations: expectations,
            concentration: concentration,
            speed: speed,
            harm: harm
        )
        
        let questionnaire = Questionnaire(questions: questions)
        
        modelContext.insert(questionnaire)
        
        dismiss()
    }
}

#Preview {
    QuestionnaireAddView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
