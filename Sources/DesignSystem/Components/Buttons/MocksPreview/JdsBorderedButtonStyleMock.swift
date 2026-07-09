#if DEBUG
import SwiftUI

struct JdsBorderedButtonStyleMock: View {
  var body: some View {
    ScrollView {
      VStack(spacing: .spacingS) {
        Button("Small", systemImage: "square.and.pencil") {}
          .buttonStyle(.JdsBordered(size: .small))

        Button("Medium", systemImage: "square.and.pencil") {}
          .buttonStyle(.JdsBordered(size: .medium))

        Button("Large", systemImage: "square.and.pencil") {}
          .buttonStyle(.JdsBordered(size: .large))

        Button("Bordered", systemImage: "square.and.pencil") {}
          .buttonStyle(.JdsBordered)

        Button("Full width bordered") {}
          .buttonStyle(.JdsBordered(isFullWidth: true))

        Button("Square bordered") {}
          .buttonStyle(.JdsBordered(cornerRadius: .cornerRadiusNone))

        Button("Small disabled", systemImage: "square.and.pencil") {}
          .buttonStyle(.JdsBordered(size: .small))
          .disabled(true)

        Button("Medium disabled", systemImage: "square.and.pencil") {}
          .buttonStyle(.JdsBordered(size: .medium))
          .disabled(true)

        Button("Large disabled", systemImage: "square.and.pencil") {}
          .buttonStyle(.JdsBordered(size: .large))
          .disabled(true)

        Button("Bordered disabled", systemImage: "square.and.pencil") {}
          .buttonStyle(.JdsBordered)
          .disabled(true)

        Button("Full width disabled") {}
          .buttonStyle(.JdsBordered(isFullWidth: true))
          .disabled(true)

        Button("Square disabled") {}
          .buttonStyle(.JdsBordered(cornerRadius: .cornerRadiusNone))
          .disabled(true)

        Button("Custom appearance") {}
          .buttonStyle(
            .JdsBordered(
              appearance: JdsButtonAppearance(
                foreground: .dsError,
                background: nil,
                border: .dsError,
                pressedOverlay: .dsError,
                disabledForeground: .dsError.opacity(0.38),
                disabledBackground: nil,
                disabledBorder: .dsError.opacity(0.24)
              )
            )
          )
      }
      .padding(.spacingM)
    }
  }
}
#endif
