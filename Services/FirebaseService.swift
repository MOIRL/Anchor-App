import Foundation
import FirebaseAuth
import FirebaseFirestore
import Combine

class FirebaseService: ObservableObject {
    
    static let shared = FirebaseService()
    private let db = Firestore.firestore()
    
    func register(name: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let user = result?.user {
                let appUser = AppUser(
                    id: user.uid,
                    name: name,
                    email: email,
                    streakCount: 0,
                    trustScore: 100
                )
                
                do {
                    try self.db.collection("users").document(user.uid).setData(from: appUser)
                    completion(true)
                } catch {
                    completion(false)
                }
            } else {
                completion(false)
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            completion(error == nil)
        }
    }
    
    func createUnlockRequest(request: UnlockRequest) {
        do {
            try db.collection("unlockRequests").document(request.id).setData(from: request)
        } catch {
            print("Error saving request")
        }
    }
    
    func updateRequestStatus(requestId: String, status: RequestStatus) {
        db.collection("unlockRequests").document(requestId).updateData([
            "status": status.rawValue
        ])
    }
}
