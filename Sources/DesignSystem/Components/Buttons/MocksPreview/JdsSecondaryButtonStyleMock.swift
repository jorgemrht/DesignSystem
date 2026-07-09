#if DEBUG
import SwiftUI

struct JdsSecondaryButtonStyleMock: View {
  var body: some View {
    ScrollView {
      VStack(spacing: .spacingS) {
        Button("Small", systemImage: "sparkles") {}
          .buttonStyle(.JdsSecondary(size: .small))

        Button("Medium", systemImage: "sparkles") {}
          .buttonStyle(.JdsSecondary(size: .medium))

        Button("Large", systemImage: "sparkles") {}
          .buttonStyle(.JdsSecondary(size: .large))

        Button("Secondary", systemImage: "sparkles") {}
          .buttonStyle(.JdsSecondary)

        Button("Full width secondary") {}
          .buttonStyle(.JdsSecondary(isFullWidth: true))

        Button("Square secondary") {}
          .buttonStyle(.JdsSecondary(cornerRadius: .cornerRadiusNone))

        Button("Small disabled", systemImage: "sparkles") {}
          .buttonStyle(.JdsSecondary(size: .small))
          .disabled(true)

        Button("Medium disabled", systemImage: "sparkles") {}
          .buttonStyle(.JdsSecondary(size: .medium))
          .disabled(true)

        Button("Large disabled", systemImage: "sparkles") {}
          .buttonStyle(.JdsSecondary(size: .large))
          .disabled(true)

        Button("Secondary disabled", systemImage: "sparkles") {}
          .buttonStyle(.JdsSecondary)
          .disabled(true)

        Button("Full width disabled") {}
          .buttonStyle(.JdsSecondary(isFullWidth: true))
          .disabled(true)

        Button("Square disabled") {}
          .buttonStyle(.JdsSecondary(cornerRadius: .cornerRadiusNone))
          .disabled(true)

        Button("Custom appearance") {}
          .buttonStyle(
            .JdsSecondary(
              appearance: JdsButtonAppearance(
                foreground: .dsOnPrimaryContainer,
                background: .dsPrimaryContainer,
                pressedOverlay: .dsOnPrimaryContainer,
                disabledForeground: .dsOnPrimaryContainer.opacity(0.55),
                disabledBackground: .dsPrimaryContainer.opacity(0.38)
              )
            )
          )
      }
      .padding(.spacingM)
    }
  }
}
#endif
