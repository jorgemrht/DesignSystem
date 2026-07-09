#if DEBUG
import SwiftUI

struct JdsPrimaryButtonStyleMock: View {
  var body: some View {
    ScrollView {
      VStack(spacing: .spacingS) {
        Button("Small", systemImage: "checkmark") {}
          .buttonStyle(.JdsPrimary(size: .small))

        Button("Medium", systemImage: "checkmark") {}
          .buttonStyle(.JdsPrimary(size: .medium))

        Button("Large", systemImage: "checkmark") {}
          .buttonStyle(.JdsPrimary(size: .large))

        Button("Primary", systemImage: "checkmark") {}
          .buttonStyle(.JdsPrimary)

        Button("Full width primary") {}
          .buttonStyle(.JdsPrimary(isFullWidth: true))

        Button("Square primary") {}
          .buttonStyle(.JdsPrimary(cornerRadius: .cornerRadiusNone))

        Button("Small disabled", systemImage: "checkmark") {}
          .buttonStyle(.JdsPrimary(size: .small))
          .disabled(true)

        Button("Medium disabled", systemImage: "checkmark") {}
          .buttonStyle(.JdsPrimary(size: .medium))
          .disabled(true)

        Button("Large disabled", systemImage: "checkmark") {}
          .buttonStyle(.JdsPrimary(size: .large))
          .disabled(true)

        Button("Primary disabled", systemImage: "checkmark") {}
          .buttonStyle(.JdsPrimary)
          .disabled(true)

        Button("Full width disabled") {}
          .buttonStyle(.JdsPrimary(isFullWidth: true))
          .disabled(true)

        Button("Square disabled") {}
          .buttonStyle(.JdsPrimary(cornerRadius: .cornerRadiusNone))
          .disabled(true)

        Button("Custom appearance") {}
          .buttonStyle(
            .JdsPrimary(
              appearance: JdsButtonAppearance(
                foreground: .dsOnTertiaryContainer,
                background: .dsTertiaryContainer,
                pressedOverlay: .dsOnTertiaryContainer,
                disabledForeground: .dsOnTertiaryContainer.opacity(0.55),
                disabledBackground: .dsTertiaryContainer.opacity(0.38)
              )
            )
          )
      }
      .padding(.spacingM)
    }
  }
}
#endif
