import SwiftUI
import Firebase

@main
struct AnchorApp: App {

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
    }
}
  
