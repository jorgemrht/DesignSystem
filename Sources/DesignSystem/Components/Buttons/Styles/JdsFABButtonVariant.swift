import SwiftUI

public enum JdsFABButtonVariant: Sendable, CaseIterable {
  case primary
  case secondary
  case tertiary

  var foreground: Color {
    switch self {
    case .primary: .dsOnPrimaryContainer
    case .secondary: .dsOnSecondaryContainer
    case .tertiary: .dsOnTertiaryContainer
    }
  }

  var background: Color {
    switch self {
    case .primary: .dsPrimaryContainer
    case .secondary: .dsSecondaryContainer
    case .tertiary: .dsTertiaryContainer
    }
  }

  var disabledBackground: Color {
    switch self {
    case .primary:
      .dsPrimaryContainer.opacity(0.38)
    case .secondary:
      .dsSecondaryContainer.opacity(0.38)
    case .tertiary:
      .dsTertiaryContainer.opacity(0.38)
    }
  }

  var appearance: JdsButtonAppearance {
    JdsButtonAppearance(
      foreground: foreground,
      background: background,
      pressedOverlay: foreground,
      disabledForeground: foreground.opacity(0.38),
      disabledBackground: disabledBackground,
      disabledBorder: nil
    )
  }
}
