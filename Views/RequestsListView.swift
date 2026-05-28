import SwiftUI

struct RequestsListView: View {
    
    @State private var requests = [
        UnlockRequest(
            id: UUID().uuidString,
            requesterId: "user1",
            appName: "TikTok",
            durationMinutes: 15,
            status: .pending
        ),
        UnlockRequest(
            id: UUID().uuidString,
            requesterId: "user1",
            appName: "Instagram",
            durationMinutes: 5,
            status: .approved
        )
    ]
    
    var body: some View {
        List(requests) { request in
            VStack(alignment: .leading, spacing: 8) {
                Text(request.appName)
                    .font(.headline)
                
                Text("Duration: \(request.durationMinutes) minutes")
                
                Text("Status: \(request.status.rawValue.capitalized)")
                    .foregroundColor(request.status == .approved ? .green : .orange)
            }
            .padding(.vertical, 6)
        }
        .navigationTitle("Requests")
    }
}