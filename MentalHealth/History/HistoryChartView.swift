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
    HistoryChartView(questionnaires: [
        Questionnaire(
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
    ])
    .modelContainer(for: Questionnaire.self, inMemory: true)
}
