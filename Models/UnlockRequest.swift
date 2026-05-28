import Foundation

struct UnlockRequest: Identifiable, Codable {

    let id: String
    let requesterId: String
    let appName: String
    let durationMinutes: Int
    var status: RequestStatus
}

enum RequestStatus: String, Codable {
    case pending
    case approved
    case denied
}