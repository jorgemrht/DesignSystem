#if DEBUG
import SwiftUI

private struct JdsIconButtonPreviewItem: View {
  let title: String
  let systemImage: String
  let prominence: JdsIconButtonProminence
  let size: JdsIconButtonSize
  let isDisabled: Bool

  var body: some View {
    VStack(spacing: .spacingXXS) {
      JdsIconButton(
        title,
        systemImage: systemImage,
        prominence: prominence,
        size: size,
        isEnabled: !isDisabled
      ) {}

      Text(title)
        .font(.caption)
        .foregroundStyle(.dsOnSurfaceVariant)
    }
  }
}

private struct JdsIconButtonPreviewRow: View {
  let titlePrefix: String
  let size: JdsIconButtonSize
  let isDisabled: Bool

  var body: some View {
    HStack(alignment: .top, spacing: .spacingS) {
      JdsIconButtonPreviewItem(
        title: "\(titlePrefix) plain",
        systemImage: "magnifyingglass",
        prominence: .plain,
        size: size,
        isDisabled: isDisabled
      )

      JdsIconButtonPreviewItem(
        title: "\(titlePrefix) bordered",
        systemImage: "ellipsis",
        prominence: .bordered,
        size: size,
        isDisabled: isDisabled
      )

      JdsIconButtonPreviewItem(
        title: "\(titlePrefix) prominent",
        systemImage: "checkmark",
        prominence: .borderedProminent,
        size: size,
        isDisabled: isDisabled
      )
    }
  }
}

private struct JdsIconButtonPreviewSection: View {
  let title: String
  let isDisabled: Bool

  var body: some View {
    VStack(alignment: .leading, spacing: .spacingS) {
      Text(title)
        .font(.headline)
        .foregroundStyle(.dsOnSurface)

      JdsIconButtonPreviewRow(
        titlePrefix: "\(title) small",
        size: .small,
        isDisabled: isDisabled
      )

      JdsIconButtonPreviewRow(
        titlePrefix: "\(title) medium",
        size: .medium,
        isDisabled: isDisabled
      )

      JdsIconButtonPreviewRow(
        titlePrefix: "\(title) large",
        size: .large,
        isDisabled: isDisabled
      )
    }
  }
}

struct JdsIconButtonMock: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: .spacingL) {
        JdsIconButtonPreviewSection(title: "Enabled", isDisabled: false)
        JdsIconButtonPreviewSection(title: "Disabled", isDisabled: true)

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
          }
        }
      }
      .padding(.spacingM)
    }
  }
}
#endif
