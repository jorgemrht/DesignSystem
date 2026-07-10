import SwiftUI

public enum JdsFABButtonSize: Sendable, CaseIterable {
  case small
  case medium
  case large

  var size: CGFloat {
    switch self {
    case .small: .controlSizeS
    case .medium: .controlSizeL
    case .large: .controlSizeXL
    }
  }

  func size(scaledBy dynamicTypeScale: CGFloat) -> CGFloat {
    max(size, size * dynamicTypeScale)
  }

  func iconFont(scaledBy dynamicTypeScale: CGFloat) -> Font {
    .system(size: max(iconSize, iconSize * dynamicTypeScale))
  }

  private var iconSize: CGFloat {
    switch self {
    case .small, .medium: .iconSizeM
    case .large: .iconSizeL
    }
  }
}
