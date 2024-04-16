struct Score {
    private let questionnaire: Questionnaire
    
    var total = 0
    var severity = Severity.minimal
    
    init(questionnaire: Questionnaire) {
        self.questionnaire = questionnaire
        total = calculateTotal(questions: questionnaire.questions)
        severity = calculateSeverity(total: total)
    }
    
    private func calculateTotal(questions: Questions) -> Int {
        let answers = [
            questions.interest,
            questions.hope,
            questions.sleep,
            questions.energy,
            questions.appetite,
            questions.expectations,
            questions.concentration,
            questions.speed,
            questions.harm
        ]
        
        let amounts: [Answer: Int] = [
            .none: 0,
            .sometimes: 1,
            .often: 2,
            .continuous: 3
        ]
        
        let sum = answers
            .map { amounts[$0] ?? 0 }
            .reduce(0, +)
        
        return sum
    }
    
    private func calculateSeverity(total: Int) -> Severity {
        switch total {
        case 0 ... 4:
            return .minimal
            
        case 5 ... 9:
            return .mild
            
        case 10 ... 14:
            return .moderate
            
        case 15 ... 19:
            return .moderatelySevere
            
        case 20 ... 27:
            return .severe
            
        default:
            return .minimal
        }
    }
}
