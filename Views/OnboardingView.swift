import SwiftUI

struct OnboardingView: View {

    @State private var selectedProblem = "Social Media"
    @State private var selectedMode = "Standard"

    let distractions = [
        "Social Media",
        "Gaming",
        "Doomscrolling",
        "Late Night Usage",
        "Gambling"
    ]

    let modes = [
        "Light",
        "Standard",
        "Strict",
        "Group Approval"
    ]

    var body: some View {

        ScrollView {

            VStack(spacing: 24) {

                Text("Build Better Focus")
                    .font(.largeTitle)
                    .bold()

                Text("Your apps control more of your day than you think.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)

                VStack(alignment: .leading, spacing: 12) {

                    Text("What distracts you most?")
                        .font(.headline)

                    Picker("Distraction", selection: $selectedProblem) {
                        ForEach(distractions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }

                VStack(alignment: .leading, spacing: 12) {

                    Text("Restriction Style")
                        .font(.headline)

                    Picker("Mode", selection: $selectedMode) {
                        ForEach(modes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                NavigationLink(destination: AppSelectionView()) {

                    Text("Continue")
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
            }
            .padding()
        }
    }
}