import SwiftUI

struct WelcomeView: View {

    var body: some View {

        NavigationView {

            VStack(spacing: 24) {

                Spacer()

                Text("Anchor")
                    .font(.system(size: 42, weight: .bold))

                Text("Take control of your distractions.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)

                NavigationLink(destination: AuthView()) {

                    Text("Get Started")
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }

                Spacer()
            }
            .padding()
        }
    }
}