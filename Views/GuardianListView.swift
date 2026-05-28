import SwiftUI

struct GuardianListView: View {
    @StateObject private var guardianService = GuardianService.shared

    var body: some View {
        List {
            ForEach(guardianService.guardians) { guardian in
                VStack(alignment: .leading) {
                    Text(guardian.name)
                        .font(.headline)
                    Text(guardian.email)
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Guardians")
        .onAppear {
            if let userId = AuthManager.shared.currentUserId {
                guardianService.fetchGuardians(for: userId)
            }
        }
    }
}
