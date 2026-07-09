import SwiftUI

public enum JdsIconButtonProminence: Sendable, CaseIterable {
  case plain
  case bordered
  case borderedProminent

  var appearance: JdsButtonAppearance {
    switch self {
    case .plain:
      .iconPlain
    case .bordered:
      .iconBordered
    case .borderedProminent:
      .iconProminent
    }
  }
}

public extension JdsButtonAppearance {
  static let iconPlain = JdsButtonAppearance(
    foreground: .dsOnSurfaceVariant,
    background: nil,
    pressedOverlay: .dsOnSurfaceVariant,
    disabledForeground: .dsOnSurfaceVariant.opacity(0.38),
    disabledBackground: nil,
    disabledBorder: nil
  )

  static let iconBordered = JdsButtonAppearance(
    foreground: .dsPrimary,
    background: nil,
    border: .dsOutline,
    pressedOverlay: .dsPrimary,
    disabledForeground: .dsPrimary.opacity(0.38),
    disabledBackground: nil,
    disabledBorder: .dsPrimary.opacity(0.24)
  )

  static let iconProminent = JdsButtonAppearance(
    foreground: .dsOnPrimary,
    background: .dsPrimary,
    pressedOverlay: .dsOnPrimary,
    disabledForeground: .dsOnPrimary.opacity(0.55),
    disabledBackground: .dsPrimary.opacity(0.38),
    disabledBorder: nil
  )
}
