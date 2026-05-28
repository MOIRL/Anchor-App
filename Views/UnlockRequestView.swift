import SwiftUI

struct UnlockRequestView: View {

    @State private var selectedDuration = 15
    @State private var requestSent = false

    let durations = [5, 15, 30, 60]

    var body: some View {

        VStack(spacing: 24) {

            Spacer()

            Text("Need More Time?")
                .font(.largeTitle)
                .bold()

            Text("Request temporary access to a blocked app.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)

            Picker("Duration", selection: $selectedDuration) {

                ForEach(durations, id: \.self) { duration in
                    Text("\(duration) Minutes")
                }
            }
            .pickerStyle(.segmented)

            Button("Send Unlock Request") {

                let request = UnlockRequest(
                    id: UUID().uuidString,
                    requesterId: "currentUser",
                    appName: "TikTok",
                    durationMinutes: selectedDuration,
                    status: .pending
                )

                FirebaseService.shared.createUnlockRequest(request: request)

                requestSent = true
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(14)

            if requestSent {

                Text("Request sent successfully.")
                    .foregroundColor(.green)
            }

            Spacer()
        }
        .padding()
    }
}