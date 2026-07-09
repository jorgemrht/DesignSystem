#if DEBUG
import SwiftUI

private struct JdsFABPreviewItem: View {
  let title: String
  let variant: JdsFABButtonVariant
  let size: JdsFABButtonSize
  let shadow: JdsButtonShadow?
  let isDisabled: Bool

  var body: some View {
    VStack(spacing: .spacingXXS) {
      Button(title, systemImage: systemImage) {}
        .buttonStyle(.JdsFAB(variant: variant, size: size, shadow: shadow))
        .disabled(isDisabled)

      Text(title)
        .font(.caption)
        .foregroundStyle(.dsOnSurfaceVariant)
    }
  }

  private var systemImage: String {
    switch variant {
    case .primary: "plus"
    case .secondary: "bolt"
    case .tertiary: "sparkles"
    }
  }
}

private struct JdsFABPreviewRow: View {
  let titlePrefix: String
  let size: JdsFABButtonSize
  let shadow: JdsButtonShadow?
  let isDisabled: Bool

  var body: some View {
    HStack(alignment: .top, spacing: .spacingS) {
      ForEach(JdsFABButtonVariant.allCases, id: \.self) { variant in
        JdsFABPreviewItem(
          title: "\(titlePrefix) \(variant.title) \(size.title)",
          variant: variant,
          size: size,
          shadow: shadow,
          isDisabled: isDisabled
        )
      }
    }
  }
}

private struct JdsFABPreviewSection: View {
  let title: String
  let shadow: JdsButtonShadow?
  let isDisabled: Bool

  var body: some View {
    VStack(alignment: .leading, spacing: .spacingS) {
      Text(title)
        .font(.headline)
        .foregroundStyle(.dsOnSurface)

      JdsFABPreviewRow(titlePrefix: title, size: .small, shadow: shadow, isDisabled: isDisabled)
      JdsFABPreviewRow(titlePrefix: title, size: .medium, shadow: shadow, isDisabled: isDisabled)
      JdsFABPreviewRow(titlePrefix: title, size: .large, shadow: shadow, isDisabled: isDisabled)
    }
  }
}

struct JdsFABButtonStyleMock: View {
  var body: some View {
    ScrollView {
      VStack(spacing: .spacingL) {
        JdsFABPreviewSection(title: "With shadow", shadow: .floating, isDisabled: false)
        JdsFABPreviewSection(title: "Without shadow", shadow: nil, isDisabled: false)
        JdsFABPreviewSection(title: "Disabled with shadow", shadow: .floating, isDisabled: true)
        JdsFABPreviewSection(title: "Disabled without shadow", shadow: nil, isDisabled: true)

        VStack(alignment: .leading, spacing: .spacingS) {
          Text("Custom")
            .font(.headline)
            .foregroundStyle(.dsOnSurface)

          VStack(spacing: .spacingXXS) {
            Button("Custom tertiary medium", systemImage: "star") {}
              .buttonStyle(
                .JdsFAB(
                  variant: .tertiary,
                  size: .medium,
                  appearance: JdsButtonAppearance(
                    foreground: .dsOnTertiaryContainer,
                    background: .dsTertiaryContainer,
                    pressedOverlay: .dsOnTertiaryContainer,
                    disabledForeground: .dsOnTertiaryContainer.opacity(0.55),
                    disabledBackground: .dsTertiaryContainer.opacity(0.38)
                  )
                )
              )

            Text("Custom tertiary medium")
              .font(.caption)
              .foregroundStyle(.dsOnSurfaceVariant)
          }
        }
      }
      .padding(.spacingM)
    }
  }
}

private extension JdsFABButtonVariant {
  var title: String {
    switch self {
    case .primary: "Primary"
    case .secondary: "Secondary"
    case .tertiary: "Tertiary"
    }
  }
}

private extension JdsFABButtonSize {
  var title: String {
    switch self {
    case .small: "small"
    case .medium: "medium"
    case .large: "large"
    }
  }
}
#endif
