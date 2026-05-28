import Foundation
import SwiftUI
import Combine
import DeviceActivity
import FamilyControls


class RestrictionScheduleManager: ObservableObject {
    static let shared = RestrictionScheduleManager()

    @Published var schedules: [RestrictionSchedule] = []

    func addSchedule(_ schedule: RestrictionSchedule) {
        schedules.append(schedule)
    }

    func toggleSchedule(_ schedule: RestrictionSchedule) {
        guard let index = schedules.firstIndex(where: { $0.id == schedule.id }) else { return }
        schedules[index].isEnabled.toggle()
    }

    func removeSchedule(_ schedule: RestrictionSchedule) {
        schedules.removeAll { $0.id == schedule.id }
    }

    func startMonitoring() {
        // Connect this to DeviceActivityCenter when your app group and extension targets are ready.
        print("Device activity monitoring should start here.")
    }

    func stopMonitoring() {
        DeviceActivityCenter().stopMonitoring()
    }
}
