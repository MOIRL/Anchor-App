import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Section("Account") {
                Button("Log Out") {
                    AuthManager.shared.logout()
                }
                .foregroundColor(.red)
            }

            Section("Permissions") {
                Button("Request Screen Time Permission") {
                    RestrictionManager.shared.requestAuthorization()
                }

                Button("Request Notification Permission") {
                    NotificationManager.shared.requestPermission()
                }
            }

            Section("Safety") {
                Text("Emergency overrides can be added here.")
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Settings")
    }
}
