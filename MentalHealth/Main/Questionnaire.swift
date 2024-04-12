import Foundation
import SwiftData

@Model
final class Questionnaire {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
