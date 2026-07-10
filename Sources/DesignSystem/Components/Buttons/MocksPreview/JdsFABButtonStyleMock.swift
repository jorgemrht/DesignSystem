#if DEBUG
import SwiftUI

private enum JdsFABPreviewLayout {
  static let cellWidth: CGFloat = 112
  static let controlAreaHeight: CGFloat = .controlSizeXL
}

private struct JdsFABPreviewItem: View {
  let title: String
  let variant: JdsFABButtonVariant
  let size: JdsFABButtonSize
  let shadow: JdsButtonShadow?

  var body: some View {
    VStack(spacing: .spacingXXS) {
      Button(title, systemImage: systemImage) {}
        .buttonStyle(.JdsFAB(variant: variant, size: size, shadow: shadow))
        .frame(height: JdsFABPreviewLayout.controlAreaHeight)

      Text(title)
        .font(.caption)
        .foregroundStyle(.dsOnSurfaceVariant)
        .multilineTextAlignment(.center)
        .lineLimit(2)
    }
    .frame(width: JdsFABPreviewLayout.cellWidth, alignment: .top)
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

  var body: some View {
    HStack(alignment: .top, spacing: .spacingS) {
      ForEach(JdsFABButtonVariant.allCases, id: \.self) { variant in
        JdsFABPreviewItem(
          title: "\(titlePrefix) \(variant.title) \(size.title)",
          variant: variant,
          size: size,
          shadow: shadow
        )
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

private struct JdsGlassFABPreviewItem: View {
  let title: String
  let systemImage: String
  let variant: JdsFABButtonVariant
  let size: JdsFABButtonSize

  var body: some View {
    VStack(spacing: .spacingXXS) {
      Button(title, systemImage: systemImage) {}
        .buttonStyle(.JdsGlassFAB(variant: variant, size: size))
        .frame(height: JdsFABPreviewLayout.controlAreaHeight)

      Text(title)
        .font(.caption)
        .foregroundStyle(.dsOnSurfaceVariant)
        .multilineTextAlignment(.center)
        .lineLimit(2)
    }
    .frame(width: JdsFABPreviewLayout.cellWidth, alignment: .top)
  }
}

private struct JdsGlassFABPreviewRow: View {
  let titlePrefix: String
  let size: JdsFABButtonSize

  var body: some View {
    HStack(alignment: .top, spacing: .spacingS) {
      ForEach(JdsFABButtonVariant.allCases, id: \.self) { variant in
        JdsGlassFABPreviewItem(
          title: "\(titlePrefix) \(variant.title)",
          systemImage: variant.systemImage,
          variant: variant,
          size: size
        )
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

private struct JdsFABPreviewSection: View {
  let title: String
  let shadow: JdsButtonShadow?

  var body: some View {
    VStack(alignment: .leading, spacing: .spacingS) {
      Text(title)
        .font(.headline)
        .foregroundStyle(.dsOnSurface)

      JdsFABPreviewRow(titlePrefix: title, size: .small, shadow: shadow)
      JdsFABPreviewRow(titlePrefix: title, size: .medium, shadow: shadow)
      JdsFABPreviewRow(titlePrefix: title, size: .large, shadow: shadow)
    }
  }
}

struct JdsFABButtonStyleMock: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: .spacingL) {
        JdsFABPreviewSection(title: "With shadow", shadow: .floating)
        JdsFABPreviewSection(title: "Without shadow", shadow: nil)
        JdsFABPreviewSection(title: "Disabled with shadow", shadow: .floating)
          .disabled(true)
        JdsFABPreviewSection(title: "Disabled without shadow", shadow: nil)
          .disabled(true)

        VStack(alignment: .leading, spacing: .spacingS) {
          Text("Glass")
            .font(.headline)
            .foregroundStyle(.dsOnSurface)

          JdsGlassButtonGroup {
            VStack(alignment: .leading, spacing: .spacingS) {
              JdsGlassFABPreviewRow(titlePrefix: "Glass small", size: .small)
              JdsGlassFABPreviewRow(titlePrefix: "Glass medium", size: .medium)
              JdsGlassFABPreviewRow(titlePrefix: "Glass large", size: .large)
            }
          }
        }

        VStack(alignment: .leading, spacing: .spacingS) {
          Text("Glass disabled")
            .font(.headline)
            .foregroundStyle(.dsOnSurface)

          JdsGlassButtonGroup {
            VStack(alignment: .leading, spacing: .spacingS) {
              JdsGlassFABPreviewRow(titlePrefix: "Glass small", size: .small)
              JdsGlassFABPreviewRow(titlePrefix: "Glass medium", size: .medium)
              JdsGlassFABPreviewRow(titlePrefix: "Glass large", size: .large)
            }
          }
        }
        .disabled(true)

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
              .multilineTextAlignment(.center)
              .lineLimit(2)
          }
          .frame(width: JdsFABPreviewLayout.cellWidth, alignment: .top)
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

  var systemImage: String {
    switch self {
    case .primary: "plus"
    case .secondary: "bolt"
    case .tertiary: "sparkles"
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
