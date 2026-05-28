import SwiftUI

struct RestrictionSettingsView: View {

    @State private var selectedMode = "Standard"

    let modes = [
        "Light",
        "Standard",
        "Strict",
        "Group Approval"
    ]

    var body: some View {

        Form {
            Picker("Mode", selection: $selectedMode) {
                ForEach(modes, id: \.self) {
                    Text($0)
                }
            }

            Text("Selected: \(selectedMode)")
        }
    }
}