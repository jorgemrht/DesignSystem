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

  var iconFont: CGFloat {
    switch self {
    case .small, .medium: .iconSizeM
    case .large: .iconSizeL
    }
  }
}
