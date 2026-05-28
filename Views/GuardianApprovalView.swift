import SwiftUI

struct GuardianApprovalView: View {

    @State private var statusMessage = ""

    var body: some View {

        VStack(spacing: 24) {

            Spacer()

            Text("Unlock Request")
                .font(.largeTitle)
                .bold()

            Text("Moira wants access to TikTok for 15 minutes.")
                .multilineTextAlignment(.center)

            HStack(spacing: 20) {

                Button("Approve") {

                    statusMessage = "Request Approved"
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(12)

                Button("Deny") {

                    statusMessage = "Request Denied"
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(12)
            }

            Text(statusMessage)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
    }
}