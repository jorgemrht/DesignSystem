import SwiftUI

public struct JdsButtonShadow: Sendable {
  public let color: Color
  public let radius: CGFloat
  public let x: CGFloat
  public let y: CGFloat

  public init(
    color: Color,
    radius: CGFloat,
    x: CGFloat = 0,
    y: CGFloat
  ) {
    self.color = color
    self.radius = radius
    self.x = x
    self.y = y
  }

  public static let floating = JdsButtonShadow(
    color: .dsScrim.opacity(0.22),
    radius: 10,
    y: 4
  )
}
