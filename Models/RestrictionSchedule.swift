import Foundation

enum RestrictionMode: String, Codable, CaseIterable, Identifiable {
    case light = "Light"
    case standard = "Standard"
    case strict = "Strict"
    case groupApproval = "Group Approval"

    var id: String { rawValue }
}

struct RestrictionSchedule: Identifiable, Codable {
    let id: String
    let userId: String
    var name: String
    var selectedApps: [String]
    var mode: RestrictionMode
    var startTime: Date
    var endTime: Date
    var isEnabled: Bool
}
