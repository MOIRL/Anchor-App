import Foundation
import FirebaseFirestore
import Combine

class RequestService: ObservableObject {
    static let shared = RequestService()
    private let db = Firestore.firestore()

    @Published var requests: [UnlockRequest] = []

    func createRequest(requesterId: String, appName: String, durationMinutes: Int) {
        let request = UnlockRequest(
            id: UUID().uuidString,
            requesterId: requesterId,
            appName: appName,
            durationMinutes: durationMinutes,
            status: .pending
        )

        do {
            try db.collection(Constants.Collections.unlockRequests)
                .document(request.id)
                .setData(from: request)
        } catch {
            print("Failed to create request: \(error.localizedDescription)")
        }
    }

    func listenForRequests(for requesterId: String) {
        db.collection(Constants.Collections.unlockRequests)
            .whereField("requesterId", isEqualTo: requesterId)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Failed to listen for requests: \(error.localizedDescription)")
                    return
                }

                self.requests = snapshot?.documents.compactMap { document in
                    try? document.data(as: UnlockRequest.self)
                } ?? []
            }
    }

    func updateStatus(requestId: String, status: RequestStatus) {
        db.collection(Constants.Collections.unlockRequests)
            .document(requestId)
            .updateData(["status": status.rawValue])
    }
}
