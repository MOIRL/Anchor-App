import SwiftUI

struct SubscriptionView: View {
    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text("Start Your 3-Day Free Trial")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)

            Text("Unlock social approvals, streaks, challenges, reports, and unlimited restrictions.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)

            VStack(spacing: 12) {
                PlanRow(title: "$49.99 / year", subtitle: "Best value")
                PlanRow(title: "$9.99 / month", subtitle: "Flexible")
                PlanRow(title: "$4.99 / week", subtitle: "Try short-term")
            }

            Button("Continue") {}
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(14)

            Spacer()
        }
        .padding()
    }
}

private struct PlanRow: View {
    let title: String
    let subtitle: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).font(.headline)
                Text(subtitle).foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(14)
    }
}
