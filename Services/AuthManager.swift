import Foundation
import FirebaseAuth
import Combine

class AuthManager: ObservableObject {
    static let shared = AuthManager()

    @Published var currentUserId: String? = Auth.auth().currentUser?.uid
    @Published var isLoggedIn: Bool = Auth.auth().currentUser != nil

    private var listenerHandle: AuthStateDidChangeListenerHandle?

    private init() {
        listenerHandle = Auth.auth().addStateDidChangeListener { _, user in
            self.currentUserId = user?.uid
            self.isLoggedIn = user != nil
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Logout failed: \(error.localizedDescription)")
        }
    }
}
