import SwiftUI
import SwiftData
import Charts

struct HistoryChartView: View {
    let questionnaires: [Questionnaire]
    
    var body: some View {
        Chart {
            ForEach(questionnaires) { questionnaire in
                let score = Score(questionnaire: questionnaire)
                
                LineMark(
                    x: .value("Date", questionnaire.creationDate),
                    y: .value("Total", score.total)
                )
            }
        }
        .padding()
    }
}

#Preview {
    Group {
        let questionnaires = [
            Questionnaire(
                questions: Questions(
                    interest: .sometimes,
                    hope: .sometimes,
                    sleep: .none,
                    energy: .none,
                    appetite: .sometimes,
                    expectations: .sometimes,
                    concentration: .none,
                    speed: .none,
                    harm: .none
                )
            ),
            Questionnaire(
                questions: Questions(
                    interest: .sometimes,
                    hope: .sometimes,
                    sleep: .often,
                    energy: .often,
                    appetite: .sometimes,
                    expectations: .sometimes,
                    concentration: .sometimes,
                    speed: .none,
                    harm: .none
                )
            ),
            Questionnaire(
                questions: Questions(
                    interest: .sometimes,
                    hope: .sometimes,
                    sleep: .sometimes,
                    energy: .sometimes,
                    appetite: .sometimes,
                    expectations: .sometimes,
                    concentration: .sometimes,
                    speed: .none,
                    harm: .none
                )
            )
        ]
        
        HistoryChartView(questionnaires: questionnaires)
            .modelContainer(for: Questionnaire.self, inMemory: true)
    }
}
