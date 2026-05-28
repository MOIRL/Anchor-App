import ManagedSettings
import ManagedSettingsUI
import UIKit

nonisolated class ShieldConfigurationExtension: ShieldConfigurationDataSource {
    override func configuration(shielding application: Application) -> ShieldConfiguration {
        ShieldConfiguration(
            backgroundBlurStyle: .systemMaterialDark,
            backgroundColor: .systemBackground,
            icon: UIImage(systemName: "lock.shield"),
            title: ShieldConfiguration.Label(text: "App Locked", color: .label),
            subtitle: ShieldConfiguration.Label(text: "Anchor is protecting your focus.", color: .secondaryLabel),
            primaryButtonLabel: ShieldConfiguration.Label(text: "Request Access", color: .white),
            primaryButtonBackgroundColor: .systemBlue,
            secondaryButtonLabel: ShieldConfiguration.Label(text: "Stay Focused", color: .systemBlue)
        )
    }
}
