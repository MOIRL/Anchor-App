import SwiftUI
import FamilyControls

struct ScreenTimeSelectionView: View {
    @State private var selection = FamilyActivitySelection()
    @State private var isPickerPresented = false

    var body: some View {
        VStack(spacing: 24) {
            Text("Select Distracting Apps")
                .font(.largeTitle)
                .bold()

            Text("Choose the apps Anchor should help you control.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)

            Button("Open App Picker") {
                isPickerPresented = true
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(14)

            Text("Selected apps: \(selection.applicationTokens.count)")
                .foregroundColor(.secondary)

            NavigationLink("Continue") {
                RestrictionSettingsView()
            }
        }
        .padding()
        .familyActivityPicker(isPresented: $isPickerPresented, selection: $selection)
        .onAppear {
            RestrictionManager.shared.requestAuthorization()
        }
    }
}
