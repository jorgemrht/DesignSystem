import SwiftUI

public enum JdsButtonSize: Sendable, CaseIterable {
  case small
  case medium
  case large

  var minHeight: CGFloat {
    switch self {
    case .small: .controlSizeS
    case .medium: .controlSizeM
    case .large: .controlSizeL
    }
  }

  var horizontalPadding: CGFloat {
    switch self {
    case .small: .spacingS
    case .medium: .spacingM
    case .large: .spacingL
    }
  }

  var labelFont: Font {
    switch self {
    case .small: .callout
    case .medium, .large: .body
    }
  }
}
