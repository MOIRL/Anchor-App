import SwiftUI

struct CreateChallengeView: View {
    @State private var title = ""
    @State private var targetApp = ""
    @State private var durationDays = 7
    @State private var message = ""

    var body: some View {
        Form {
            Section("Challenge") {
                TextField("Title", text: $title)
                TextField("Target App", text: $targetApp)
                Stepper("Duration: \(durationDays) days", value: $durationDays, in: 1...30)
            }

            Button("Create Challenge") {
                message = "Challenge created."
            }

            if !message.isEmpty {
                Text(message)
                    .foregroundColor(.green)
            }
        }
        .navigationTitle("Create Challenge")
    }
}
