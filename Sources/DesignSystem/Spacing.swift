// Sources/DesignSystem/Spacing.swift

import CoreGraphics

public enum Spacing {
  case xxs, xs, sm, md, lg, xl, xxl

  public var value: CGFloat {
    switch self {
      case .xxs: return 4
      case .xs:  return 8
      case .sm:  return 12
      case .md:  return 16
      case .lg:  return 24
      case .xl:  return 32
      case .xxl: return 48
    }
  }
}

public extension CGFloat {
  static func spacing(_ s: Spacing) -> CGFloat {
    return s.value
  }
}
