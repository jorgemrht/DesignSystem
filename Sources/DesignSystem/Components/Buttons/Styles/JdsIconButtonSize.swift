import SwiftUI

public enum JdsIconButtonSize: Sendable, CaseIterable {
  case small
  case medium
  case large

  var size: CGFloat {
    switch self {
    case .small: .controlSizeS
    case .medium: .controlSizeM
    case .large: .controlSizeL
    }
  }

  var iconFont: Font {
    switch self {
    case .small: .body
    case .medium: .title3
    case .large: .title2
    }
  }
}
