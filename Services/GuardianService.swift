import Foundation
import FirebaseFirestore
import Combine

class GuardianService: ObservableObject {
    static let shared = GuardianService()
    private let db = Firestore.firestore()

    @Published var guardians: [Guardian] = []

    func inviteGuardian(userId: String, name: String = "Guardian", email: String) {
        let id = UUID().uuidString

        let data: [String: Any] = [
            "id": id,
            "name": name,
            "email": email,
            "userId": userId
        ]

        db.collection(Constants.Collections.guardians)
            .document(id)
            .setData(data)
    }

    func fetchGuardians(for userId: String) {
        db.collection(Constants.Collections.guardians)
            .whereField("userId", isEqualTo: userId)
            .getDocuments { snapshot, error in

                if let error = error {
                    print("Failed to fetch guardians: \(error.localizedDescription)")
                    return
                }

                let fetchedGuardians: [Guardian] = snapshot?.documents.map { document in
                    let data = document.data()

                    return Guardian(
                        id: data["id"] as? String ?? document.documentID,
                        name: data["name"] as? String ?? "Guardian",
                        email: data["email"] as? String ?? "",
                        userId: data["userId"] as? String ?? ""
                    )
                } ?? []

                DispatchQueue.main.async {
                    self.guardians = fetchedGuardians
                }
            }
    }

    func removeGuardian(_ guardian: Guardian) {
        db.collection(Constants.Collections.guardians)
            .document(guardian.id)
            .delete()
    }
}
