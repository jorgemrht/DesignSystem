#if DEBUG
import SwiftUI

private enum JdsIconButtonPreviewLayout {
  static let cellWidth: CGFloat = 112
  static let controlAreaHeight: CGFloat = .controlSizeXL
}

private struct JdsIconButtonPreviewItem: View {
  let title: String
  let systemImage: String
  let prominence: JdsIconButtonProminence
  let size: JdsIconButtonSize

  var body: some View {
    VStack(spacing: .spacingXXS) {
      JdsIconButton(
        title,
        systemImage: systemImage,
        prominence: prominence,
        size: size
      ) {}
      .frame(height: JdsIconButtonPreviewLayout.controlAreaHeight)

      Text(title)
        .font(.caption)
        .foregroundStyle(.dsOnSurfaceVariant)
        .multilineTextAlignment(.center)
        .lineLimit(2)
    }
    .frame(width: JdsIconButtonPreviewLayout.cellWidth, alignment: .top)
  }
}

private struct JdsIconButtonPreviewRow: View {
  let titlePrefix: String
  let size: JdsIconButtonSize

  var body: some View {
    HStack(alignment: .top, spacing: .spacingS) {
      JdsIconButtonPreviewItem(
        title: "\(titlePrefix) plain",
        systemImage: "magnifyingglass",
        prominence: .plain,
        size: size
      )

      JdsIconButtonPreviewItem(
        title: "\(titlePrefix) bordered",
        systemImage: "ellipsis",
        prominence: .bordered,
        size: size
      )

      JdsIconButtonPreviewItem(
        title: "\(titlePrefix) prominent",
        systemImage: "checkmark",
        prominence: .borderedProminent,
        size: size
      )
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

private struct JdsGlassIconPreviewItem: View {
  let title: String
  let systemImage: String
  let prominence: JdsIconButtonProminence
  let size: JdsIconButtonSize

  var body: some View {
    VStack(spacing: .spacingXXS) {
      Button(title, systemImage: systemImage) {}
        .labelStyle(.iconOnly)
        .buttonStyle(.JdsGlassIcon(prominence: prominence, size: size))
        .frame(height: JdsIconButtonPreviewLayout.controlAreaHeight)

      Text(title)
        .font(.caption)
        .foregroundStyle(.dsOnSurfaceVariant)
        .multilineTextAlignment(.center)
        .lineLimit(2)
    }
    .frame(width: JdsIconButtonPreviewLayout.cellWidth, alignment: .top)
  }
}

private struct JdsGlassIconPreviewRow: View {
  let titlePrefix: String
  let size: JdsIconButtonSize

  var body: some View {
    HStack(alignment: .top, spacing: .spacingS) {
      JdsGlassIconPreviewItem(
        title: "\(titlePrefix) plain",
        systemImage: "magnifyingglass",
        prominence: .plain,
        size: size
      )

      JdsGlassIconPreviewItem(
        title: "\(titlePrefix) bordered",
        systemImage: "ellipsis",
        prominence: .bordered,
        size: size
      )

      JdsGlassIconPreviewItem(
        title: "\(titlePrefix) prominent",
        systemImage: "checkmark",
        prominence: .borderedProminent,
        size: size
      )
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

private struct JdsIconButtonPreviewSection: View {
  let title: String

  var body: some View {
    VStack(alignment: .leading, spacing: .spacingS) {
      Text(title)
        .font(.headline)
        .foregroundStyle(.dsOnSurface)

      JdsIconButtonPreviewRow(
        titlePrefix: "\(title) small",
        size: .small
      )

      JdsIconButtonPreviewRow(
        titlePrefix: "\(title) medium",
        size: .medium
      )

      JdsIconButtonPreviewRow(
        titlePrefix: "\(title) large",
        size: .large
      )
    }
  }
}

struct JdsIconButtonMock: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: .spacingL) {
        JdsIconButtonPreviewSection(title: "Enabled")
        JdsIconButtonPreviewSection(title: "Disabled")
          .disabled(true)

        VStack(alignment: .leading, spacing: .spacingS) {
          Text("Glass")
            .font(.headline)
            .foregroundStyle(.dsOnSurface)

          JdsGlassButtonGroup {
            VStack(alignment: .leading, spacing: .spacingS) {
              JdsGlassIconPreviewRow(titlePrefix: "Glass small", size: .small)
              JdsGlassIconPreviewRow(titlePrefix: "Glass medium", size: .medium)
              JdsGlassIconPreviewRow(titlePrefix: "Glass large", size: .large)
            }
          }
        }

        VStack(alignment: .leading, spacing: .spacingS) {
          Text("Glass disabled")
            .font(.headline)
            .foregroundStyle(.dsOnSurface)

          JdsGlassButtonGroup {
            VStack(alignment: .leading, spacing: .spacingS) {
              JdsGlassIconPreviewRow(titlePrefix: "Glass small", size: .small)
              JdsGlassIconPreviewRow(titlePrefix: "Glass medium", size: .medium)
              JdsGlassIconPreviewRow(titlePrefix: "Glass large", size: .large)
            }
          }
        }
        .disabled(true)

        VStack(alignment: .leading, spacing: .spacingS) {
          Text("Custom")
            .font(.headline)
            .foregroundStyle(.dsOnSurface)

          VStack(spacing: .spacingXXS) {
            JdsIconButton(
              "Custom prominent",
              systemImage: "star",
              prominence: .borderedProminent,
              size: .large,
              appearance: JdsButtonAppearance(
                foreground: .dsOnTertiaryContainer,
                background: .dsTertiaryContainer,
                pressedOverlay: .dsOnTertiaryContainer,
                disabledForeground: .dsOnTertiaryContainer.opacity(0.55),
                disabledBackground: .dsTertiaryContainer.opacity(0.38)
              ),
              customSize: .controlSizeXL,
              customFont: .largeTitle
            ) {}

            Text("Custom prominent")
              .font(.caption)
              .foregroundStyle(.dsOnSurfaceVariant)
              .multilineTextAlignment(.center)
              .lineLimit(2)
          }
          .frame(width: JdsIconButtonPreviewLayout.cellWidth, alignment: .top)
        }
      }
      .padding(.spacingM)
    }
  }
}
#endif
