import SwiftUI

struct DashboardView: View {

    @StateObject private var streakManager = StreakManager()

    var body: some View {

        NavigationView {

            VStack(spacing: 20) {

                Text("Anchor")
                    .font(.largeTitle)
                    .bold()

                Text("Current Streak: \(streakManager.currentStreak) Days")
                    .font(.headline)

                Text("Trust Score: \(streakManager.trustScore)")
                    .foregroundColor(.gray)

                NavigationLink("Manage Apps") {
                    AppSelectionView()
                }

                NavigationLink("Restriction Settings") {
                    RestrictionSettingsView()
                }

                NavigationLink("Unlock Requests") {
                    UnlockRequestView()
                }

                NavigationLink("All Requests") {
                    RequestsListView()
                }

                NavigationLink("Guardian Approval") {
                    GuardianApprovalView()
                }

                NavigationLink("Invite Guardian") {
                    InviteGuardianView()
                }

                Spacer()
            }
            .padding()
        }
    }
}