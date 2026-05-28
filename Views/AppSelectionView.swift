import SwiftUI

struct AppSelectionView: View {

    @State private var selectedApps = [
        "TikTok",
        "Instagram",
        "YouTube"
    ]

    var body: some View {

        VStack {

            List(selectedApps, id: \.self) { app in

                HStack {

                    Image(systemName: "lock.fill")
                        .foregroundColor(.red)

                    Text(app)
                }
            }

            NavigationLink(destination: RestrictionSettingsView()) {

                Text("Continue")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(14)
                    .padding()
            }
        }
        .navigationTitle("Blocked Apps")
    }
}