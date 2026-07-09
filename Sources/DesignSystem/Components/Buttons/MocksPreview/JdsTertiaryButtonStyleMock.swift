#if DEBUG
import SwiftUI

struct JdsTertiaryButtonStyleMock: View {
  var body: some View {
    ScrollView {
      VStack(spacing: .spacingS) {
        Button("Small", systemImage: "text.cursor") {}
          .buttonStyle(.JdsTertiary(size: .small))

        Button("Medium", systemImage: "text.cursor") {}
          .buttonStyle(.JdsTertiary(size: .medium))

        Button("Large", systemImage: "text.cursor") {}
          .buttonStyle(.JdsTertiary(size: .large))

        Button("Tertiary", systemImage: "text.cursor") {}
          .buttonStyle(.JdsTertiary)

        Button("Full width tertiary") {}
          .buttonStyle(.JdsTertiary(isFullWidth: true))

        Button("Small disabled", systemImage: "text.cursor") {}
          .buttonStyle(.JdsTertiary(size: .small))
          .disabled(true)

        Button("Medium disabled", systemImage: "text.cursor") {}
          .buttonStyle(.JdsTertiary(size: .medium))
          .disabled(true)

        Button("Large disabled", systemImage: "text.cursor") {}
          .buttonStyle(.JdsTertiary(size: .large))
          .disabled(true)

        Button("Tertiary disabled", systemImage: "text.cursor") {}
          .buttonStyle(.JdsTertiary)
          .disabled(true)

        Button("Full width disabled") {}
          .buttonStyle(.JdsTertiary(isFullWidth: true))
          .disabled(true)

        Button("Custom appearance") {}
          .buttonStyle(
            .JdsTertiary(
              appearance: JdsButtonAppearance(
                foreground: .dsError,
                background: nil,
                pressedOverlay: .dsError,
                disabledForeground: .dsError.opacity(0.38),
                disabledBackground: nil
              )
            )
          )
      }
      .padding(.spacingM)
    }
  }
}
#endif
