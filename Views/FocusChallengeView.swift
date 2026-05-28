import SwiftUI

struct FocusChallengeView: View {
    @State private var challenges: [FocusChallenge] = [
        FocusChallenge(
            id: UUID().uuidString,
            title: "7-Day No TikTok",
            description: "Avoid TikTok for one full week.",
            targetApp: "TikTok",
            durationDays: 7,
            currentDay: 2,
            isCompleted: false,
            createdByUserId: "demoUser",
            participantIds: ["demoUser"]
        )
    ]

    var body: some View {
        List(challenges) { challenge in
            VStack(alignment: .leading, spacing: 8) {
                Text(challenge.title)
                    .font(.headline)
                Text(challenge.description)
                    .foregroundColor(.gray)
                Text("Progress: Day \(challenge.currentDay)/\(challenge.durationDays)")
                    .font(.caption)
            }
        }
        .navigationTitle("Challenges")
        .toolbar {
            NavigationLink("Create") {
                CreateChallengeView()
            }
        }
    }
}
