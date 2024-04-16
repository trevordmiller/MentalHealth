import SwiftUI
import SwiftData

struct AboutView: View {
    var body: some View {
        NavigationStack {
            Group {
                VStack(alignment: .leading) {
                    Text("An app for mental health")
                        .font(.headline)
                    
                    Text("This is not a real app. It is used for my own personal training to improve my skills as a software developer.")
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Divider()
                        
                        Text("Using PATIENT HEALTH QUESTIONNAIRE-9 (PHQ-9). Developed by Drs. Robert L. Spitzer, Janet B.W. Williams, Kurt Kroenke and colleagues, with an educational grant from Pfizer Inc. No permission required to reproduce, translate, display or distribute.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding()
            }
            .navigationTitle("About")
        }
    }
}

#Preview {
    AboutView()
        .modelContainer(for: Questionnaire.self, inMemory: true)
}
