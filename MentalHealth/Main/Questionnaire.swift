import Foundation
import SwiftData

@Model
final class Questionnaire {
    let id: UUID
    let creationDate: Date
    let questions: Questions
    
    init(questions: Questions) {
        id = UUID()
        creationDate = Date()
        self.questions = questions
    }
}
