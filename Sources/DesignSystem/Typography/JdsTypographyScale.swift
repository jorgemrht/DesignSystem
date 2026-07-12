import SwiftUI

public enum JdsTypographyScale: Hashable, Sendable {
  case small
  case standard
  case large
  case custom(CGFloat)

  public var factor: CGFloat {
    switch self {
    case .small: 0.9
    case .standard: 1
    case .large: 1.15
    case let .custom(factor):
      factor.isFinite && factor > 0 ? factor : 1
    }
  }

  public static let predefined: [JdsTypographyScale] = [
    .small,
    .standard,
    .large,
  ]
}
